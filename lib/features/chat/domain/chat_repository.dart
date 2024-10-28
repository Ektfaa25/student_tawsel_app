import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:student_tawsel/features/auth/firebase_auth.dart';
import 'package:student_tawsel/features/chat/data/chat_model.dart';

class ChatRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  // Future<String> createChat(String teacherId) async {
  //   var currentUserid = FirebaseAuthService().getCurrentUserid();
  //   List<String> users = [teacherId, currentUserid];
  //   users.sort(); // Ensure consistent chatId
  //   String chatId = users.join('_');
  //   final chatRef = FirebaseFirestore.instance.collection('chats').doc();
  //   await chatRef.set({
  //     'chatId': chatId,
  //     'userId': currentUserid,
  //     'teacherId': teacherId,
  //     'lastMessage': {
  //       'content': '',
  //       'timestamp': FieldValue.serverTimestamp(),
  //     }
  //   });
  //   return chatId;
  // }
  Future<String> getOrCreateChat(String reciever) async {
    var currentUserid = FirebaseAuthService().getCurrentUserid();
    List<String> users = [reciever, currentUserid];
    users.sort(); // Ensure consistent chatId
    String chatId = users.join('_');

    DocumentReference chatDoc = _db.collection('chats').doc(chatId)
      ..collection('messages');

    DocumentSnapshot chatSnapshot = await chatDoc.get();

    if (!chatSnapshot.exists) {
      // Create new chat
      await chatDoc.set({
        'participants': users,
        'lastMessage': '',
        'lastMessageTime': Timestamp.now(),
      });
      // Initialize latest notice for this chat
      await updateLatestNotice(reciever, '');
    }

    return chatId;
  }

  Future<void> updateLatestNotice(
      String teacherId, String messageContent) async {
    // Fetch teacher info from `teachers` collection
    DocumentSnapshot teacherSnapshot = await FirebaseFirestore.instance
        .collection('teachers')
        .doc(teacherId)
        .get();

    if (teacherSnapshot.exists) {
      final teacherData = teacherSnapshot.data() as Map<String, dynamic>;

      // Update or create a document in `latest_notices` with the latest message
      await FirebaseFirestore.instance
          .collection('latest_notices')
          .doc(teacherId)
          .set({
        'teacherId': teacherId,
        'teacherName': teacherData['name'],
        'profession': teacherData['profession'],
        'additionalInfo': teacherData['additionalInfo'],
        'lastMessageContent': messageContent,
        'lastMessageTimestamp': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true)); // Merge with existing data if present
    }
  }

  // Get list of chats for a user
  Stream<List<ChatModel>> getUserChats(String userId) {
    return _db
        .collection('chats')
        .where('participants', arrayContains: userId)
        .orderBy('lastMessageTime', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) {
              var data = doc.data();
              data['id'] = doc.id;

              final chat = ChatModel.fromMap(data);

              return chat;
            }).toList());
  }
}
