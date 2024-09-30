import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:student_tawsel/features/auth/data/subject_model.dart';

class SubjectRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Add a new subject to Firestore
  Future<bool> addSubject(SubjectModel subject) async {
    try {
      await _db.collection("Subjects").add(subject.toMap());

      return true;
    } catch (e) {
      print('Error adding subject: $e');
      return false;
    }
  }
  //  Future<String?> uploadImage(String imageId, String filePath) async {
  //   var file = File(filePath);

  //   final task = await FirebaseStorage.instance
  //       .ref()
  //       .child("images/users/$imageId")
  //       .putFile(file);

  //   return task.ref.getDownloadURL();
  // }

  // Retrieve all subjects from Firestore
  Future<List<SubjectModel>> getSubjects() async {
    final queryResult = await _db.collection("Subjects").get();

    final subjectsList =
        queryResult.docs.map((e) => SubjectModel.fromMap(e.data())).toList();
    return subjectsList;
  }
}
