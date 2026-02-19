import 'package:injectable/injectable.dart';
import '../entities/prescription.dart';
import '../repositories/prescription_repository.dart';

@lazySingleton
class GetPrescriptions {
  final PrescriptionRepository _repository;

  GetPrescriptions(this._repository);

  Future<List<Prescription>> call() => _repository.getPrescriptions();
}
