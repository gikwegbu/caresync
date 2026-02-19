import 'package:injectable/injectable.dart';
import '../repositories/prescription_repository.dart';

@lazySingleton
class DeletePrescription {
  final PrescriptionRepository _repository;

  DeletePrescription(this._repository);

  Future<void> call(int id) {
    return _repository.deletePrescription(id);
  }
}
