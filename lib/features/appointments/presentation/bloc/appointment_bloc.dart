import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/appointment.dart';
import '../../domain/usecases/book_appointment.dart';
import '../../domain/usecases/cancel_appointment.dart';
import '../../domain/usecases/watch_appointments.dart';
import '../../domain/usecases/delete_appointment.dart';
import '../../domain/usecases/update_appointment.dart';
import 'package:add_2_calendar/add_2_calendar.dart';

part 'appointment_event.dart';
part 'appointment_state.dart';
part 'appointment_bloc.freezed.dart';

@injectable
class AppointmentBloc extends Bloc<AppointmentEvent, AppointmentState> {
  final WatchAppointments _watchAppointments;
  final BookAppointment _bookAppointment;
  final CancelAppointment _cancelAppointment;
  final DeleteAppointment _deleteAppointment;
  final UpdateAppointment _updateAppointment;

  AppointmentBloc(
    this._watchAppointments,
    this._bookAppointment,
    this._cancelAppointment,
    this._deleteAppointment,
    this._updateAppointment,
  ) : super(const AppointmentState.initial()) {
    on<_LoadAppointments>(_onLoadAppointments);
    on<_BookNewAppointment>(_onBookAppointment);
    on<_CancelAppointment>(_onCancelAppointment);
    on<_DeleteAppointment>(_onDeleteAppointment);
    on<_UpdateAppointment>(_onUpdateAppointment);
  }

  Future<void> _onLoadAppointments(
    _LoadAppointments event,
    Emitter<AppointmentState> emit,
  ) async {
    emit(const AppointmentState.loading());
    await emit.forEach(
      _watchAppointments(),
      onData: (appointments) => AppointmentState.loaded(appointments),
      onError: (error, stackTrace) => AppointmentState.error(error.toString()),
    );
  }

  Future<void> _onBookAppointment(
    _BookNewAppointment event,
    Emitter<AppointmentState> emit,
  ) async {
    try {
      await _bookAppointment(event.appointment);

      // Calendar Integration
      final eventCal = Event(
        title: 'Medical Appt: ${event.appointment.specialty}',
        description: event.appointment.notes ?? 'Doctor Appointment',
        location: event.appointment.location,
        startDate: event.appointment.dateTime,
        endDate: event.appointment.dateTime.add(const Duration(minutes: 30)),
        iosParams: const IOSParams(reminder: Duration(minutes: 90)),
        androidParams: const AndroidParams(emailInvites: []),
      );
      await Add2Calendar.addEvent2Cal(eventCal);
    } catch (e) {
      emit(AppointmentState.error(e.toString()));
    }
  }

  Future<void> _onCancelAppointment(
    _CancelAppointment event,
    Emitter<AppointmentState> emit,
  ) async {
    try {
      await _cancelAppointment(event.id);
    } catch (e) {
      emit(AppointmentState.error(e.toString()));
    }
  }

  Future<void> _onDeleteAppointment(
    _DeleteAppointment event,
    Emitter<AppointmentState> emit,
  ) async {
    try {
      await _deleteAppointment(event.id);
    } catch (e) {
      emit(AppointmentState.error(e.toString()));
    }
  }

  Future<void> _onUpdateAppointment(
    _UpdateAppointment event,
    Emitter<AppointmentState> emit,
  ) async {
    try {
      await _updateAppointment(event.appointment);
    } catch (e) {
      emit(AppointmentState.error(e.toString()));
    }
  }
}
