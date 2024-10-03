import 'dart:convert';

class ChildModel {
  final String? id;
  final String name;
  final String gender;
  final String level;
  final DateTime dateOfBirth;
  final String? phone;

  ChildModel({
    this.id,
    required this.name,
    required this.gender,
    required this.level,
    required this.dateOfBirth,
    this.phone,
  });

  factory ChildModel.fromMap(Map<String, dynamic> map) {
    return ChildModel(
      id: map['id'],
      name: map['name'] ?? '',
      gender: map['gender'] ?? '',
      level: map['level'] ?? '',
      dateOfBirth: DateTime.now(),
      phone: map['phone'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'gender': gender,
      'level': level,
      'dateOfBirth': dateOfBirth.toIso8601String(),
      'phone': phone,
    };
  }

  factory ChildModel.fromJson(String source) =>
      ChildModel.fromMap(json.decode(source));

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'ChildModel(id: $id, name: $name, gender: $gender, level: $level, dateOfBirth: $dateOfBirth, phone: $phone)';
  }
}
