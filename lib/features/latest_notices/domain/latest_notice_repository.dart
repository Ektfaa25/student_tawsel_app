import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:student_tawsel/features/latest_notices/data/latest_notices_model.dart';


class LatestNoticeRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  Future<void> addOrUpdateLatestNotice(LatestNoticeModel notice) async {
    try {
      await _firestore.collection('latest_notices').doc(notice.teacherId).set(
        notice.toMap(),
        SetOptions(merge: true), // Use merge to update existing documents
      );
      print("Successfully added/updated latest notice for teacher: ${notice.teacherId}");
    } catch (e) {
      print("Error adding/updating latest notice: $e");
    }
  }

  
  Future<LatestNoticeModel?> getLatestNoticeByTeacherId(String teacherId) async {
    try {
      DocumentSnapshot noticeSnapshot = await _firestore.collection('latest_notices').doc(teacherId).get();
      
      if (noticeSnapshot.exists) {
        return LatestNoticeModel.fromFirestore(noticeSnapshot.data() as Map<String, dynamic>);
      } else {
        print("No latest notice found for teacher ID: $teacherId");
        return null; 
      }
    } catch (e) {
      print("Error fetching latest notice: $e");
      return null; 
    }
  }

 
  Future<List<LatestNoticeModel>> getAllLatestNotices() async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('latest_notices').get();
      return querySnapshot.docs.map((doc) => LatestNoticeModel.fromFirestore(doc.data() as Map<String, dynamic>)).toList();
    } catch (e) {
      print("Error fetching all latest notices: $e");
      return []; 
    }
  }
}