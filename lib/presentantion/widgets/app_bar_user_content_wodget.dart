import 'package:flutter/material.dart';
import 'package:student_tawsel/generated/l10n.dart';
import 'package:student_tawsel/presentantion/pages/home_page.dart';
import 'package:student_tawsel/presentantion/widgets/avatar_widget.dart';

class AppBarUserContentWidget extends StatefulWidget {
  const AppBarUserContentWidget({
    super.key,
  });

  @override
  State<AppBarUserContentWidget> createState() =>
      _AppBarUserContentWidgetState();
}

class _AppBarUserContentWidgetState extends State<AppBarUserContentWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const AvatarWidget(),
        const SizedBox(width: 13),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).profileName,
              style: const TextStyle(
                fontFamily: "Inter",
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            Text(
              S.of(context).profileEmail,
              style: const TextStyle(
                fontFamily: "Inter",
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
