import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/usecases/check_onboarding_status.dart';
import '../../domain/usecases/complete_onboarding.dart';

part 'intro_bloc.freezed.dart';
part 'intro_event.dart';
part 'intro_state.dart';

@injectable
class IntroBloc extends Bloc<IntroEvent, IntroState> {
  final CheckOnboardingStatus _checkOnboardingStatus;
  final CompleteOnboarding _completeOnboarding;

  IntroBloc(this._checkOnboardingStatus, this._completeOnboarding)
      : super(const IntroState.initial()) {
    on<_CheckStatus>(_onCheckStatus);
    on<_Complete>(_onComplete);
    on<_AcceptDisclaimer>(_onAcceptDisclaimer);
  }

  Future<void> _onCheckStatus(
      _CheckStatus event, Emitter<IntroState> emit) async {
    emit(const IntroState.loading());
    // Artificial delay for splash screen
    await Future.delayed(const Duration(seconds: 2));
    final isCompleted = await _checkOnboardingStatus();
    if (isCompleted) {
      final prefs = await SharedPreferences.getInstance();
      final disclaimerAccepted = prefs.getBool('disclaimer_accepted') ?? false;

      if (!disclaimerAccepted) {
        emit(const IntroState.disclaimerRequired());
      } else {
        emit(const IntroState.completed());
      }
    } else {
      emit(const IntroState.required());
    }
  }

  Future<void> _onComplete(_Complete event, Emitter<IntroState> emit) async {
    await _completeOnboarding();

    // Auto-accept disclaimer if onboarding just completed? Let's explicitly demand it anyway just to be safe.
    final prefs = await SharedPreferences.getInstance();
    final disclaimerAccepted = prefs.getBool('disclaimer_accepted') ?? false;

    if (!disclaimerAccepted) {
      emit(const IntroState.disclaimerRequired());
    } else {
      emit(const IntroState.completed());
    }
  }

  Future<void> _onAcceptDisclaimer(
      _AcceptDisclaimer event, Emitter<IntroState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('disclaimer_accepted', true);
    emit(const IntroState.completed());
  }
}
