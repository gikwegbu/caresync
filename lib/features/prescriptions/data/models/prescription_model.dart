import 'package:isar/isar.dart';

part 'prescription_model.g.dart';

@collection
class PrescriptionModel {
  Id id = Isar.autoIncrement;

  late String medicationName;
  late String dosage;
  late String frequency;
  late DateTime startDate;
  late DateTime endDate;

  bool reminderEnabled = false;

  @Index()
  late String status; // 'active', 'completed'
}
