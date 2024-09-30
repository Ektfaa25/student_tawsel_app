import 'package:flutter/material.dart';
import 'package:student_tawsel/features/presentantion/widgets/latest_notices_card_content_widget.dart';

import 'package:student_tawsel/tacher_class.dart';

class LatestNoticesCardWidget extends StatelessWidget {
  const LatestNoticesCardWidget({super.key, this.itemssize});
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
            return LatestNoticesCardContentWidget(
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
