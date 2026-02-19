import 'package:injectable/injectable.dart';
import '../entities/prescription.dart';
import '../repositories/prescription_repository.dart';

@lazySingleton
class AddPrescription {
  final PrescriptionRepository _repository;

  AddPrescription(this._repository);

  Future<void> call(Prescription prescription) async {
    return _repository.addPrescription(prescription);
  }
}
