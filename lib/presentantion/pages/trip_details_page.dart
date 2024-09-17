import 'package:flutter/material.dart';
import 'package:student_tawsel/presentantion/pages/home_page.dart';
import 'package:student_tawsel/presentantion/widgets/avatar_widget.dart';
import 'package:student_tawsel/presentantion/widgets/driver_details_widget.dart';
import 'package:student_tawsel/presentantion/widgets/live_location_tracking_widget.dart';

class TripDetailsPage extends StatelessWidget {
  final String student;

  const TripDetailsPage({
    super.key,
    required this.student,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 139,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(22),
              bottomRight: Radius.circular(22),
            ),
          ),
          backgroundColor: const Color(0xff182243),
          elevation: 0,
          centerTitle: true,
          title: Row(children: [
            const AvatarWidget(),
            const SizedBox(width: 10),
            Text(student,
                style: const TextStyle(
                  fontFamily: "Inter",
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ))
          ])),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Driver",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
                )),
            SizedBox(height: 26),
            DriverDetailsWidget(),
            SizedBox(height: 26),
            LiveLocationTrackingWidget(),
          ],
        ),
      ),
    );
  }
}
