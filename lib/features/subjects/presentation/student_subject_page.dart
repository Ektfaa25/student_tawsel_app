import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:student_tawsel/features/add_child/data/child_model.dart';
import 'package:student_tawsel/features/add_child/domain/child_repo.dart';

import 'package:student_tawsel/features/presentantion/widgets/avatar_widget.dart';
import 'package:student_tawsel/features/presentantion/widgets/button_selection_widget.dart';

import 'package:student_tawsel/features/subjects/data/subject_model.dart';
import 'package:student_tawsel/features/auth/domain/repository/firebase_storage.dart';
import 'package:student_tawsel/features/subjects/domain/subject_repo.dart';

import 'package:student_tawsel/features/presentantion/widgets/pop_up_menu_widget.dart';
import 'package:student_tawsel/generated/l10n.dart';
import 'package:student_tawsel/popup_menu_data.dart';

class StudentSubjectPage extends StatefulWidget {
  final String? level;

  final String? name;

  const StudentSubjectPage({
    super.key,
    this.name,
    this.level,
  });

  @override
  State<StudentSubjectPage> createState() => _StudentSubjectPageState();
}

class _StudentSubjectPageState extends State<StudentSubjectPage> {
  @override
  void initState() {
    super.initState();
    // createTask(subjects);
    // addSubjectsForStudent(subjects);
    //  uploadImage();
    childrenToStudentsWithSubjects(subjects);
  }

  bool uploadDone = false, startProgress = false;
  UploadTask? uploadTask;
  List<String> imagesList = [];

  Future<File> getTemporaryFileFromAsset(String assetPath) async {
    final byteData = await rootBundle.load(assetPath); // Load asset data
    final tempDir = await getTemporaryDirectory(); // Get temp directory
    final file = File(
        '${tempDir.path}/${assetPath.split('/').last}'); // Create temp file
    return file
        .writeAsBytes(byteData.buffer.asUint8List()); // Write data to file
  }

  Future uploadImage() async {
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

    for (int i = 0; i < myImagePath.length; i++) {
      // Load the asset and create a temporary file
      final file = await getTemporaryFileFromAsset(myImagePath[i]);

      final ref = FirebaseStorage.instance
          .ref()
          .child('uploads/${file.path.split('/').last}');

      setState(() {
        startProgress = true;
        uploadTask = ref.putFile(file); // Start uploading
      });

      final snapShot =
          await uploadTask!.whenComplete(() {}); // Wait for upload to complete
      final downloadUrl =
          await snapShot.ref.getDownloadURL(); // Get the download URL
      imagesList.add(downloadUrl);

      setState(() {
        if (imagesList.length == myImagePath.length)
          uploadDone = true; // Set uploadDone when all images are uploaded
        startProgress = false;
      });
    }
  }

  // Build a progress widget for tracking upload progress
  Widget buildProgress() => StreamBuilder<TaskSnapshot>(
      stream: uploadTask?.snapshotEvents,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          final task = snapshot.data!;
          double progress = task.bytesTransferred / task.totalBytes;

          return Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 10),
            child: SizedBox(
              height: 50,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.grey,
                    color: Colors.green,
                  ),
                  Center(
                    child: Text('${(100 * progress).roundToDouble()}%'),
                  )
                ],
              ),
            ),
          );
        } else {
          return const CircularProgressIndicator();
        }
      });

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

  Future<void> addSubjectsForStudent(List<SubjectModel> subjects) async {
    FirebaseStorageService storageService = FirebaseStorageService();
    final _db = FirebaseFirestore.instance; // Firestore instance

    List<Map<String, dynamic>> subjectsData = [];

    for (SubjectModel subject in subjects) {
      // Upload the subject image to Firebase Storage
      File file = File(subject.subjectImg);

      if (await file.exists()) {
        print('File for ${subject.subjectName} does not exist!');
        continue; // Skip if the file does not exist
      }

      // Define the storage path for each subject image
      String storagePath =
          'subjects/${subject.subjectName}/${(subject.subjectImg)}';

      // Upload the image and get the download URL
      String? downloadUrl = await storageService.uploadFile(file, storagePath);

      if (downloadUrl != null) {
        // Prepare the data to be stored in Firestore
        subjectsData.add({
          'subjectName': subject.subjectName,
          'subjectImg': downloadUrl, // Store the download URL in Firestore
        });
      }
    }

    // Save the list of subjects to Firestore under the student document
    await _db.collection("students").doc().set({
      'subjects': subjectsData,
    }, SetOptions(merge: true)); // Merges with existing data
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // flexibleSpace: const AppBarBackGroundWidget(),
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
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1,
                    ),
                    itemCount: subjects.length,
                    itemBuilder: (context, index) {
                      final subject = subjects[index];
                      return GestureDetector(
                        onTap: () {
                          // uploadImage();
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(19)),
                              ),
                              child: Image.asset(subject.subjectImg,
                                  height: 90, width: 109),
                            ),
                            const SizedBox(height: 10),
                            Text(subject.subjectName,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith()),
                          ],
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
