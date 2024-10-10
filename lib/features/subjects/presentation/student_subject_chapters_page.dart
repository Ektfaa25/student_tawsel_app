import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:student_tawsel/features/subjects/data/pdf_model.dart';
import 'package:student_tawsel/features/subjects/domain/pdf_rep.dart';
import 'package:student_tawsel/popup_menu_data.dart';
import 'package:student_tawsel/features/presentantion/widgets/app_bar_back_ground_widget.dart';
import 'package:student_tawsel/features/presentantion/widgets/avatar_widget.dart';
import 'package:student_tawsel/features/presentantion/widgets/button_selection_widget.dart';
import 'package:student_tawsel/features/presentantion/widgets/chapter_card_widget.dart';
import 'package:student_tawsel/features/presentantion/widgets/pop_up_menu_widget.dart';

class StudentSubjectChaptersPage extends StatefulWidget {
  final String? student;
  final String subject;
  const StudentSubjectChaptersPage({
    super.key,
    required this.student,
    required this.subject,
  });

  @override
  State<StudentSubjectChaptersPage> createState() =>
      _StudentSubjectChaptersPageState();
}

class _StudentSubjectChaptersPageState
    extends State<StudentSubjectChaptersPage> {
  List<String> pdfAssetPaths = [
    'assets/pdf/Basicofscience.pdf',
    'assets/pdf/BasicofMath.pdf',
  ];
  List<Map<String, String>> uploadedFiles = [];
  bool isUploading = false;

  @override
  void initState() {
    super.initState();
    // upload();
  }

  upload() async {
    await uploadAssets();
  }

  Future<Uint8List> loadAssetFile(String assetPath) async {
    ByteData byteData = await rootBundle.load(assetPath);
    return byteData.buffer.asUint8List();
  }

  Future<void> uploadAssets() async {
    setState(() {
      isUploading = true;
    });

    for (String assetPath in pdfAssetPaths) {
      String fileName = assetPath.split('/').last;
      Uint8List fileData = await loadAssetFile(assetPath);
      String downloadURL = await uploadFileToFirebase(fileData, fileName);

      if (downloadURL.isNotEmpty) {
        await saveFiledataToFirestore(fileName, downloadURL);
        uploadedFiles.add({'fileName': fileName, 'downloadURL': downloadURL});
      } else {
        print('Failed to upload $fileName');
      }
    }

    setState(() {
      isUploading = false;
    });

    print('All files uploaded successfully.');
  }

  Future<String> uploadFileToFirebase(
      Uint8List fileData, String fileName) async {
    try {
      Reference storageRef =
          FirebaseStorage.instance.ref().child('pdfs/$fileName');
      UploadTask uploadTask = storageRef.putData(fileData);
      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
      String downloadURL = await taskSnapshot.ref.getDownloadURL();
      return downloadURL;
    } catch (e) {
      print('Error uploading file: $e');
      return '';
    }
  }

  Future<void> saveFiledataToFirestore(
      String fileName, String downloadURL) async {
    await FirebaseFirestore.instance.collection('pdfs').add({
      'fileName': fileName,
      'downloadURL': downloadURL,
      'fileDescription': '$fileName ch1',
    });

    print('File data saved to Firestore.');
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.student!,
                style: const TextStyle(
                  fontFamily: "Inter",
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
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
              subject: widget.subject.toString(),
              btnSelectone: "Chapters",
              btnSelecttwo: "Announcements",
              isSelectedfirst: true),
          const SizedBox(
            height: 26,
          ),
          FutureBuilder<List<PDFModel>>(
              future: PDFRepository().getAllPDFs(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No pdfs found.'));
                } else {
                  final pdfs = snapshot.data!;
                  return ChapterCardWidget(
                    student: widget.student!,
                    pdfs: pdfs,
                  );
                }
              })
        ],
      ),
    );
  }
}
