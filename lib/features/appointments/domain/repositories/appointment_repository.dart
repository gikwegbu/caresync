import '../entities/appointment.dart';

abstract class AppointmentRepository {
  Future<List<Appointment>> getAppointments();
  Stream<List<Appointment>> getAppointmentsStream();
  Future<void> bookAppointment(Appointment appointment);
  Future<void> cancelAppointment(int id);
  Future<void> rescheduleAppointment(int id, DateTime newDateTime);
  Future<void> deleteAppointment(int id);
  Future<void> updateAppointment(Appointment appointment);
}
