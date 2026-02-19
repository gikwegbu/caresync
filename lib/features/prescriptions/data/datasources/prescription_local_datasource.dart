import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import '../models/prescription_model.dart';

abstract class PrescriptionLocalDataSource {
  Future<List<PrescriptionModel>> getPrescriptions();
  Future<PrescriptionModel?> getPrescriptionById(int id);
  Future<void> cachePrescription(PrescriptionModel prescription);
  Future<void> deletePrescription(int id);
  Stream<List<PrescriptionModel>> getPrescriptionsStream();
}

@LazySingleton(as: PrescriptionLocalDataSource)
class IsarPrescriptionDataSource implements PrescriptionLocalDataSource {
  final Isar _isar;

  IsarPrescriptionDataSource(this._isar);

  @override
  Future<List<PrescriptionModel>> getPrescriptions() async {
    return _isar.prescriptionModels.where().findAll();
  }

  @override
  Future<PrescriptionModel?> getPrescriptionById(int id) async {
    return _isar.prescriptionModels.get(id);
  }

  @override
  Future<void> cachePrescription(PrescriptionModel prescription) async {
    await _isar.writeTxn(() async {
      await _isar.prescriptionModels.put(prescription);
    });
  }

  @override
  Future<void> deletePrescription(int id) async {
    await _isar.writeTxn(() async {
      await _isar.prescriptionModels.delete(id);
    });
  }

  @override
  Stream<List<PrescriptionModel>> getPrescriptionsStream() {
    return _isar.prescriptionModels.where().watch(fireImmediately: true);
  }
}
