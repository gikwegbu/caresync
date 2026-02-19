part of 'prescription_bloc.dart';

@freezed
class PrescriptionEvent with _$PrescriptionEvent {
  const factory PrescriptionEvent.loadPrescriptions() = _LoadPrescriptions;
  const factory PrescriptionEvent.toggleReminder(int id, bool enabled) =
      _ToggleReminder;
}
