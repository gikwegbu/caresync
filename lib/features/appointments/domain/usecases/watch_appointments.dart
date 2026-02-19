import 'package:injectable/injectable.dart';
import '../entities/appointment.dart';
import '../repositories/appointment_repository.dart';

@lazySingleton
class WatchAppointments {
  final AppointmentRepository _repository;

  WatchAppointments(this._repository);

  Stream<List<Appointment>> call() => _repository.getAppointmentsStream();
}
