import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:student_tawsel/features/auth/firebase_auth.dart';
import 'package:student_tawsel/features/messages/data/message_model.dart';

class MessageRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<String> getOrCreateChat(String reciever) async {
    var currentUserid = FirebaseAuthService().getCurrentUserid();
    List<String> users = [reciever, currentUserid];
    users.sort(); // Ensure consistent chatId
    String chatId = users.join('_');

    DocumentReference chatDoc = _firestore.collection('chats').doc(chatId)
      ..collection('messages');

    DocumentSnapshot chatSnapshot = await chatDoc.get();

    if (!chatSnapshot.exists) {
      // Create new chat
      await chatDoc.set({
        'participants': users,
        'lastMessage': '',
        'lastMessageTime': Timestamp.now(),
      });
    }

    return chatId;
  }

 

  Future<void> sendMessage(String chatId, MessageModel message) async {
    // Reference to the messages collection within the chat
    CollectionReference messagesRef =
        _firestore.collection('chats').doc(chatId).collection('messages');

// Check if the message has an ID
    if (message.id != null && message.id!.isNotEmpty) {
      // If the message has an ID, it means it already exists
      DocumentReference messageDoc = messagesRef.doc(message.id);

      // Update the existing message document
      await messageDoc.update(message.toMap());
    } else {
      // If the message doesn't have an ID, it is a new message
      // Add the message and get the reference of the new document
      DocumentReference messageDoc = await messagesRef.add(message.toMap());

      // Set the ID for the newly created message document
      message.id = messageDoc.id;

      // Update the message document with its own ID
      await messageDoc.update({'id': message.id});
    }

// Update the chat document with the latest message info
    await _firestore.collection('chats').doc(chatId).update({
      'lastMessage': message.content,
      'lastMessageTime': Timestamp.fromDate(message.timestamp),
    });
  }
  // Future<void> sendMessage(MessageModel message) async {
  //   try {
  //     final docRef = _firestore
  //         .collection('chats')
  //         .doc(message.chatId)
  //         .collection('messages')
  //         .doc();
  //     message.id = docRef.id;

  //     await docRef.set(message.toMap());
  //   } catch (e) {
  //     throw Exception('Failed to send message: $e');
  //   }
  // }

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
