import 'package:flutter/material.dart';
import 'package:student_tawsel/generated/l10n.dart';
import 'package:student_tawsel/presentantion/widgets/app_bar_back_ground_widget.dart';
import 'package:student_tawsel/presentantion/widgets/avatar_widget.dart';
import 'package:student_tawsel/presentantion/widgets/button_selection_widget.dart';
import 'package:student_tawsel/presentantion/widgets/live_location_tracking_widget.dart';
import 'package:student_tawsel/presentantion/widgets/pop_up_menu_widget.dart';
import 'package:student_tawsel/presentantion/widgets/trips_widget.dart';

class TrackingPage extends StatelessWidget {
  final String student;

  final String subject;
  const TrackingPage({
    super.key,
    required this.student,
    required this.subject,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> menuItems = [
      S.of(context).menuTeachers,
      S.of(context).menuAttendance,
      S.of(context).menuAssignments,
      S.of(context).menuTimeTable,
      S.of(context).menuExams,
      S.of(context).menuResults,
    ];

    final List<String> menuImgs = [
      "assets/icongroup.png",
      "assets/ icon _iris scan_.png",
      "assets/ icon _book stack_.png",
      "assets/icon _alarm_.png",
      "assets/ icon _page edit_.png",
      "assets/icon _printer alt_.png",
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: const AppBarBackGroundWidget(),
        title: Row(children: [
          const AvatarWidget(),
          const SizedBox(width: 10),
          Text(student,
              style: const TextStyle(
                fontFamily: "Inter",
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              )
              )
        ]),
        actions: [PopUpMenuWidget(menuItems: menuItems, menuImgs: menuImgs)],
      ),
      body: Padding(
          padding: const EdgeInsets.all(17),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ButtonSelectionWidget(
                btnSelectone: "Subjects",
                btnSelecttwo: "Tracking",
                isSelectedfirst: false,
                student: student,
                subject: subject),
            const LiveLocationTrackingWidget(),
            const SizedBox(height: 30),
            const Text("Trips",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
                )),
            TripsWidget(student: student),
          ])),
    );
  }
}
