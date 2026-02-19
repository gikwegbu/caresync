import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/user_profile.dart';
import '../../domain/usecases/get_user_profile.dart';
import '../../domain/usecases/save_user_profile.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetUserProfile _getUserProfile;
  final SaveUserProfile _saveUserProfile;

  ProfileBloc(
    this._getUserProfile,
    this._saveUserProfile,
  ) : super(const ProfileState.initial()) {
    on<_LoadProfile>(_onLoadProfile);
    on<_SaveProfile>(_onSaveProfile);
  }

  Future<void> _onLoadProfile(
    _LoadProfile event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const ProfileState.loading());
    try {
      final profile = await _getUserProfile();
      if (profile != null) {
        emit(ProfileState.loaded(profile));
      } else {
        emit(const ProfileState.empty());
      }
    } catch (e) {
      emit(ProfileState.error(e.toString()));
    }
  }

  Future<void> _onSaveProfile(
    _SaveProfile event,
    Emitter<ProfileState> emit,
  ) async {
    // Optimistic or loading? Let's do loading for profile save
    emit(const ProfileState.loading());
    try {
      await _saveUserProfile(event.profile);
      emit(ProfileState.loaded(event.profile));
    } catch (e) {
      emit(ProfileState.error(e.toString()));
    }
  }
}
