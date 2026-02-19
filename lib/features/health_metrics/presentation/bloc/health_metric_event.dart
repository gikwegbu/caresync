part of 'health_metric_bloc.dart';

@freezed
class HealthMetricEvent with _$HealthMetricEvent {
  const factory HealthMetricEvent.loadMetrics() = _LoadMetrics;
  const factory HealthMetricEvent.logMetric(HealthMetric metric) = _LogMetric;
}
