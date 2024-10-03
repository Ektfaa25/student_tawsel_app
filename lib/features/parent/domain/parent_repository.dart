import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:student_tawsel/features/parent/data/parent_model.dart';

class ParentRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch parent data by ID
  Future<ParentModel?> getParentById(String id) async {
    try {
      DocumentSnapshot doc = await _firestore.collection('users').doc(id).get();
      if (doc.exists && doc['role'] == 'parent') {
        return ParentModel.fromFirestore(doc);
      } else {
        return null;
      }
    } catch (e) {
      print("Error getting parent data: $e");
      return null;
    }
  }

  // Save or update parent data
  Future<void> saveParent(ParentModel parent) async {
    try {
      await _firestore
          .collection('users')
          .doc(parent.id)
          .set(parent.toFirestore());
    } catch (e) {
      print("Error saving parent data: $e");
    }
  }

  // Delete parent data
  Future<void> deleteParent(String id) async {
    try {
      await _firestore.collection('users').doc(id).delete();
    } catch (e) {
      print("Error deleting parent data: $e");
    }
  }
}
