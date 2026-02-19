import 'package:isar/isar.dart';

part 'appointment_model.g.dart';

@collection
class AppointmentModel {
  Id id = Isar.autoIncrement;

  late String doctorName;
  late String specialty;
  late DateTime dateTime;
  late String location;
  late String status; // 'upcoming', 'completed', 'cancelled'
  String? notes;

  @Index()
  late DateTime createdAt;
}
