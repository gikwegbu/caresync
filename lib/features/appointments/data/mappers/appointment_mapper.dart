import 'package:isar/isar.dart';
import '../models/appointment_model.dart';
import '../../domain/entities/appointment.dart';

extension AppointmentModelX on AppointmentModel {
  Appointment toEntity() {
    return Appointment(
      id: id,
      doctorName: doctorName,
      specialty: specialty,
      dateTime: dateTime,
      location: location,
      status: status,
      notes: notes,
    );
  }
}

extension AppointmentX on Appointment {
  AppointmentModel toModel() {
    return AppointmentModel()
      ..id = id ?? Isar.autoIncrement
      ..doctorName = doctorName
      ..specialty = specialty
      ..dateTime = dateTime
      ..location = location
      ..status = status
      ..notes = notes
      ..createdAt = DateTime.now();
  }
}
