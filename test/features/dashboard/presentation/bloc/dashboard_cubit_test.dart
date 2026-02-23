import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:care_sync/features/dashboard/presentation/bloc/dashboard_cubit.dart';
import 'package:care_sync/features/appointments/domain/usecases/watch_appointments.dart';
import 'package:care_sync/features/prescriptions/domain/usecases/watch_prescriptions.dart';
import 'package:care_sync/features/health_metrics/domain/usecases/get_health_metrics.dart';
import 'package:care_sync/features/health_metrics/domain/entities/health_metric.dart';

class MockWatchAppointments extends Mock implements WatchAppointments {}

class MockWatchPrescriptions extends Mock implements WatchPrescriptions {}

class MockGetHealthMetrics extends Mock implements GetHealthMetrics {}

void main() {
  group('DashboardCubit', () {
    late DashboardCubit dashboardCubit;
    late MockWatchAppointments mockWatchAppointments;
    late MockWatchPrescriptions mockWatchPrescriptions;
    late MockGetHealthMetrics mockGetHealthMetrics;

    setUp(() {
      mockWatchAppointments = MockWatchAppointments();
      mockWatchPrescriptions = MockWatchPrescriptions();
      mockGetHealthMetrics = MockGetHealthMetrics();

      when(() => mockGetHealthMetrics()).thenAnswer((_) async => []);
      when(() => mockWatchAppointments())
          .thenAnswer((_) => const Stream.empty());
      when(() => mockWatchPrescriptions())
          .thenAnswer((_) => const Stream.empty());

      dashboardCubit = DashboardCubit(
        mockWatchAppointments,
        mockWatchPrescriptions,
        mockGetHealthMetrics,
      );
    });

    tearDown(() {
      dashboardCubit.close();
    });

    test('initial state is DashboardState.initial()', () {
      expect(dashboardCubit.state, const DashboardState.initial());
    });

    test('emits [loading, loaded] when loadDashboardData is called', () async {
      when(() => mockGetHealthMetrics()).thenAnswer((_) async => [
            HealthMetric(
              id: 1,
              type: 'heart_rate',
              value: 75.0,
              unit: 'bpm',
              recordedAt: DateTime.now(),
            )
          ]);
      when(() => mockWatchAppointments()).thenAnswer((_) => Stream.value([]));
      when(() => mockWatchPrescriptions()).thenAnswer((_) => Stream.value([]));

      final expectedStates = [
        const DashboardState.loading(),
        const DashboardState.loaded(
          userName: 'George',
          upcomingAppointmentCount: 0,
          pendingPrescriptionsCount: 0,
          latestMetric: '75.0 bpm',
        ),
      ];

      expectLater(dashboardCubit.stream, emitsInOrder(expectedStates));
      await dashboardCubit.loadDashboardData();
    });
  });
}
