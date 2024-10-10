import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:student_tawsel/features/subjects/data/video_model.dart';
import 'package:student_tawsel/features/subjects/domain/video_repo.dart';

import 'package:student_tawsel/popup_menu_data.dart';
import 'package:student_tawsel/features/presentantion/widgets/avatar_widget.dart';
import 'package:student_tawsel/features/presentantion/widgets/button_selection_widget.dart';
import 'package:student_tawsel/features/presentantion/widgets/pop_up_menu_widget.dart';
import 'package:student_tawsel/features/presentantion/widgets/video_card_widget.dart';

class VideosPage extends StatefulWidget {
  final String student;

  const VideosPage({
    super.key,
    required this.student,
  });

  @override
  State<VideosPage> createState() => _VideosPageState();
}

class _VideosPageState extends State<VideosPage> {
  List<String> vidAssetPaths = ['assets/vids/mathvid.mp4'];
  Future<Uint8List> loadAssetFile(String assetPath) async {
    ByteData byteData = await rootBundle.load(assetPath);
    return byteData.buffer.asUint8List();
  }

  Future<String> uploadFileToFirebase(vidAssetPaths, String fileName) async {
    try {
      Reference storageRef =
          FirebaseStorage.instance.ref().child('videos/$fileName');

      UploadTask uploadTask = storageRef.putData(vidAssetPaths);

      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);

      String downloadURL = await taskSnapshot.ref.getDownloadURL();

      return downloadURL;
    } catch (e) {
      print('Error uploading file: $e');
      return '';
    }
  }

  Future<void> uploadVideos() async {
    for (String assetPath in vidAssetPaths) {
      String fileName = assetPath.split('/').last;

      Uint8List fileData = await loadAssetFile(assetPath);

      if (fileData.isNotEmpty) {
        String downloadURL = await uploadFileToFirebase(fileData, fileName);

        if (downloadURL.isNotEmpty) {
          VideoModel video = VideoModel(
            fileName: fileName,
            downloadURL: downloadURL,
            fileDescription: '$fileName.mp4',
          );

          
          await VideoRepository().addVideo(video);
        } else {
          print('Failed to upload $fileName');
        }
      } else {
        print('Failed to load $fileName');
      }
    }
  }

  Future<void> saveVideodataToFirestore(VideoModel video) async {
    final videosCollection = FirebaseFirestore.instance.collection('videos');

    await videosCollection.add(video.toMap());

    print('Video data saved to Firestore.');
  }

  @override
  void initState() {
    super.initState();
    //  uploadVideos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            const AvatarWidget(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.student,
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
          const ButtonSelectionWidget(
            btnSelectone: "Files",
            btnSelecttwo: "Videos",
            isSelectedfirst: false,
          ),
          StreamBuilder<List<VideoModel>>(
              stream: VideoRepository().getVideosStream(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(child:  Text('Error fetching videos'));
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                List<VideoModel> videos = snapshot.data ?? [];

                if (videos.isEmpty) {
                  return const Center(child: Text('No videos available.'));
                }
                return VideoCardWidget(video: videos, student: widget.student);
              })
        ],
      ),
    );
  }
}
