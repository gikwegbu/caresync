part of 'prescription_bloc.dart';

@freezed
class PrescriptionState with _$PrescriptionState {
  const factory PrescriptionState.initial() = _Initial;
  const factory PrescriptionState.loading() = _Loading;
  const factory PrescriptionState.loaded(List<Prescription> prescriptions) =
      _Loaded;
  const factory PrescriptionState.error(String message) = _Error;
}
