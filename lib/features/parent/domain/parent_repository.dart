import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:student_tawsel/features/parent/data/parent_model.dart';

class ParentRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch parent data by ID
 
 Future<ParentModel?> getParentById(String id) async {
  try {
    DocumentSnapshot doc = await _firestore.collection('users').doc(id).get();

    if (doc.exists) {
      // Print the document data for debugging purposes
      print('Document data: ${doc.data()}');

      // Safely cast to Map<String, dynamic> and check for null
      Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;
      
      if (data != null) {
        print('Role: ${data['role']}');

        // Check if the role is 'parent'
        if (data['role'] == 'parent') {
          return ParentModel.fromMap(doc);
        } else {
          print("Role is not parent, it's ${data['role']}");
          return null; // Role is not 'parent'
        }
      } else {
        print('Data is null');
        return null;
      }
    } else {
      print('Document does not exist');
      return null; // Document does not exist
    }
  } catch (e) {
    print("Error getting parent data: $e");
    return null;
  }
}
//  Future<ParentModel?> getParentById(String id) async {
//     try {
//       DocumentSnapshot doc = await _firestore.collection('users').doc(id).get();
//        if (doc.exists) {
      
//         Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;
//         if (data != null && data['role'] == 'parent') {
//           return ParentModel.fromMap(doc);
//         }
//       } else {
//         return null;
//       }
//     } catch (e) {
//       print("Error getting parent data: $e");
//       return null;
//     }
//     return null;
//   }  

  // Save or update parent data
  Future<void> saveParent(ParentModel parent) async {
    try {
      await _firestore
          .collection('users')
          .doc(parent.id)
          .set(parent.toMap());
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
