part of 'prescription_bloc.dart';

@freezed
class PrescriptionEvent with _$PrescriptionEvent {
  const factory PrescriptionEvent.loadPrescriptions() = _LoadPrescriptions;
  const factory PrescriptionEvent.toggleReminder(int id, bool enabled) =
      _ToggleReminder;
  const factory PrescriptionEvent.deletePrescription(int id) =
      _DeletePrescription;
  const factory PrescriptionEvent.addPrescription(Prescription prescription) =
      _AddPrescription;
  const factory PrescriptionEvent.updatePrescription(
      Prescription prescription) = _UpdatePrescription;
}
