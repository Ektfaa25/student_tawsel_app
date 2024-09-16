class Student {
  final String name;
  final String level;
  final String imagePath;

  Student({required this.name, required this.level, required this.imagePath});
}

final List<Student> studentData = [
  Student(
      name: "Ahmed",
      level: "Level 2",
      imagePath: "assets/smiling-face-of-a-child-2 1.png"),
  Student(
      name: "ALI",
      level: "Level 5",
      imagePath: "assets/smiling-face-of-a-child-2 1.png"),
  Student(
      name: "Ahmed",
      level: "Level 2",
      imagePath: "assets/smiling-face-of-a-child-2 1.png"),
  Student(
      name: "ALI",
      level: "Level 5",
      imagePath: "assets/smiling-face-of-a-child-2 1.png"),
  Student(
      name: "Ahmed",
      level: "Level 2",
      imagePath: "assets/smiling-face-of-a-child-2 1.png"),
  Student(
      name: "ALI",
      level: "Level 5",
      imagePath: "assets/smiling-face-of-a-child-2 1.png"),
];

  // // Example usage
  // for (var student in studentData) {
  //   print('${student.name} is in ${student.level}');
  // }