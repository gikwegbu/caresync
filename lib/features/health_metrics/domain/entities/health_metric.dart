import 'package:equatable/equatable.dart';

class HealthMetric extends Equatable {
  final int? id;
  final String type; // 'blood_pressure', 'heart_rate', 'weight', 'blood_sugar'
  final double value;
  final String? unit; // 'mmHg', 'bpm', 'kg', 'mmol/L'
  final DateTime recordedAt;
  final String? notes;

  const HealthMetric({
    this.id,
    required this.type,
    required this.value,
    this.unit,
    required this.recordedAt,
    this.notes,
  });

  @override
  List<Object?> get props => [id, type, value, unit, recordedAt, notes];

  // Helper to format display value
  String get displayValue {
    if (type == 'blood_pressure') {
      // Logic for BP might need two values (sys/dia) or store as string/double
      // If value is single double, maybe it's systolic?
      // Current design has 'value' as double. BP is usually 120/80.
      // We might need to handle BP differently or store as separate fields.
      // For now, let's assume 'value' is systolic and we might need another field for diastolic or just store string in notes?
      // Or simplify and store sys in value and dia in notes?
      // Actually, '120.80' double is bad.
      // Let's assume for this MVF (Minimum Viable Feature), value is the main number.
      // If type is BP, maybe value is systolic.
      return '${value.toInt()} $unit';
    }
    return '${value.toStringAsFixed(1)} $unit';
  }
}
