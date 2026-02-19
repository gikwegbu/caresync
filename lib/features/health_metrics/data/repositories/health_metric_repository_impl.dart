import 'package:injectable/injectable.dart';
import '../../domain/entities/health_metric.dart';
import '../../domain/repositories/health_metric_repository.dart';
import '../datasources/health_metric_local_datasource.dart';
import '../mappers/health_metric_mapper.dart';

@LazySingleton(as: HealthMetricRepository)
class HealthMetricRepositoryImpl implements HealthMetricRepository {
  final HealthMetricLocalDataSource _dataSource;

  HealthMetricRepositoryImpl(this._dataSource);

  @override
  Future<List<HealthMetric>> getAllMetrics() async {
    final models = await _dataSource.getAllMetrics();
    return models.map((e) => e.toEntity()).toList();
  }

  @override
  Future<List<HealthMetric>> getRecentMetrics(String type) async {
    final models = await _dataSource.getMetricsByType(type);
    return models.map((e) => e.toEntity()).toList();
  }

  @override
  Future<void> logMetric(HealthMetric metric) async {
    await _dataSource.cacheMetric(metric.toModel());
  }

  @override
  Future<void> deleteMetric(int id) async {
    await _dataSource.deleteMetric(id);
  }
}
