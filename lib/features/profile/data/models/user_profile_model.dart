import 'package:isar/isar.dart';

part 'user_profile_model.g.dart';

@collection
class UserProfileModel {
  Id id = Isar.autoIncrement;

  late String firstName;
  late String lastName;
  late DateTime dob;
  late String nhsNumber;
  late String gpPractice;

  List<String> medicalConditions = [];
  List<String> emergencyContacts = [];
}
