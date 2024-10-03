import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:student_tawsel/features/subjects/data/subject_model.dart';


class SubjectRepository {
  final _db = FirebaseFirestore.instance;

  // Fetch all subjects
  Future<List<SubjectModel>> getAllSubjects() async {
    final queryResult = await _db.collection("Subjects").get();

    final subjectsList =
        queryResult.docs.map((e) => SubjectModel.fromMap(e.data())).toList();
    return subjectsList;
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