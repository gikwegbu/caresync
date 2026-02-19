import 'package:injectable/injectable.dart';
import '../entities/user_profile.dart';
import '../repositories/profile_repository.dart';

@lazySingleton
class GetUserProfile {
  final ProfileRepository _repository;

  GetUserProfile(this._repository);

  Future<UserProfile?> call() => _repository.getUserProfile();
}
