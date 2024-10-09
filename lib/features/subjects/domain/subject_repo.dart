import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:student_tawsel/features/subjects/data/subject_model.dart';

class SubjectRepository {
  final _db = FirebaseFirestore.instance;

  Future<List<SubjectModel>> getAllSubjects() async {
    try {
      QuerySnapshot snapshot = await _db.collection("subjects").get();

      List<SubjectModel> subjects = snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        data['id'] = doc.id; // Include the document ID if necessary
        return SubjectModel.fromMap(data);
      }).toList();

      return subjects;
    } catch (e) {
      print('Error fetching subjects: $e');
      rethrow;
    }
  }

  // Fetch subjects by list of IDs
  Future<List<SubjectModel>> getSubjectsById(List<String> ids) async {
    final queryResult =
        await _db.collection("Subjects").where('id', whereIn: ids).get();

    final subjectsList =
        queryResult.docs.map((e) => SubjectModel.fromMap(e.data())).toList();
    return subjectsList;
  }
}
