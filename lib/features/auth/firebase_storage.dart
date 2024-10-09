import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:student_tawsel/features/subjects/data/subject_model.dart';

class FirebaseStorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final storageRef = FirebaseStorage.instance.ref();

  // upload return the download URL
  Future<String?> uploadFile(
    File file,
  ) async {
    try {
      final ref =
          storageRef.child('images/${DateTime.now().millisecondsSinceEpoch}');

      final uploadTask = ref.putFile(file);

      // Wait for the upload to complete
      final snapShot = await uploadTask.whenComplete(() => null);
      final downloadUrl =
          await snapShot.ref.getDownloadURL(); // Get the download URL
      return downloadUrl;
    } catch (e) {
      print('Error uploading file: $e');
      return null;
    }
  }

  Future<List<SubjectModel>> getSubjectsForStudent(String studentId) async {
    final _db = FirebaseFirestore.instance;
    final docSnapshot = await _db.collection("students").doc(studentId).get();

    if (docSnapshot.exists && docSnapshot.data() != null) {
      final subjectsList = (docSnapshot.data()!['subjects'] as List)
          .map((subject) => SubjectModel.fromMap(subject))
          .toList();

      return subjectsList;
    } else {
      return [];
    }
  }
}
