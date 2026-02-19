import 'package:isar/isar.dart';

part 'health_metric_model.g.dart';

@collection
class HealthMetricModel {
  Id id = Isar.autoIncrement;

  @Index()
  late String type; // 'blood_pressure', 'heart_rate', 'weight', 'blood_sugar'

  late double value;
  String? unit;

  @Index()
  late DateTime recordedAt;

  String? notes;
}
