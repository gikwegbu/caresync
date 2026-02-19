import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/appointment.dart';
import '../../domain/usecases/book_appointment.dart';
import '../../domain/usecases/cancel_appointment.dart';
import '../../domain/usecases/get_appointments.dart';

part 'appointment_event.dart';
part 'appointment_state.dart';
part 'appointment_bloc.freezed.dart';

@injectable
class AppointmentBloc extends Bloc<AppointmentEvent, AppointmentState> {
  final GetAppointments _getAppointments;
  final BookAppointment _bookAppointment;
  final CancelAppointment _cancelAppointment;

  AppointmentBloc(
    this._getAppointments,
    this._bookAppointment,
    this._cancelAppointment,
  ) : super(const AppointmentState.initial()) {
    on<_LoadAppointments>(_onLoadAppointments);
    on<_BookNewAppointment>(_onBookAppointment);
    on<_CancelAppointment>(_onCancelAppointment);
  }

  Future<void> _onLoadAppointments(
    _LoadAppointments event,
    Emitter<AppointmentState> emit,
  ) async {
    emit(const AppointmentState.loading());
    try {
      final appointments = await _getAppointments();
      emit(AppointmentState.loaded(appointments));
    } catch (e) {
      emit(AppointmentState.error(e.toString()));
    }
  }

  Future<void> _onBookAppointment(
    _BookNewAppointment event,
    Emitter<AppointmentState> emit,
  ) async {
    // We keep the current state loaded while booking or emit a specific booking state
    // For simplicity, let's just show loading or optimistic update.
    // Ideally we'd have a specific `isBooking` flag or separate state.
    // Let's re-load after booking.
    try {
      await _bookAppointment(event.appointment);
      add(const _LoadAppointments());
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
      add(const _LoadAppointments());
    } catch (e) {
      emit(AppointmentState.error(e.toString()));
    }
  }
}
