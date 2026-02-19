import 'package:injectable/injectable.dart';
import '../entities/prescription.dart';
import '../repositories/prescription_repository.dart';

@lazySingleton
class UpdatePrescription {
  final PrescriptionRepository _repository;

  UpdatePrescription(this._repository);

  Future<void> call(Prescription prescription) async {
    return _repository.updatePrescription(prescription);
  }
}
