import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import '../models/user_profile_model.dart';

abstract class ProfileLocalDataSource {
  Future<UserProfileModel?> getUserProfile();
  Future<void> saveUserProfile(UserProfileModel profile);
}

@LazySingleton(as: ProfileLocalDataSource)
class IsarProfileDataSource implements ProfileLocalDataSource {
  final Isar _isar;

  IsarProfileDataSource(this._isar);

  @override
  Future<UserProfileModel?> getUserProfile() async {
    // Assuming single user for now
    return _isar.userProfileModels.where().findFirst();
  }

  @override
  Future<void> saveUserProfile(UserProfileModel profile) async {
    await _isar.writeTxn(() async {
      // Clear existing if we only want one user logic, or just update if ID matches
      // But since we did findFirst, lets clearall then put new one or update if ID is passed
      // Ideally we keep the ID consistent.
      if (profile.id == Isar.autoIncrement) {
        final existing = await getUserProfile();
        if (existing != null) {
          profile.id = existing.id;
        }
      }
      await _isar.userProfileModels.put(profile);
    });
  }
}
