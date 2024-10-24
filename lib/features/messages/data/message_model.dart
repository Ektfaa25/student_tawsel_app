import 'package:cloud_firestore/cloud_firestore.dart';

enum MessageType { text, image, audio }

class MessageModel {
  String? id;
  String content;
  String senderId;
  MessageType messageType;
  DateTime timestamp;

  MessageModel({
    this.id,
    required this.content,
    required this.senderId,
    required this.timestamp,
    this.messageType = MessageType.text,
  });

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      id: map['id'] ?? '',
      content: map['content'] ?? '',
      senderId: map['senderId'] ?? '',
      messageType: MessageType.values.firstWhere(
        (e) => e.toString() == 'MessageType.${map['messageType']}',
        orElse: () => MessageType.text,
      ),
      timestamp: (map['timestamp'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'content': content,
      'senderId': senderId,
      'messageType': messageType.toString().split('.').last,
      'timestamp': Timestamp.fromDate(timestamp),
    };
  }
}
