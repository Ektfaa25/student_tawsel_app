import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:student_tawsel/features/add_child/data/child_model.dart';

class ChildRepository {
  final _db = FirebaseFirestore.instance;

  Future<List<ChildModel>> getChildren() async {
    String parentUid = FirebaseAuth.instance.currentUser!.uid;

    DocumentSnapshot parentDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(parentUid)
        .get();

    if (parentDoc.exists) {
      Map<String, dynamic> parentData =
          parentDoc.data() as Map<String, dynamic>;

      List children = parentData['children'];
      List<ChildModel> childModels = children.map((child) {
        return ChildModel(
          id: child['childId'],
          name: child['username'],
          gender: '',
          level: child['grade'],
          dateOfBirth: DateTime.now(),
          phone: '',
        );
      }).toList();

      return childModels;
    } else {
      return [];
    }
  }

  Future<List<ChildModel>> getChildrenById(List<String> ids) async {
    final queryResult =
        await _db.collection("Children").where('id', whereIn: ids).get();

    final childList =
        queryResult.docs.map((e) => ChildModel.fromMap(e.data())).toList();
    return childList;
  }

  // Create or update a child document
  Future<bool> createChild(ChildModel child) async {
    await _db
        .collection("Children")
        .doc(child.id)
        .set(child.toMap())
        .whenComplete(() => true)
        .catchError((error, stackTrace) {
      print('Error creating child: $error');
      return;
    });

    return true;
  }

  Future<String> getUserName() async {
    DocumentSnapshot userDoc = await _db.collection('children').doc('id').get();

    if (userDoc.exists) {
      return userDoc['name']; 
    } else {
      return 'Unknown User';
    }
  }
}
