import 'package:isar/isar.dart';

part 'chat_message_entity.g.dart';

@collection
class ChatMessageEntity {
  Id id = Isar.autoIncrement;

  late String text;
  late bool isUser;
  late DateTime timestamp;
}
