class SubjectModel {
  final String? id;
  final String subjectName;
  String subjectImg;

  SubjectModel({
    this.id,
    required this.subjectName,
    required this.subjectImg,
  });

  factory SubjectModel.fromMap(Map<String, dynamic> map) {
    return SubjectModel(
      id: map['id'],
      subjectName: map['subjectName'] ?? '',
      subjectImg: map['subjectImg'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'subjectName': subjectName,
      'subjectImg': subjectImg,
    };
  }
}

List<SubjectModel> subjects = [
  SubjectModel(
    subjectName: 'Science',
    subjectImg: " assets/science.png",
  ),
  SubjectModel(
    subjectName: 'English',
    subjectImg: " assets/english.png",
  ),
  SubjectModel(
    subjectName: 'Arabic',
    subjectImg: "assets/arabic.png",
  ),
  SubjectModel(
    subjectName: 'Math',
    subjectImg: "assets/math.png",
  ),
  SubjectModel(
    subjectName: 'Drawing',
    subjectImg: "assets/drawing.png",
  ),
  SubjectModel(
    subjectName: 'Computer',
    subjectImg: "assets/computer.png",
  ),
  SubjectModel(
    subjectName: 'Accounting',
    subjectImg: "assets/account.png",
  ),
  SubjectModel(
    subjectName: 'Math2',
    subjectImg: "assets/math2.png",
  ),
  SubjectModel(
    subjectName: 'French',
    subjectImg: "assets/french.png",
  ),
];
