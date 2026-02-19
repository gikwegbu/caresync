import 'package:injectable/injectable.dart';
import '../../domain/entities/appointment.dart';
import '../../domain/repositories/appointment_repository.dart';
import '../datasources/appointment_local_datasource.dart';
import '../models/appointment_model.dart';
import '../mappers/appointment_mapper.dart'; // Ensure generated file is imported

@LazySingleton(as: AppointmentRepository)
class AppointmentRepositoryImpl implements AppointmentRepository {
  final AppointmentLocalDataSource _dataSource;

  AppointmentRepositoryImpl(this._dataSource);

  @override
  Future<List<Appointment>> getAppointments() async {
    final models = await _dataSource.getAppointments();
    return models.map((e) => e.toEntity()).toList();
  }

  @override
  Stream<List<Appointment>> getAppointmentsStream() {
    return _dataSource.getAppointmentsStream().map((models) {
      return models.map((e) => e.toEntity()).toList();
    });
  }

  @override
  Future<void> bookAppointment(Appointment appointment) async {
    final model = AppointmentModel()
      ..doctorName = appointment.doctorName
      ..specialty = appointment.specialty
      ..dateTime = appointment.dateTime
      ..location = appointment.location
      ..status = appointment.status
      ..notes = appointment.notes
      ..createdAt = DateTime.now();

    if (appointment.id != null) {
      model.id = appointment.id!;
    }

    await _dataSource.cacheAppointment(model);
  }

  @override
  Future<void> cancelAppointment(int id) async {
    final appointment = await _dataSource.getAppointmentById(id);
    if (appointment != null) {
      appointment.status = 'cancelled';
      await _dataSource.cacheAppointment(appointment);
    }
  }

  @override
  Future<void> rescheduleAppointment(int id, DateTime newDateTime) async {
    final appointment = await _dataSource.getAppointmentById(id);
    if (appointment != null) {
      appointment.dateTime = newDateTime;
      appointment.status = 'upcoming';
      await _dataSource.cacheAppointment(appointment);
    }
  }

  @override
  Future<void> deleteAppointment(int id) async {
    await _dataSource.deleteAppointment(id);
  }

  @override
  Future<void> updateAppointment(Appointment appointment) async {
    // Reuse bookAppointment logic since it handles ID check for update vs create
    // But explicitly mapping here ensures we are using the passed appointment data
    await bookAppointment(appointment);
  }
}
