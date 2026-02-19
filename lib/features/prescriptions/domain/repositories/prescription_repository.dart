import '../entities/prescription.dart';

abstract class PrescriptionRepository {
  Future<List<Prescription>> getPrescriptions();
  Future<void> addPrescription(Prescription prescription);
  Future<void> updatePrescription(Prescription prescription);
  Future<void> toggleReminder(int id, bool enabled);
  Future<void> requestRepeatPrescription(int id);
}
