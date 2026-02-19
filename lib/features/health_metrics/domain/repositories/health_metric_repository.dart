import '../entities/health_metric.dart';

abstract class HealthMetricRepository {
  Future<List<HealthMetric>> getRecentMetrics(
      String type); // Get history for a specific type
  Future<List<HealthMetric>>
      getAllMetrics(); // Get all specific latest or summary
  Future<void> logMetric(HealthMetric metric);
  Future<void> updateMetric(HealthMetric metric);
  Future<void> deleteMetric(int id);
}
