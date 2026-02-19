import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/prescription.dart';
import '../../domain/usecases/watch_prescriptions.dart';
import '../../domain/usecases/toggle_prescription_reminder.dart';

import '../../domain/usecases/delete_prescription.dart';
import '../../domain/usecases/add_prescription.dart';
import '../../domain/usecases/update_prescription.dart';

part 'prescription_event.dart';
part 'prescription_state.dart';
part 'prescription_bloc.freezed.dart';

@injectable
class PrescriptionBloc extends Bloc<PrescriptionEvent, PrescriptionState> {
  final WatchPrescriptions _watchPrescriptions;
  final TogglePrescriptionReminder _toggleReminder;
  final DeletePrescription _deletePrescription;
  final AddPrescription _addPrescription;
  final UpdatePrescription _updatePrescription;

  PrescriptionBloc(
    this._watchPrescriptions,
    this._toggleReminder,
    this._deletePrescription,
    this._addPrescription,
    this._updatePrescription,
  ) : super(const PrescriptionState.initial()) {
    on<_LoadPrescriptions>(_onLoadPrescriptions);
    on<_ToggleReminder>(_onToggleReminder);
    on<_DeletePrescription>(_onDeletePrescription);
    on<_AddPrescription>(_onAddPrescription);
    on<_UpdatePrescription>(_onUpdatePrescription);
  }

  Future<void> _onLoadPrescriptions(
    _LoadPrescriptions event,
    Emitter<PrescriptionState> emit,
  ) async {
    emit(const PrescriptionState.loading());
    await emit.forEach(
      _watchPrescriptions(),
      onData: (prescriptions) => PrescriptionState.loaded(prescriptions),
      onError: (error, stackTrace) => PrescriptionState.error(error.toString()),
    );
  }

  Future<void> _onToggleReminder(
    _ToggleReminder event,
    Emitter<PrescriptionState> emit,
  ) async {
    try {
      await _toggleReminder(event.id, event.enabled);
    } catch (e) {
      // Ideally show snackbar, but here we might just reload or emit error
      emit(PrescriptionState.error(e.toString()));
    }
  }

  Future<void> _onDeletePrescription(
    _DeletePrescription event,
    Emitter<PrescriptionState> emit,
  ) async {
    try {
      await _deletePrescription(event.id);
    } catch (e) {
      emit(PrescriptionState.error(e.toString()));
    }
  }

  Future<void> _onAddPrescription(
    _AddPrescription event,
    Emitter<PrescriptionState> emit,
  ) async {
    try {
      await _addPrescription(event.prescription);
    } catch (e) {
      emit(PrescriptionState.error(e.toString()));
    }
  }

  Future<void> _onUpdatePrescription(
    _UpdatePrescription event,
    Emitter<PrescriptionState> emit,
  ) async {
    try {
      await _updatePrescription(event.prescription);
    } catch (e) {
      emit(PrescriptionState.error(e.toString()));
    }
  }
}
