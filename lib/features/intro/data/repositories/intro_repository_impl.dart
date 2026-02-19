import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import '../../domain/repositories/intro_repository.dart';
import '../../../settings/data/models/app_settings_model.dart';

@LazySingleton(as: IntroRepository)
class IntroRepositoryImpl implements IntroRepository {
  final Isar _isar;

  IntroRepositoryImpl(this._isar);

  @override
  Future<bool> isOnboardingCompleted() async {
    final settings = await _isar.appSettingsModels.where().findFirst();
    return settings?.isOnboardingCompleted ?? false;
  }

  @override
  Future<void> completeOnboarding() async {
    await _isar.writeTxn(() async {
      final settings = await _isar.appSettingsModels.where().findFirst() ??
          AppSettingsModel();
      settings.isOnboardingCompleted = true;
      await _isar.appSettingsModels.put(settings);
    });
  }
}
