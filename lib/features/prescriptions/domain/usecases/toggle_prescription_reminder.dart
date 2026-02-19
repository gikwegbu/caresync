import 'package:injectable/injectable.dart';
import '../repositories/prescription_repository.dart';

@lazySingleton
class TogglePrescriptionReminder {
  final PrescriptionRepository _repository;

  TogglePrescriptionReminder(this._repository);

  Future<void> call(int id, bool enabled) =>
      _repository.toggleReminder(id, enabled);
}
