import 'dart:convert';

class VideoModel {
  final String fileName;
  final String downloadURL;
  final String fileDescription;

  VideoModel({
    required this.fileName,
    required this.downloadURL,
    required this.fileDescription,
  });

  factory VideoModel.fromMap(Map<String, dynamic> map) {
    return VideoModel(
      fileName: map['fileName'] ?? '',
      downloadURL: map['downloadURL'] ?? '',
      fileDescription: map['fileDescription'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'fileName': fileName,
      'downloadURL': downloadURL,
      'fileDescription': fileDescription,
    };
  }

  factory VideoModel.fromJson(String source) =>
      VideoModel.fromMap(json.decode(source));

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'VideoModel(fileName: $fileName, downloadURL: $downloadURL, fileDescription: $fileDescription)';
  }
}
