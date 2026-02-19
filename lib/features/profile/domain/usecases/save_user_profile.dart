import 'package:injectable/injectable.dart';
import '../entities/user_profile.dart';
import '../repositories/profile_repository.dart';

@lazySingleton
class SaveUserProfile {
  final ProfileRepository _repository;

  SaveUserProfile(this._repository);

  Future<void> call(UserProfile profile) =>
      _repository.saveUserProfile(profile);
}
