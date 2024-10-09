import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:student_tawsel/features/messages/data/message_model.dart';

class ChatModel {
  String? id;
  List<String> participantIds;
  DateTime createdAt;
  String? lastMessage;
  DateTime? lastMessageTimestamp;
  List<MessageModel> messages; // Add this line

  ChatModel({
    this.id,
    required this.participantIds,
    required this.createdAt,
    this.lastMessage,
    this.lastMessageTimestamp,
    required this.messages, // And this line
  });

  factory ChatModel.fromMap(Map<String, dynamic> map) {
    return ChatModel(
      id: map['id'],
      participantIds: List<String>.from(map['participantIds']),
      createdAt: (map['createdAt'] as Timestamp).toDate(),
      lastMessage: map['lastMessage'],
      lastMessageTimestamp: map['lastMessageTimestamp'] != null
          ? (map['lastMessageTimestamp'] as Timestamp).toDate()
          : null,
      messages: map['messages'] != null
          ? List<Map<String, dynamic>>.from(map['messages'])
              .map((msgMap) => MessageModel.fromMap(msgMap))
              .toList()
          : [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'participantIds': participantIds,
      'createdAt': Timestamp.fromDate(createdAt),
      'lastMessage': lastMessage,
      'lastMessageTimestamp': lastMessageTimestamp != null
          ? Timestamp.fromDate(lastMessageTimestamp!)
          : null,
      'messages': messages.map((msg) => msg.toMap()).toList(), // And this line
    };
  }
}
