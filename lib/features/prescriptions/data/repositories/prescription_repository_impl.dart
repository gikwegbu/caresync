import 'package:injectable/injectable.dart';
import '../../domain/entities/prescription.dart';
import '../../domain/repositories/prescription_repository.dart';
import '../datasources/prescription_local_datasource.dart';
import '../mappers/prescription_mapper.dart';

@LazySingleton(as: PrescriptionRepository)
class PrescriptionRepositoryImpl implements PrescriptionRepository {
  final PrescriptionLocalDataSource _dataSource;

  PrescriptionRepositoryImpl(this._dataSource);

  @override
  Future<List<Prescription>> getPrescriptions() async {
    final models = await _dataSource.getPrescriptions();
    return models.map((e) => e.toEntity()).toList();
  }

  @override
  Stream<List<Prescription>> getPrescriptionsStream() {
    return _dataSource.getPrescriptionsStream().map((models) {
      return models.map((e) => e.toEntity()).toList();
    });
  }

  @override
  Future<void> addPrescription(Prescription prescription) async {
    await _dataSource.cachePrescription(prescription.toModel());
  }

  @override
  Future<void> updatePrescription(Prescription prescription) async {
    await _dataSource.cachePrescription(prescription.toModel());
  }

  @override
  Future<void> toggleReminder(int id, bool enabled) async {
    final model = await _dataSource.getPrescriptionById(id);
    if (model != null) {
      model.reminderEnabled = enabled;
      await _dataSource.cachePrescription(model);
    }
  }

  @override
  Future<void> requestRepeatPrescription(int id) async {
    // In a real app, this would make an API call.
    // Here we might just log it or update a 'lastRequested' field if we had one.
    // For now, we simulate success.
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Future<void> deletePrescription(int id) async {
    await _dataSource.deletePrescription(id);
  }
}
