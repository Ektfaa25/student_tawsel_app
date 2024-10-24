import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:student_tawsel/features/teacher/data/teacher_model.dart';

class TeacherRepository {
  final _db = FirebaseFirestore.instance;

  final List<TeacherModel> teacherData = [
    TeacherModel(
      name: 'MR : Adel',
      profession: 'Science Teacher',
      message: 'Management Education Serves\nAnd Buses At Your Home',
      additionalInfo: 'Ahmed',
      phonenumer: '0123456789',
    ),
    TeacherModel(
      name: 'MR : Jasim',
      profession: 'Math Teacher',
      message: 'Management Education Serves\nAnd Buses At Your Home',
      additionalInfo: 'ALi',
      phonenumer: '0123456789',
    ),
    TeacherModel(
      name: 'MR : Ahmed',
      profession: 'Science Teacher',
      message: 'Management Education Serves\nAnd Buses At Your Home',
      additionalInfo: 'Ahmed',
      phonenumer: '0123456789',
    ),
    TeacherModel(
      name: 'MR : Ali',
      profession: 'Math Teacher',
      message: 'Management Education Serves\nAnd Buses At Your Home',
      additionalInfo: 'ALi',
      phonenumer: '0123456789',
    ),
  ];

  Future<void> addTeacher(TeacherModel teacher) async {
    await _db.collection("Teachers").add(teacher.toMap());
  }

  Future<void> addAllTeachersToFirestore() async {
    final teacherRepo = TeacherRepository();

    for (var teacher in teacherData) {
      await teacherRepo.addTeacher(teacher);
      print('Added ${teacher.name} to Firestore');
    }
  }

  Future<List<TeacherModel>> getAllTeachers() async {
    final queryResult = await _db.collection("Teachers").get();
    final teacherList = queryResult.docs
        .map((e) => TeacherModel.fromFirestore(e.data(), e.id))
        .toList();
    return teacherList;
  }

  Future<List<TeacherModel>> getTeachersById(List<String> ids) async {
    final queryResult =
        await _db.collection("Teachers").where('id', whereIn: ids).get();
    final teacherList = queryResult.docs
        .map((e) => TeacherModel.fromFirestore(e.data(), e.id))
        .toList();
    return teacherList;
  }
}
