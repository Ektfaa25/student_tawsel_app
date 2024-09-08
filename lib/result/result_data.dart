class Exam {
  final String examName;
  final String examDate;
  final String grade;
  final String status;
  final String percentage;

  Exam({
    required this.examName,
    required this.examDate,
    required this.grade,
    required this.status,
    required this.percentage,
  });
}

final List<Exam> exams = [
  Exam(
    examName: 'Mid term Math',
    examDate: '01-12-2023',
    grade: ' Grade : A',
    status: 'Pass',
    percentage: 'percentage : 90%',
  ),
  Exam(
    examName: 'Mid term Science',
    examDate: '01-12-2023',
    grade: ' Grade : B',
    status: 'Pass',
    percentage: 'percentage : 80%',
  ),
  Exam(
    examName: 'Mid term Science',
    examDate: '01-12-2023',
    grade: ' Grade : A+',
    status: 'Pass',
    percentage: 'percentage : 98%',
  ),
  Exam(
    examName: 'Mid term Math',
    examDate: '01-12-2023',
    grade: ' Grade : F',
    status: 'Fail',
    percentage: 'percentage : 38%',
  ),
  Exam(
    examName: 'Mid term Science',
    examDate: '01-12-2023',
    grade: ' Grade : F',
    status: 'Fail',
    percentage: 'percentage : 25%',
  ),
  Exam(
    examName: 'Mid term Science',
    examDate: '01-12-2023',
    grade: ' Grade : F',
    status: 'Fail',
    percentage: 'percentage : 25%',
  ),
];
List<Exam> filterExams(List<Exam> exams, String status) {
  return exams.where((exam) => exam.status == status).toList();
}
