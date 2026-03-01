import 'package:isar/isar.dart';

part 'app_settings_model.g.dart';

@collection
class AppSettingsModel {
  Id id = Isar.autoIncrement;

  bool isOnboardingCompleted = false;

  bool isBiometricEnabled = false;

  bool isDarkMode = false;
}
