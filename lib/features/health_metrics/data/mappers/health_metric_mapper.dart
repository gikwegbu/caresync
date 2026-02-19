import 'package:isar/isar.dart';
import '../models/health_metric_model.dart';
import '../../domain/entities/health_metric.dart';

extension HealthMetricModelX on HealthMetricModel {
  HealthMetric toEntity() {
    return HealthMetric(
      id: id,
      type: type,
      value: value,
      unit: unit,
      recordedAt: recordedAt,
      notes: notes,
    );
  }
}

extension HealthMetricX on HealthMetric {
  HealthMetricModel toModel() {
    return HealthMetricModel()
      ..id = id ?? Isar.autoIncrement
      ..type = type
      ..value = value
      ..unit = unit
      ..recordedAt = recordedAt
      ..notes = notes;
  }
}
