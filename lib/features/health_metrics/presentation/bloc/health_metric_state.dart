part of 'health_metric_bloc.dart';

@freezed
class HealthMetricState with _$HealthMetricState {
  const factory HealthMetricState.initial() = _Initial;
  const factory HealthMetricState.loading() = _Loading;
  const factory HealthMetricState.loaded(List<HealthMetric> metrics) = _Loaded;
  const factory HealthMetricState.error(String message) = _Error;
}
