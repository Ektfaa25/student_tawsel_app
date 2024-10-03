// import 'package:cloud_firestore/cloud_firestore.dart';

// class FirestoreService {
//   final FirebaseFirestore _db = FirebaseFirestore.instance;

//   // Create a new chat or get existing chat between two users
//   Future<String> createChat(String userId1, String userId2) async {
//     try {
//       // Check if chat between these two users already exists
//       QuerySnapshot query = await _db
//           .collection('chats')
//           .where('participants', arrayContains: userId1)
//           .get();

//       for (var doc in query.docs) {
//         List participants = doc['participants'];
//         if (participants.contains(userId2)) {
//           // Chat already exists, return the chat ID
//           return doc.id;
//         }
//       }

//       // If chat doesn't exist, create a new chat
//       DocumentReference newChat = await _db.collection('chats').add({
//         'participants': [userId1, userId2],
//         'lastMessage': '',
//         'lastMessageTimestamp': FieldValue.serverTimestamp(),
//       });

//       return newChat.id;
//     } catch (e) {
//       print('Error creating chat: $e');
//       throw e;
//     }
//   }
// }
