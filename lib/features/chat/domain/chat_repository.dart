import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:student_tawsel/features/chat/data/chat_model.dart';

class ChatRepository {
  final _firestore = FirebaseFirestore.instance;

 
  /// Creates a new chat between two users
  Future<ChatModel> createChat(List<String> participantIds) async {
    try {
      // Check if a chat already exists between these users
      final existingChats = await _firestore
          .collection('chats')
          .where('participantIds', arrayContains: participantIds[0])
          .get();

      for (var doc in existingChats.docs) {
        final chat = ChatModel.fromMap(doc.data());
        if (chat.participantIds.toSet().containsAll(participantIds)) {
          // Chat already exists
          return chat;
        }
      }

      // Create a new chat document
      final docRef = _firestore.collection('chats').doc();
      final chat = ChatModel(
        id: docRef.id,
        participantIds: participantIds,
        createdAt: DateTime.now(),
        messages: [], // Initialize the messages list
      );

      await docRef.set(chat.toMap());
      return chat;
    } catch (e) {
      throw Exception('Failed to create chat: $e');
    }
  }
}
