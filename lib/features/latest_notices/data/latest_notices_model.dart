import 'package:cloud_firestore/cloud_firestore.dart';

class LatestNoticeModel {
  final String teacherId;
  final String teacherName;
  final String profession;
  final String additionalInfo;
  final String lastMessageContent;
  final Timestamp lastMessageTimestamp;

  LatestNoticeModel({
    required this.teacherId,
    required this.teacherName,
    required this.profession,
    required this.additionalInfo,
    required this.lastMessageContent,
    required this.lastMessageTimestamp,
  });

  factory LatestNoticeModel.fromFirestore(Map<String, dynamic> data) {
    return LatestNoticeModel(
      teacherId: data['teacherId'] ?? '',
      teacherName: data['teacherName'] ?? '',
      profession: data['profession'] ?? '',
      additionalInfo: data['additionalInfo'] ?? '',
      lastMessageContent: data['lastMessageContent'] ?? '',
      lastMessageTimestamp: data['lastMessageTimestamp'] ?? Timestamp.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'teacherId': teacherId,
      'teacherName': teacherName,
      'profession': profession,
      'additionalInfo': additionalInfo,
      'lastMessageContent': lastMessageContent,
      'lastMessageTimestamp': lastMessageTimestamp,
    };
  }
}
