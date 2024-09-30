
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:student_tawsel/features/auth/data/user_model.dart';

class UserRepository {
  final _db = FirebaseFirestore.instance;

  Future<List<UserModel>> getUsers() async {
    final queryResult = await _db.collection("Users").get();

    final userList =
        queryResult.docs.map((e) => UserModel.fromMap(e.data())).toList();
    return userList;
  }

  Future<List<UserModel>> getUserById(List<String> ids) async {
    final queryResult =
        await _db.collection("Users").where('id', whereIn: ids).get();

    final userList =
        queryResult.docs.map((e) => UserModel.fromMap(e.data())).toList();
    return userList;
  }

  Future<bool> createUser(UserModel user) async {
    await _db
        .collection("Users")
        .doc(user.id)
        .set(user.toMap())
        .whenComplete(() => true)
        .catchError((error, stackTrace) => false);

    return true;
  }
}
