import 'dart:async';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:care_sync/features/intro/domain/repositories/intro_repository.dart';
import 'package:care_sync/features/intro/domain/usecases/check_onboarding_status.dart';
import 'package:care_sync/features/intro/domain/usecases/complete_onboarding.dart';
import 'package:care_sync/features/intro/presentation/bloc/intro_bloc.dart';

class MockCheckOnboardingStatus extends Mock implements CheckOnboardingStatus {}

class MockCompleteOnboarding extends Mock implements CompleteOnboarding {}

class MockIntroRepository extends Mock implements IntroRepository {}

void main() {
  late IntroBloc introBloc;
  late MockCheckOnboardingStatus mockCheckOnboardingStatus;
  late MockCompleteOnboarding mockCompleteOnboarding;
  late MockIntroRepository mockIntroRepository;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    mockCheckOnboardingStatus = MockCheckOnboardingStatus();
    mockCompleteOnboarding = MockCompleteOnboarding();
    mockIntroRepository = MockIntroRepository();

    // Default mock behavior
    when(() => mockIntroRepository.isBiometricEnabled())
        .thenAnswer((_) async => false);

    introBloc = IntroBloc(
      mockCheckOnboardingStatus,
      mockCompleteOnboarding,
      mockIntroRepository,
    );
  });

  tearDown(() {
    introBloc.close();
  });

  group('IntroBloc Disclaimer Logic', () {
    test(
      'emits [loading, disclaimerRequired] when onboarding is completed but disclaimer is not accepted',
      () async {
        // Arrange
        when(() => mockCheckOnboardingStatus()).thenAnswer((_) async => true);

        // Assert later
        final states = <IntroState>[];
        final subscription = introBloc.stream.listen(states.add);

        // Act
        introBloc.add(const IntroEvent.checkStatus());

        // Wait for artificial delay + buffer
        await Future.delayed(const Duration(milliseconds: 2500));

        // Verify
        expect(states.length, 2);
        expect(states[0], const IntroState.loading());
        expect(
          states[1].maybeMap(
            disclaimerRequired: (d) => d.timestamp > 0,
            orElse: () => false,
          ),
          isTrue,
        );

        await subscription.cancel();
      },
    );

    test(
      'emits [disclaimerRequired] when onboarding is completed via _Complete event',
      () async {
        // Arrange
        when(() => mockCompleteOnboarding()).thenAnswer((_) async {});

        // Assert later
        final states = <IntroState>[];
        final subscription = introBloc.stream.listen(states.add);

        // Act
        introBloc.add(const IntroEvent.complete());

        // Wait for async execution
        await Future.delayed(const Duration(milliseconds: 100));

        // Verify
        expect(states.length, 1);
        expect(
          states[0].maybeMap(
            disclaimerRequired: (d) => d.timestamp > 0,
            orElse: () => false,
          ),
          isTrue,
        );

        await subscription.cancel();
      },
    );
  });
}
