import 'package:isar/isar.dart';
import '../models/prescription_model.dart';
import '../../domain/entities/prescription.dart';

extension PrescriptionModelX on PrescriptionModel {
  Prescription toEntity() {
    return Prescription(
      id: id,
      medicationName: medicationName,
      dosage: dosage,
      frequency: frequency,
      startDate: startDate,
      endDate: endDate,
      reminderEnabled: reminderEnabled,
      status: status,
    );
  }
}

extension PrescriptionX on Prescription {
  PrescriptionModel toModel() {
    return PrescriptionModel()
      ..id = id ?? Isar.autoIncrement
      ..medicationName = medicationName
      ..dosage = dosage
      ..frequency = frequency
      ..startDate = startDate
      ..endDate = endDate
      ..reminderEnabled = reminderEnabled
      ..status = status;
  }
}
