import 'package:flutter/material.dart';

import 'package:student_tawsel/generated/l10n.dart';
import 'package:student_tawsel/features/presentantion/widgets/app_bar_back_ground_widget.dart';

class TeachersPage extends StatelessWidget {
  const TeachersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          // flexibleSpace: const AppBarBackGroundWidget(),
          title: Text(
            S.of(context).teachers,
          )),
    );
  }
}
