import 'package:injectable/injectable.dart';
import '../entities/appointment.dart';
import '../repositories/appointment_repository.dart';

@lazySingleton
class UpdateAppointment {
  final AppointmentRepository _repository;

  UpdateAppointment(this._repository);

  Future<void> call(Appointment appointment) {
    return _repository.updateAppointment(appointment);
  }
}
