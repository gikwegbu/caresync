part of 'appointment_bloc.dart';

@freezed
class AppointmentEvent with _$AppointmentEvent {
  const factory AppointmentEvent.loadAppointments() = _LoadAppointments;
  const factory AppointmentEvent.bookAppointment(Appointment appointment) =
      _BookNewAppointment;
  const factory AppointmentEvent.cancelAppointment(int id) = _CancelAppointment;
  const factory AppointmentEvent.deleteAppointment(int id) = _DeleteAppointment;
  const factory AppointmentEvent.updateAppointment(Appointment appointment) =
      _UpdateAppointment;
}
