part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _Initial;
  const factory ProfileState.loading() = _Loading;
  const factory ProfileState.loaded({
    required UserProfile profile,
    @Default(false) bool isBiometricEnabled,
  }) = _Loaded;
  const factory ProfileState.empty() = _Empty;
  const factory ProfileState.error(String message) = _Error;
}
