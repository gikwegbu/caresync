import 'package:injectable/injectable.dart';
import '../entities/prescription.dart';
import '../repositories/prescription_repository.dart';

@lazySingleton
class WatchPrescriptions {
  final PrescriptionRepository _repository;

  WatchPrescriptions(this._repository);

  Stream<List<Prescription>> call() => _repository.getPrescriptionsStream();
}
