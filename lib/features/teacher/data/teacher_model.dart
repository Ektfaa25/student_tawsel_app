import 'dart:convert';

class TeacherModel {
  final String? id;
  final String name;
  final String profession;
  final String message;
  final String additionalInfo;
  final String phonenumer;

  TeacherModel({
    this.id,
    required this.name,
    required this.profession,
    required this.message,
    required this.additionalInfo,
    required this.phonenumer,
  });

  factory TeacherModel.fromFirestore(Map<String, dynamic> doc, String id) {
    return TeacherModel(
      id: id,
      name: doc['name'] ?? '',
      profession: doc['profession'] ?? '',
      message: doc['message'] ?? '',
      additionalInfo: doc['additionalInfo'] ?? '',
      phonenumer: doc['phonenumer'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'profession': profession,
      'message': message,
      'additionalInfo': additionalInfo,
      'phonenumer': phonenumer,
    };
  }

  factory TeacherModel.fromMap(Map<String, String> map) {
    return TeacherModel(
      id: map['id'],
      name: map['name'] ?? '',
      profession: map['profession'] ?? '',
      message: map['message'] ?? '',
      additionalInfo: map['additionalInfo'] ?? '',
      phonenumer: map['phonenumer'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TeacherModel.fromJson(String source) =>
      TeacherModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Teacher(id: $id, name: $name, profession: $profession, message: $message, additionalInfo: $additionalInfo, phonenumer: $phonenumer)';
  }
}
