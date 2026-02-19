import 'package:injectable/injectable.dart';
import '../../domain/entities/user_profile.dart';
import '../../domain/repositories/profile_repository.dart';
import '../datasources/profile_local_datasource.dart';
import '../mappers/profile_mapper.dart';

@LazySingleton(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileLocalDataSource _dataSource;

  ProfileRepositoryImpl(this._dataSource);

  @override
  Future<UserProfile?> getUserProfile() async {
    final model = await _dataSource.getUserProfile();
    return model?.toEntity();
  }

  @override
  Future<void> saveUserProfile(UserProfile profile) async {
    await _dataSource.saveUserProfile(profile.toModel());
  }
}
