import 'package:injectable/injectable.dart';
import '../repositories/appointment_repository.dart';

@lazySingleton
class DeleteAppointment {
  final AppointmentRepository _repository;

  DeleteAppointment(this._repository);

  Future<void> call(int id) {
    return _repository.deleteAppointment(id);
  }
}
