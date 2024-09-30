import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String? id;
  final String username;
  final String email;
  final String image;
  UserModel({
    this.id,
    required this.username,
    required this.email,
    required this.image,
  });

  factory UserModel.fromFirebaseAuthUser(User user) {
    return UserModel(
      id: user.uid,
      username: user.displayName ?? '',
      email: user.email ?? '',
      image: user.photoURL ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'image': image,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      username: map['username'] ?? '',
      email: map['email'] ?? '',
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(id: $id, username: $username, email: $email, image: $image)';
  }
}
