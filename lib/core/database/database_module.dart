import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../../features/appointments/data/models/appointment_model.dart';
import '../../features/prescriptions/data/models/prescription_model.dart';
import '../../features/health_metrics/data/models/health_metric_model.dart';
import '../../features/profile/data/models/user_profile_model.dart';
import '../../features/settings/data/models/app_settings_model.dart';

@module
abstract class DatabaseModule {
  @preResolve
  Future<Isar> get isar async {
    final dir = await getApplicationDocumentsDirectory();
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [
          AppointmentModelSchema,
          PrescriptionModelSchema,
          HealthMetricModelSchema,
          UserProfileModelSchema,
          AppSettingsModelSchema,
        ],
        directory: dir.path,
      );
    }
    return Isar.getInstance()!;
  }
}
