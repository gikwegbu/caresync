import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import '../models/appointment_model.dart';

abstract class AppointmentLocalDataSource {
  Future<List<AppointmentModel>> getAppointments();
  Future<AppointmentModel?> getAppointmentById(int id);
  Future<void> cacheAppointment(AppointmentModel appointment);
  Future<void> deleteAppointment(int id);
  Stream<List<AppointmentModel>> getAppointmentsStream();
}

@LazySingleton(as: AppointmentLocalDataSource)
class IsarAppointmentDataSource implements AppointmentLocalDataSource {
  final Isar _isar;

  IsarAppointmentDataSource(this._isar);

  @override
  Future<List<AppointmentModel>> getAppointments() async {
    return _isar.appointmentModels.where().sortByDateTimeDesc().findAll();
  }

  @override
  Future<AppointmentModel?> getAppointmentById(int id) async {
    return _isar.appointmentModels.get(id);
  }

  @override
  Future<void> cacheAppointment(AppointmentModel appointment) async {
    await _isar.writeTxn(() async {
      await _isar.appointmentModels.put(appointment);
    });
  }

  @override
  Future<void> deleteAppointment(int id) async {
    await _isar.writeTxn(() async {
      await _isar.appointmentModels.delete(id);
    });
  }

  @override
  Stream<List<AppointmentModel>> getAppointmentsStream() {
    return _isar.appointmentModels
        .where()
        .sortByDateTimeDesc()
        .watch(fireImmediately: true);
  }
}
