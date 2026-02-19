part of 'dashboard_cubit.dart';

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState.initial() = _Initial;
  const factory DashboardState.loading() = _Loading;
  const factory DashboardState.loaded({
    required String userName,
    required int upcomingAppointmentCount,
    required int pendingPrescriptionsCount,
    required String latestMetric,
  }) = _Loaded;
  const factory DashboardState.error(String message) = _Error;
}
