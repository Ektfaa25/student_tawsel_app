import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:student_tawsel/features/add_child/data/child_model.dart';

class ChildRepository {
  final _db = FirebaseFirestore.instance;

  // Fetch all children
  Future<List<ChildModel>> getChildren() async {
    final queryResult = await _db.collection("Children").get();

    final childList =
        queryResult.docs.map((e) => ChildModel.fromMap(e.data())).toList();
    return childList;
  }

  // Fetch children by list of IDs
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
}
