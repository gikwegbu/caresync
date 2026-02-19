import 'package:injectable/injectable.dart';
import '../entities/health_metric.dart';
import '../repositories/health_metric_repository.dart';

@lazySingleton
class UpdateMetric {
  final HealthMetricRepository _repository;

  UpdateMetric(this._repository);

  Future<void> call(HealthMetric metric) {
    return _repository.updateMetric(metric);
  }
}
