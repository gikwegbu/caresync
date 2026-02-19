import 'package:injectable/injectable.dart';
import '../repositories/appointment_repository.dart';

@lazySingleton
class CancelAppointment {
  final AppointmentRepository _repository;

  CancelAppointment(this._repository);

  Future<void> call(int id) => _repository.cancelAppointment(id);
}
