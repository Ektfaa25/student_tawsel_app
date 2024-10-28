import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:student_tawsel/features/auth/data/user_model.dart';

import 'package:student_tawsel/features/auth/domain/repository/user_repo.dart';
import 'package:student_tawsel/features/parent/data/parent_model.dart';
import 'package:student_tawsel/features/parent/domain/parent_repository.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final ParentRepository _parentRepo = ParentRepository();

  // Sign in with email and password for parents
  Future<User?> signInParent(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // ParentModel? parent =
      //     await _parentRepo.getParentById(userCredential.user!.uid);

      // if (parent != null && parent.role == 'parent') {

      // } else {
      //   await signOut();
      return userCredential.user;
    } catch (e) {
      print("Error signing in parent: $e");
      return null;
    }
  }

  // Sign out
  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<User?> signUpWithEmailAndPassword(BuildContext context, String email,
      String password, String username, String address, String phone) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await credential.user?.updateDisplayName(username);

      ParentModel parent = ParentModel(
        id: credential.user!.uid,
        name: username,
        email: email,
        role: 'parent',
        children: [],
        phone: phone,
        address: address,
      );

      await _parentRepo.saveParent(parent);

      return credential.user;
    } catch (e) {
      print("Error: ${e.toString()}");
      return null;
    }
  }

  void createOrUpdateFirestoreUser(
    User? user,
    String role,
  ) {
    if (user != null) {
      UserRepository().createUser(UserModel.fromFirebaseAuthUser(user, role));
    }
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
    return _auth.currentUser?.displayName ?? "guest";
  }

  String getCurrentUserEmail() {
    return _auth.currentUser?.email ?? "guest@example.com";
  }

  getCurrentUserid() {
    return _auth.currentUser?.uid;
  }

  Stream<User?> authState() {
    return _auth.authStateChanges();
  }
}
