import 'package:injectable/injectable.dart';
import '../entities/health_metric.dart';
import '../repositories/health_metric_repository.dart';

@lazySingleton
class LogHealthMetric {
  final HealthMetricRepository _repository;

  LogHealthMetric(this._repository);

  Future<void> call(HealthMetric metric) => _repository.logMetric(metric);
}
