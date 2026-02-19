import 'package:injectable/injectable.dart';
import '../entities/appointment.dart';
import '../repositories/appointment_repository.dart';

@lazySingleton
class BookAppointment {
  final AppointmentRepository _repository;

  BookAppointment(this._repository);

  Future<void> call(Appointment appointment) =>
      _repository.bookAppointment(appointment);
}
