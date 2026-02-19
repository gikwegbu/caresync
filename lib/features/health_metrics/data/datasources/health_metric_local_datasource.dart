import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import '../models/health_metric_model.dart';

abstract class HealthMetricLocalDataSource {
  Future<List<HealthMetricModel>> getAllMetrics();
  Future<List<HealthMetricModel>> getMetricsByType(String type);
  Future<void> cacheMetric(HealthMetricModel metric);
  Future<void> deleteMetric(int id);
}

@LazySingleton(as: HealthMetricLocalDataSource)
class IsarHealthMetricDataSource implements HealthMetricLocalDataSource {
  final Isar _isar;

  IsarHealthMetricDataSource(this._isar);

  @override
  Future<List<HealthMetricModel>> getAllMetrics() async {
    return _isar.healthMetricModels.where().sortByRecordedAtDesc().findAll();
  }

  @override
  Future<List<HealthMetricModel>> getMetricsByType(String type) async {
    return _isar.healthMetricModels
        .filter()
        .typeEqualTo(type)
        .sortByRecordedAtDesc()
        .findAll();
  }

  @override
  Future<void> cacheMetric(HealthMetricModel metric) async {
    await _isar.writeTxn(() async {
      await _isar.healthMetricModels.put(metric);
    });
  }

  @override
  Future<void> deleteMetric(int id) async {
    await _isar.writeTxn(() async {
      await _isar.healthMetricModels.delete(id);
    });
  }
}
