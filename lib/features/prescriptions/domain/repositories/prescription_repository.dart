import '../entities/prescription.dart';

abstract class PrescriptionRepository {
  Future<List<Prescription>> getPrescriptions();
  Stream<List<Prescription>> getPrescriptionsStream();
  Future<void> addPrescription(Prescription prescription);
  Future<void> updatePrescription(Prescription prescription);
  Future<void> toggleReminder(int id, bool enabled);
  Future<void> requestRepeatPrescription(int id);
  Future<void> deletePrescription(int id);
}
