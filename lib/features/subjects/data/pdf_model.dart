import 'dart:convert';

class PDFModel {
  final String fileName;
  final String downloadURL;
  final String fileDescription;

  PDFModel({
    required this.fileName,
    required this.downloadURL,
    required this.fileDescription,
  });

  factory PDFModel.fromMap(Map<String, dynamic> map) {
    return PDFModel(
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

  factory PDFModel.fromJson(String source) =>
      PDFModel.fromMap(json.decode(source));

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'PDFModel( fileName: $fileName, downloadURL: $downloadURL, fileDescription: $fileDescription)';
  }
}
