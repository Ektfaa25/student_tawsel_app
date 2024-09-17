import 'package:student_tawsel/generated/l10n.dart';

final List<String> images = [
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

final List<String> menuImgs = [
  "assets/icongroup.png",
  "assets/ icon _iris scan_.png",
  "assets/ icon _book stack_.png",
  "assets/icon _alarm_.png",
  "assets/ icon _page edit_.png",
  "assets/icon _printer alt_.png",
];

List<String> menuItems(context) => [
      S.of(context).menuTeachers,
      S.of(context).menuAttendance,
      S.of(context).menuAssignments,
      S.of(context).menuTimeTable,
      S.of(context).menuExams,
      S.of(context).menuResults,
    ];
