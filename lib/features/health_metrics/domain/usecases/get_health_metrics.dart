import 'package:injectable/injectable.dart';
import '../entities/health_metric.dart';
import '../repositories/health_metric_repository.dart';

@lazySingleton
class GetHealthMetrics {
  final HealthMetricRepository _repository;

  GetHealthMetrics(this._repository);

  // Get all metrics (perhaps for dashboard summary or list)
  Future<List<HealthMetric>> call() => _repository.getAllMetrics();

  Future<List<HealthMetric>> byType(String type) =>
      _repository.getRecentMetrics(type);
}
