import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class StorageService {
  Future<String?> uploadImage(String imageId, String filePath) async {
    var file = File(filePath);

    final task = await FirebaseStorage.instance
        .ref()
        .child("images/users/$imageId")
        .putFile(file);

    return task.ref.getDownloadURL();
  }


  Future<String?> uploadAudioToFirebase(String filePath) async {
    try {
      File audioFile = File(filePath);
      String fileName = filePath.split('/').last;

      // Create a Firebase Storage reference
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref().child("audio_files").child(fileName);

      // Upload the file
      UploadTask uploadTask = ref.putFile(audioFile);
      TaskSnapshot snapshot = await uploadTask;

      // Once the upload is complete, get the download URL
      String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      debugPrint('Error uploading audio: $e');
      return null;
    }
  }
}
