import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:student_tawsel/features/add_child/data/child_model.dart';
import 'package:student_tawsel/features/add_child/domain/child_repo.dart';
import 'package:student_tawsel/features/presentantion/widgets/app_bar_back_ground_widget.dart';

import 'package:student_tawsel/features/presentantion/widgets/avatar_widget.dart';
import 'package:student_tawsel/features/presentantion/widgets/button_selection_widget.dart';

import 'package:student_tawsel/features/subjects/data/subject_model.dart';
import 'package:student_tawsel/features/auth/firebase_storage.dart';
import 'package:student_tawsel/features/subjects/domain/subject_repo.dart';

import 'package:student_tawsel/features/presentantion/widgets/pop_up_menu_widget.dart';
import 'package:student_tawsel/features/subjects/presentation/student_subject_chapters_page.dart';
import 'package:student_tawsel/generated/l10n.dart';
import 'package:student_tawsel/popup_menu_data.dart';

class StudentSubjectPage extends StatefulWidget {
  final String? level;

  final String? name;
  final String? id;

  const StudentSubjectPage({
    super.key,
    this.name,
    this.level,
    this.id,
  });

  @override
  State<StudentSubjectPage> createState() => _StudentSubjectPageState();
}

class _StudentSubjectPageState extends State<StudentSubjectPage> {
  List<String> myImagePath = [
    "assets/science.png",
    "assets/english.png",
    "assets/arabic.png",
    "assets/math.png",
    "assets/drawing.png",
    "assets/computer.png",
    "assets/account.png",
    "assets/math2.png",
    "assets/french.png",
  ];

  @override
  void initState() {
    super.initState();
    // uploadSubjects();
  }

  bool uploadDone = false, startProgress = false;
  UploadTask? uploadTask;

  Future<Uint8List> loadAssetImage(String assetPath) async {
    ByteData byteData = await rootBundle.load(assetPath);
    return byteData.buffer.asUint8List();
  }

  Future<String> uploadAssetImage(String myImagePath, String fileName) async {
    try {
      Uint8List imageData = await loadAssetImage(myImagePath);

      Reference storageRef =
          FirebaseStorage.instance.ref().child('subjects/$fileName');

      UploadTask uploadTask = storageRef.putData(imageData);

      TaskSnapshot taskSnapshot = await uploadTask;

      String downloadUrl = await taskSnapshot.ref.getDownloadURL();

      return downloadUrl;
    } catch (e) {
      throw Exception('Error uploading image: $e');
    }
  }

  Future<void> uploadSubjects() async {
    List<SubjectModel> subjects = [
      SubjectModel(subjectName: 'Science', subjectImg: 'assets/science.png'),
      SubjectModel(subjectName: 'English', subjectImg: 'assets/english.png'),
      SubjectModel(subjectName: 'Arabic', subjectImg: 'assets/arabic.png'),
      SubjectModel(subjectName: 'Math', subjectImg: 'assets/math.png'),
      SubjectModel(subjectName: 'Drawing', subjectImg: 'assets/drawing.png'),
      SubjectModel(subjectName: 'Computer', subjectImg: 'assets/computer.png'),
      SubjectModel(subjectName: 'Accounting', subjectImg: 'assets/account.png'),
      SubjectModel(subjectName: 'Math2', subjectImg: 'assets/math2.png'),
      SubjectModel(subjectName: 'French', subjectImg: 'assets/french.png'),
    ];

    for (SubjectModel subject in subjects) {
      String assetPath = subject.subjectImg;
      String fileName =
          '${subject.subjectName}_${DateTime.now().millisecondsSinceEpoch}.png';

      try {
        String downloadUrl = await uploadAssetImage(assetPath, fileName);

        subject.subjectImg = downloadUrl;

        await FirebaseFirestore.instance
            .collection('subjects')
            .add(subject.toMap());

        print('Uploaded ${subject.subjectName} image to $downloadUrl');
      } catch (e) {
        print('Error uploading ${subject.subjectName} image: $e');
      }
    }
  }

  Future<void> addSubjectsForStudent(
      List<SubjectModel> subjectsWithImages, String studentId) async {
    final _db = FirebaseFirestore.instance; // Firestore instance
    List<Map<String, dynamic>> subjectsData = [];

    for (SubjectModel subject in subjectsWithImages) {
      subjectsData.add({
        'subjectName': subject.subjectName,
        'subjectImg': subject.subjectImg,
      });
    }

    if (subjectsData.isNotEmpty) {
      await _db.collection("students").doc(studentId).update({
        'subjects': subjectsData,
      });
      print('Subjects successfully added for student: $studentId');
    } else {
      print('No subjects were added');
    }
  }

  Future createSubjet(List<SubjectModel> subjects) async {
    for (var subject in subjects) {
      final taskData = FirebaseFirestore.instance.collection('Subjects').doc();
      final json = subject.toMap();
      await taskData.set(json);
    }
  }

  Future<void> childrenToStudentsWithSubjects(
      List<SubjectModel> subjects) async {
    List<ChildModel> children = await ChildRepository().getChildren();

    for (ChildModel child in children) {
      List<Map<String, dynamic>> subjectList =
          subjects.map((subject) => subject.toMap()).toList();

      DocumentReference studentRef =
          FirebaseFirestore.instance.collection('students').doc(child.id);

      await studentRef.set({
        'childId': child.id,
        'name': child.name,
        'gender': child.gender,
        'level': child.level,
        'dateOfBirth': child.dateOfBirth.toIso8601String(),
        'phone': child.phone,
        'subjects': subjectList,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: const AppBarBackGroundWidget(
          isloginparent: false,
        ),
        title: Row(
          children: [
            const AvatarWidget(),
            const SizedBox(
              width: 10,
            ),
            Text(
              widget.name!,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Colors.white),
            ),
          ],
        ),
        actions: [
          PopUpMenuWidget(menuItems: menuItems(context), menuImgs: menuImgs),
        ],
      ),
      body: Column(
        children: [
          ButtonSelectionWidget(
            btnSelectone: S.of(context).subjects,
            btnSelecttwo: S.of(context).tracking,
            isSelectedfirst: true,
            studentname: widget.name,
          ),
          Expanded(
            child: FutureBuilder<List<SubjectModel>>(
              future: SubjectRepository().getAllSubjects(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No subjects available.'));
                } else {
                  final subjects = snapshot.data!;
                  return SubjectGridWidget(
                      student: widget.name!, subjects: subjects);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SubjectGridWidget extends StatelessWidget {
  const SubjectGridWidget({
    super.key,
    required this.subjects,
    required this.student,
  });

  final List<SubjectModel> subjects;
  final String student;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: subjects.length,
      itemBuilder: (context, index) {
        final subject = subjects[index];

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => StudentSubjectChaptersPage(
                  student: student,
                  subject: subject.toString(),
                ),
              ),
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(19),
                child: Image.network(
                  subject.subjectImg,
                  height: 90,
                  width: 109,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ),
              const SizedBox(height: 10),
              Text(
                subject.subjectName,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        );
      },
    );
  }
}
