abstract class IntroRepository {
  Future<bool> isOnboardingCompleted();
  Future<void> completeOnboarding();
  Future<bool> isBiometricEnabled();
  Future<void> setBiometricEnabled(bool enabled);
}
