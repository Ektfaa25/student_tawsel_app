import 'package:flutter/material.dart';
import 'package:student_tawsel/features/presentantion/pages/trip_details_page.dart';
import 'package:student_tawsel/trip_data.dart';

class TripsWidget extends StatelessWidget {
  final String student;

  const TripsWidget({
    super.key,
    required this.student,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: trips.length,
        itemBuilder: (context, index) {
          return Container(
            height: 100,
            width: 353,
            margin: const EdgeInsets.all(10),
            child: Card(
                elevation: 4,
                color: const Color(0xffF6F6F6),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TripDetailsPage(
                                    student: student,
                                  )));
                    },
                    contentPadding: const EdgeInsets.all(8),
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          trips[index].driverName,
                          style: const TextStyle(
                              fontFamily: "Inter",
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                        Text(
                          trips[index].phoneNumber,
                          style: const TextStyle(
                              decoration: TextDecoration.underline,
                              fontFamily: "Inter",
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Color(0xff474747)),
                        ),
                      ],
                    ),
                    trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            trips[index].status,
                            style: const TextStyle(
                                fontFamily: "Inter",
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                decoration: TextDecoration.underline,
                                color: Colors.black),
                          ),
                          Text(
                            trips[index].location,
                            style: const TextStyle(
                                fontFamily: "Inter",
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: Colors.black),
                          ),
                          Text(
                            trips[index].route,
                            style: const TextStyle(
                                fontFamily: "Inter",
                                fontSize: 10,
                                fontWeight: FontWeight.normal,
                                color: Colors.black),
                          ),
                        ]))),
          );
        },
      ),
    );
  }
}
