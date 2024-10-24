import 'package:cloud_firestore/cloud_firestore.dart';

class ParentModel {
  final String id;
  final String name;
  final String email;
  final String role;
  final List<String> children;
  final String phone;
  final String address;

  ParentModel({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.children,
    this.phone = '',
    this.address = '',
  });

  // factory ParentModel.fromFirestore(DocumentSnapshot doc) {
  //   Map data = doc.data() as Map<String, dynamic>;
  //   return ParentModel(
  //     id: doc.id,
  //     name: data['name'] ?? '',
  //     email: data['email'] ?? '',
  //     role: data['role'] ?? '',
  //     children: List<String>.from(data['children'] ?? []),
  //     phone: data['phone'] ?? '',
  //     address: data['address'] ?? '',
  //   );
  // }

  factory ParentModel.fromMap(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return ParentModel(
      id: data['id'],
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      role: data['role'] ?? '',
      children: List<String>.from(data['children'] ?? []),
      phone: data['phone'],
      address: data['address'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'role': role,
      "children": children,
      'phone': phone,
      'address': address,
    };
  }
}
