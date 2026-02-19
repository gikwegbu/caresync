import 'package:equatable/equatable.dart';

class Prescription extends Equatable {
  final int? id;
  final String medicationName;
  final String dosage;
  final String frequency;
  final DateTime startDate;
  final DateTime endDate;
  final bool reminderEnabled;
  final String status; // 'active', 'completed'

  const Prescription({
    this.id,
    required this.medicationName,
    required this.dosage,
    required this.frequency,
    required this.startDate,
    required this.endDate,
    this.reminderEnabled = false,
    required this.status,
  });

  // Calculate remaining days
  int get daysRemaining {
    final now = DateTime.now();
    if (now.isAfter(endDate)) return 0;
    return endDate.difference(now).inDays;
  }

  @override
  List<Object?> get props => [
        id,
        medicationName,
        dosage,
        frequency,
        startDate,
        endDate,
        reminderEnabled,
        status
      ];
}
