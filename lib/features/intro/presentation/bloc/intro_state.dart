part of 'intro_bloc.dart';

@freezed
class IntroState with _$IntroState {
  const factory IntroState.initial() = _Initial;
  const factory IntroState.loading() = _Loading;
  const factory IntroState.required() = _Required;
  const factory IntroState.completed() = _Completed;
}
