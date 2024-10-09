import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:student_tawsel/features/messages/data/message_model.dart';

class MessageRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> sendMessage(MessageModel message) async {
    try {
      final docRef = _firestore
          .collection('chats')
          .doc(message.chatId)
          .collection('messages')
          .doc();
      message.id = docRef.id;

      await docRef.set(message.toMap());
    } catch (e) {
      throw Exception('Failed to send message: $e');
    }
  }

  Stream<List<MessageModel>> getMessages(String chatId) {
    try {
      return _firestore
          .collection('chats')
          .doc(chatId)
          .collection('messages')
          .orderBy('timestamp', descending: false)
          .snapshots()
          .map((snapshot) {
        return snapshot.docs.map((doc) {
          return MessageModel.fromMap(doc.data());
        }).toList();
      });
    } catch (e) {
      throw Exception('Failed to get messages: $e');
    }
  }

  Future<MessageModel?> getMessageById(String chatId, String messageId) async {
    try {
      final docSnapshot = await _firestore
          .collection('chats')
          .doc(chatId)
          .collection('messages')
          .doc(messageId)
          .get();

      if (docSnapshot.exists) {
        return MessageModel.fromMap(docSnapshot.data()!);
      } else {
        return null;
      }
    } catch (e) {
      throw Exception('Failed to get message: $e');
    }
  }

  Future<void> updateMessage(MessageModel message) async {
    try {
      await _firestore
          .collection('chats')
          .doc(message.chatId)
          .collection('messages')
          .doc(message.id)
          .update(message.toMap());
    } catch (e) {
      throw Exception('Failed to update message: $e');
    }
  }

  Future<void> deleteMessage(String chatId, String messageId) async {
    try {
      await _firestore
          .collection('chats')
          .doc(chatId)
          .collection('messages')
          .doc(messageId)
          .delete();
    } catch (e) {
      throw Exception('Failed to delete message: $e');
    }
  }
}
