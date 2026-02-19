part of 'appointment_bloc.dart';

@freezed
class AppointmentState with _$AppointmentState {
  const factory AppointmentState.initial() = _Initial;
  const factory AppointmentState.loading() = _Loading;
  const factory AppointmentState.loaded(List<Appointment> appointments) =
      _Loaded;
  const factory AppointmentState.error(String message) = _Error;
}
