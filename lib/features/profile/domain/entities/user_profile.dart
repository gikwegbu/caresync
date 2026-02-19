import 'package:equatable/equatable.dart';

class UserProfile extends Equatable {
  final int? id;
  final String firstName;
  final String lastName;
  final DateTime dob;
  final String nhsNumber;
  final String gpPractice;
  final List<String> medicalConditions;
  final List<String> emergencyContacts; // Just names for now

  const UserProfile({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.dob,
    required this.nhsNumber,
    required this.gpPractice,
    this.medicalConditions = const [],
    this.emergencyContacts = const [],
  });

  String get fullName => '$firstName $lastName';

  int get age {
    final now = DateTime.now();
    int age = now.year - dob.year;
    if (now.month < dob.month ||
        (now.month == dob.month && now.day < dob.day)) {
      age--;
    }
    return age;
  }

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        dob,
        nhsNumber,
        gpPractice,
        medicalConditions,
        emergencyContacts
      ];
}
