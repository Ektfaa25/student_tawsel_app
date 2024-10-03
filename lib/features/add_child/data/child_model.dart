import 'dart:convert';

class ChildModel {
  final String? id;
  final String name;
  final String gender;
  final String level;
  final DateTime dateOfBirth;
  final String? phone; // Make phone nullable if it’s optional

  ChildModel({
    this.id,
    required this.name,
    required this.gender,
    required this.level,
    required this.dateOfBirth,
    this.phone, // Nullable phone
  });

  // Factory to create ChildModel from Map (for Firestore or JSON)
  factory ChildModel.fromMap(Map<String, dynamic> map) {
    return ChildModel(
      id: map['id'], // Nullable ID
      name: map['name'] ?? '', // Provide default empty string if null
      gender: map['gender'] ?? '',
      level: map['level'] ?? '',
      dateOfBirth: map['dateOfBirth'] != null // Improved date parsing
          ? DateTime.parse(map['dateOfBirth'])
          : DateTime.now(), // Fallback if null
      phone: map['phone'], // No need for fallback for nullable field
    );
  }

  // Convert ChildModel to Map (for Firestore or JSON encoding)
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

  // Convert JSON string to ChildModel
  factory ChildModel.fromJson(String source) =>
      ChildModel.fromMap(json.decode(source));

  // Convert ChildModel to JSON string
  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'ChildModel(id: $id, name: $name, gender: $gender, level: $level, dateOfBirth: $dateOfBirth, phone: $phone)';
  }
}
