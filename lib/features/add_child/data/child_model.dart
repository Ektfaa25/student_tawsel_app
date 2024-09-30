import 'dart:convert';

class ChildModel {
  final String? id;
  final String name;
  final String gender;
  final String level;
  final DateTime dateOfBirth;
  final String phone;

  ChildModel({
    this.id,
    required this.name,
    required this.gender,
    required this.level,
    required this.dateOfBirth,
    required this.phone,
  });

  // Factory constructor to create a ChildModel instance from a Map
  factory ChildModel.fromMap(Map<String, dynamic> map) {
    return ChildModel(
      id: map['id'],
      name: map['name'] ?? '',
      gender: map['gender'] ?? '',
      level: map['level'] ?? '',
      dateOfBirth: DateTime.parse(
          map['dateOfBirth'] ?? DateTime.now().toIso8601String()),
      phone: map['phone'] ?? '',
    );
  }

  // Method to convert ChildModel to a Map
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

  // Factory constructor to create a ChildModel instance from JSON
  factory ChildModel.fromJson(String source) =>
      ChildModel.fromMap(json.decode(source));

  // Method to convert ChildModel to JSON
  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'ChildModel(id: $id, name: $name, gender: $gender, level: $level, dateOfBirth: $dateOfBirth, phone: $phone)';
  }
}
