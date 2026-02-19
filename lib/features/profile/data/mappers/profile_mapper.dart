import 'package:isar/isar.dart';
import '../models/user_profile_model.dart';
import '../../domain/entities/user_profile.dart';

extension UserProfileModelX on UserProfileModel {
  UserProfile toEntity() {
    return UserProfile(
      id: id,
      firstName: firstName,
      lastName: lastName,
      dob: dob,
      nhsNumber: nhsNumber,
      gpPractice: gpPractice,
      medicalConditions: medicalConditions,
      emergencyContacts: emergencyContacts,
    );
  }
}

extension UserProfileX on UserProfile {
  UserProfileModel toModel() {
    return UserProfileModel()
      ..id = id ?? Isar.autoIncrement
      ..firstName = firstName
      ..lastName = lastName
      ..dob = dob
      ..nhsNumber = nhsNumber
      ..gpPractice = gpPractice
      ..medicalConditions = medicalConditions
      ..emergencyContacts = emergencyContacts;
  }
}
