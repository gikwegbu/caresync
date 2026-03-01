import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../../features/intro/domain/repositories/intro_repository.dart';
import '../../domain/entities/user_profile.dart';
import '../../domain/usecases/get_user_profile.dart';
import '../../domain/usecases/save_user_profile.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetUserProfile _getUserProfile;
  final SaveUserProfile _saveUserProfile;
  final IntroRepository _introRepository;

  ProfileBloc(
    this._getUserProfile,
    this._saveUserProfile,
    this._introRepository,
  ) : super(const ProfileState.initial()) {
    on<_LoadProfile>(_onLoadProfile);
    on<_SaveProfile>(_onSaveProfile);
    on<_ToggleBiometric>(_onToggleBiometric);
  }

  Future<void> _onLoadProfile(
    _LoadProfile event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const ProfileState.loading());
    try {
      final profile = await _getUserProfile();
      final isBiometricEnabled = await _introRepository.isBiometricEnabled();
      if (profile != null) {
        emit(ProfileState.loaded(
          profile: profile,
          isBiometricEnabled: isBiometricEnabled,
        ));
      } else {
        emit(const ProfileState.empty());
      }
    } catch (e) {
      emit(ProfileState.error(e.toString()));
    }
  }

  Future<void> _onSaveProfile(
    _SaveProfile event,
    Emitter<ProfileState> emit,
  ) async {
    // Optimistic or loading? Let's do loading for profile save
    emit(const ProfileState.loading());
    try {
      await _saveUserProfile(event.profile);
      final isBiometricEnabled = await _introRepository.isBiometricEnabled();
      emit(ProfileState.loaded(
        profile: event.profile,
        isBiometricEnabled: isBiometricEnabled,
      ));
    } catch (e) {
      emit(ProfileState.error(e.toString()));
    }
  }

  Future<void> _onToggleBiometric(
    _ToggleBiometric event,
    Emitter<ProfileState> emit,
  ) async {
    final currentState = state;
    if (currentState is _Loaded) {
      try {
        await _introRepository.setBiometricEnabled(event.enabled);
        emit(currentState.copyWith(isBiometricEnabled: event.enabled));
      } catch (e) {
        emit(ProfileState.error(e.toString()));
      }
    }
  }
}
