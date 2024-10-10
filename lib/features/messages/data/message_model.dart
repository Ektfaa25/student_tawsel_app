import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  String? id;
  String senderId;
  String chatId;
  String message;
  MessageType messageType;
  DateTime timestamp;
  bool isSentByMe;

  MessageModel({
    required this.id,
    required this.senderId,
    required this.chatId,
    required this.message,
    required this.messageType,
    required this.timestamp,
    required this.isSentByMe,
  });

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      id: map['id'] ?? '',
      senderId: map['senderId'] ?? '',
      chatId: map['chatId'] ?? '',
      message: map['content'] ?? '',
      messageType: MessageType.values.firstWhere(
        (e) => e.toString() == 'MessageType.${map['messageType']}',
        orElse: () => MessageType.text,
      ),
      timestamp: (map['timestamp'] as Timestamp).toDate(),
      isSentByMe: map['isSentByMe'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'senderId': senderId,
      'chatId': chatId,
      'content': message,
      'messageType': messageType.toString().split('.').last,
      'timestamp': Timestamp.fromDate(timestamp),
      'isRead': isSentByMe,
    };
  }
}

enum MessageType {
  text, // text message
  image, // Image message
  audio, // Audio message
}
