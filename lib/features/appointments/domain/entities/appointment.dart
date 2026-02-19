import 'package:equatable/equatable.dart';

class Appointment extends Equatable {
  final int? id; // Null for new appointments
  final String doctorName;
  final String specialty;
  final DateTime dateTime;
  final String location;
  final String status;
  final String? notes;

  const Appointment({
    this.id,
    required this.doctorName,
    required this.specialty,
    required this.dateTime,
    required this.location,
    required this.status,
    this.notes,
  });

  @override
  List<Object?> get props =>
      [id, doctorName, specialty, dateTime, location, status, notes];
}
