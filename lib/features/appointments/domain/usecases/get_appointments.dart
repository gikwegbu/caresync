import 'package:injectable/injectable.dart';
import '../entities/appointment.dart';
import '../repositories/appointment_repository.dart';

@lazySingleton
class GetAppointments {
  final AppointmentRepository _repository;

  GetAppointments(this._repository);

  Future<List<Appointment>> call() => _repository.getAppointments();
}
