import '../entities/appointment.dart';

abstract class AppointmentRepository {
  Future<List<Appointment>> getAppointments();
  Future<void> bookAppointment(Appointment appointment);
  Future<void> cancelAppointment(int id);
  Future<void> rescheduleAppointment(int id, DateTime newDateTime);
}
