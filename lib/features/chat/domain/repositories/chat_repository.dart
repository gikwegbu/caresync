import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import '../entities/chat_message_entity.dart';

@injectable
class ChatRepository {
  final Isar _isar;

  ChatRepository(this._isar);

  Future<void> saveMessage(ChatMessageEntity message) async {
    await _isar.writeTxn(() async {
      await _isar.chatMessageEntitys.put(message);
    });
  }

  Future<List<ChatMessageEntity>> getChatHistory() async {
    // Fetch all messages sorted by timestamp ascending (oldest first)
    return await _isar.chatMessageEntitys.where().sortByTimestamp().findAll();
  }
}
