class SubjectModel {
  final String? id;
  final String subjectName;
  final String subjectImg; // This could store the URL of the subject icon

  SubjectModel({
    this.id,
    required this.subjectName,
    required this.subjectImg,
  });

  // Convert Firestore document to SubjectModel
  factory SubjectModel.fromMap(Map<String, dynamic> map) {
    return SubjectModel(
      id: map['id'],
      subjectName: map['subjectName'] ?? '',
      subjectImg: map['subjectImg'] ?? '',
    );
  }

  // Convert SubjectModel to Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'subjectName': subjectName,
      'subjectImg': subjectImg,
    };
  }
}
