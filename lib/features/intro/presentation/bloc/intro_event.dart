part of 'intro_bloc.dart';

@freezed
class IntroEvent with _$IntroEvent {
  const factory IntroEvent.checkStatus() = _CheckStatus;
  const factory IntroEvent.complete() = _Complete;
}
