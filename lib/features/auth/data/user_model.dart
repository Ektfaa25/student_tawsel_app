import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String? id;
  final String username;
  final String email;
  final String image;
  final String? phone;
  final String? address;
  final String role;

  UserModel({
    this.id,
    required this.username,
    required this.email,
    required this.image,
    this.phone,
    this.address,
    required this.role,
  });

  factory UserModel.fromFirebaseAuthUser(User user, String role) {
    return UserModel(
      id: user.uid,
      username: user.displayName ?? '',
      email: user.email ?? '',
      image: user.photoURL ?? '',
      phone: user.phoneNumber ?? '',
      role: role,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'image': image,
      'phone': phone,
      'address': address,
      'role': role,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      username: map['username'] ?? '',
      email: map['email'] ?? '',
      image: map['image'] ?? '',
      phone: map['phone'],
      address: map['address'],
      role: map['role'] ?? 'student',
    );
  }

  // Convert UserModel to JSON string
  String toJson() => json.encode(toMap());

  // Create a UserModel from a JSON string
  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(id: $id, username: $username, email: $email, image: $image, phone: $phone, address: $address, role: $role)';
  }
}
