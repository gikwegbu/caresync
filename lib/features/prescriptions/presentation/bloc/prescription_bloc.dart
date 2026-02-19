import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/prescription.dart';
import '../../domain/usecases/get_prescriptions.dart';
import '../../domain/usecases/toggle_prescription_reminder.dart';

part 'prescription_event.dart';
part 'prescription_state.dart';
part 'prescription_bloc.freezed.dart';

@injectable
class PrescriptionBloc extends Bloc<PrescriptionEvent, PrescriptionState> {
  final GetPrescriptions _getPrescriptions;
  final TogglePrescriptionReminder _toggleReminder;

  PrescriptionBloc(
    this._getPrescriptions,
    this._toggleReminder,
  ) : super(const PrescriptionState.initial()) {
    on<_LoadPrescriptions>(_onLoadPrescriptions);
    on<_ToggleReminder>(_onToggleReminder);
  }

  Future<void> _onLoadPrescriptions(
    _LoadPrescriptions event,
    Emitter<PrescriptionState> emit,
  ) async {
    emit(const PrescriptionState.loading());
    try {
      final prescriptions = await _getPrescriptions();
      emit(PrescriptionState.loaded(prescriptions));
    } catch (e) {
      emit(PrescriptionState.error(e.toString()));
    }
  }

  Future<void> _onToggleReminder(
    _ToggleReminder event,
    Emitter<PrescriptionState> emit,
  ) async {
    try {
      await _toggleReminder(event.id, event.enabled);
      // Optimistic update or reload. Reload is safer for consistency.
      add(const _LoadPrescriptions());
    } catch (e) {
      // Ideally show snackbar, but here we might just reload or emit error
      emit(PrescriptionState.error(e.toString()));
    }
  }
}
