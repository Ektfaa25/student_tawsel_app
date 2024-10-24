import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:student_tawsel/features/auth/firebase_auth.dart';
import 'package:student_tawsel/features/chat/data/chat_model.dart';

class ChatRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
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
    }

    return chatId;
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
