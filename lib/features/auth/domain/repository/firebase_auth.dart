import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:student_tawsel/features/auth/data/user_model.dart';
import 'package:student_tawsel/features/auth/domain/repository/firebase_storage_service.dart';
import 'package:student_tawsel/features/auth/domain/repository/user_repo.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailAndPassword(BuildContext context, String email,
      String password, String username) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await credential.user?.updateDisplayName(username);
      createOrUpdateFirestoreUser(credential.user);

      return credential.user;
    } catch (e) {
      print("Error: ${e.toString()}");
    }
    return null;
  }

  void createOrUpdateFirestoreUser(
    User? user,
  ) {
    UserRepository().createUser(UserModel.fromFirebaseAuthUser(user!));
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      print("Error: ${e.toString()}");
    }
    return null;
  }

  String getCurrentUserName() {
    return _auth.currentUser!.displayName ?? "guest";
  }

  String getCurrentUserEmail() {
    return _auth.currentUser!.email ?? "guest";
  }

  String getCurrentUserid() {
    return _auth.currentUser!.uid;
  }

  Stream<User?> authState() {
    return _auth.authStateChanges();
  }

  void updateDisplayName(String item) async {
    await _auth.currentUser!.updateDisplayName(item);
    createOrUpdateFirestoreUser(_auth.currentUser!);
  }

  Future<void> updateuserimage(String s) async {
    await _auth.currentUser!.updatePhotoURL(s);
    createOrUpdateFirestoreUser(_auth.currentUser!);
  }

  Future<String?> uploadImage(String filePath) async {
    return await StorageService().uploadImage(
        _auth.currentUser!.uid + DateTime.now().toIso8601String(), filePath);
  }

  String getuserimage() {
    return _auth.currentUser!.photoURL ??
        "https://avatar.iran.liara.run/public";
  }
}
