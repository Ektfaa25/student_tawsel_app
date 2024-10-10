import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:student_tawsel/features/subjects/data/video_model.dart';

class VideoRepository {
  final _videosCollection = FirebaseFirestore.instance.collection('videos');

  // Add a new video document
  Future<void> addVideo(VideoModel video) async {
    try {
      DocumentReference docRef = _videosCollection.doc();
      await docRef.set(video.toMap());
    } catch (e) {
      print('Error adding video: $e');
      rethrow;
    }
  }

  // Fetch all videos once
  Future<List<VideoModel>> getAllVideos() async {
    try {
      QuerySnapshot snapshot = await _videosCollection.get();
      List<VideoModel> videos = snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return VideoModel.fromMap(data);
      }).toList();
      return videos;
    } catch (e) {
      print('Error fetching videos: $e');
      rethrow;
    }
  }

  // Get videos as a stream for real-time updates
  Stream<List<VideoModel>> getVideosStream() {
    return _videosCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return VideoModel.fromMap(data);
      }).toList();
    });
  }



  
}
