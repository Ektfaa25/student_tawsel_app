import 'package:flutter/material.dart';
import 'package:student_tawsel/homepage/tacher_class.dart';

class LatestNoticesCard extends StatelessWidget {
  const LatestNoticesCard({super.key, this.itemssize});
  final int? itemssize;

  _getCardcount() {
    if (itemssize != null) {
      return itemssize;
    } else {
      return teacherData.length;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: _getCardcount(),
          itemBuilder: (context, index) {
            return LatestNoticesCardContent(
              name: teacherData[index].name,
              profession: teacherData[index].profession,
              message: teacherData[index].message,
              additionalInfo: teacherData[index].additionalInfo,
            );
          },
        ),
      ],
    );
  }
}

class LatestNoticesCardContent extends StatelessWidget {
  final String name;
  final String profession;
  final String message;
  final String additionalInfo;

  const LatestNoticesCardContent({
    super.key,
    required this.name,
    required this.profession,
    required this.message,
    required this.additionalInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xffF6F6F6),
      margin: const EdgeInsets.only(
        left: 18,
        right: 19,
        top: 18,
      ),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(11),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 15, right: 12, top: 14, bottom: 17),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontFamily: "Inter",
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '$profession\n$additionalInfo',
                  style: const TextStyle(
                    fontFamily: "Inter",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Message',
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    decoration: TextDecoration.underline,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  message,
                  style: const TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w400,
                      fontSize: 10,
                      color: Color(0xff2D2828)),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
