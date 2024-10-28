import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:student_tawsel/features/auth/firebase_auth.dart';
import 'package:student_tawsel/features/messages/data/message_model.dart';

class MessageRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<String> getOrCreateChat(String reciever) async {
    var currentUserid = FirebaseAuthService().getCurrentUserid();
    List<String> users = [reciever, currentUserid!];
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

  Future<void> sendMessage(
      String chatId, MessageModel message, String teacherId) async {
    CollectionReference messagesRef =
        _firestore.collection('chats').doc(chatId).collection('messages');

    if (message.id != null && message.id!.isNotEmpty) {
      DocumentReference messageDoc = messagesRef.doc(message.id);
      await messageDoc.update(message.toMap());
    } else {
      DocumentReference messageDoc = await messagesRef.add(message.toMap());
      message.id = messageDoc.id;
      await messageDoc.update({'id': message.id});
    }

    // Update the chat document
    await _firestore.collection('chats').doc(chatId).update({
      'lastMessage': message.content,
      'lastMessageTime': Timestamp.fromDate(message.timestamp),
    });
    await updateLatestNotice(teacherId, message.content, message.timestamp);
    print("Sending to updateLatestNotice");
  }

  Future<void> updateLatestNotice(
      String teacherId, String messageContent, DateTime timestamp) async {
    try {
      print("Fetching teacher data for teacherId: $teacherId");
      DocumentSnapshot teacherSnapshot =
          await _firestore.collection('Teachers').doc(teacherId).get();

      if (teacherSnapshot.exists) {
        final teacherData = teacherSnapshot.data() as Map<String, dynamic>?;
        if (teacherData == null) {
          print("No data found in teacher document.");
          return;
        }

        print(
            "Creating/updating latest_notices for teacher: ${teacherData['name']}");
        await _firestore.collection('latest_notices').doc(teacherId).set({
          'teacherId': teacherId,
          'teacherName': teacherData['name'],
          'profession': teacherData['profession'],
          'additionalInfo': teacherData['additionalInfo'],
          'lastMessageContent': messageContent,
          'lastMessageTimestamp': Timestamp.fromDate(timestamp),
        }, SetOptions(merge: true));

        print("Successfully updated latest_notices for $teacherId");
      } else {
        print("Teacher document with ID $teacherId does not exist.");
      }
    } catch (e) {
      print("Error updating latest_notices: $e");
    }
  }

  Future<Map<String, dynamic>?> getLatestNoticeByTeacherId(
      String teacherId) async {
    try {
      // Fetch the document for the specific teacher ID from latest_notices collection
      DocumentSnapshot noticeSnapshot =
          await _firestore.collection('latest_notices').doc(teacherId).get();

      // Check if the document exists
      if (noticeSnapshot.exists) {
        // Return the data as a map
        return noticeSnapshot.data() as Map<String, dynamic>?;
      } else {
        print("No latest notice found for teacher ID: $teacherId");
        return null; // No data found for the provided teacher ID
      }
    } catch (e) {
      print("Error fetching latest notice for teacher ID $teacherId: $e");
      return null; // Return null in case of an error
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
