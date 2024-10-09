import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_tawsel/features/auth/firebase_auth.dart';
import 'package:student_tawsel/generated/l10n.dart';
import 'package:student_tawsel/features/presentantion/widgets/avatar_widget.dart';

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
        GestureDetector(child: const AvatarWidget()),
        const SizedBox(width: 13),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              FirebaseAuthService().getCurrentUserName(),
              style: const TextStyle(
                fontFamily: "Inter",
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            Text(
              FirebaseAuthService().getCurrentUserEmail(),
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

  // Future<void> getFiles() async {
  //   final ImagePicker picker = ImagePicker();
  //   final XFile? file = await picker.pickImage(source: ImageSource.gallery);

  //   if (file != null) {
  //     final url = await FirebaseAuthService().uploadImage(file.path);
  //     await FirebaseAuthService().updateuserimage(url!);
  //     setState(() {});
  //   } else {
  //     print("No image selected");
  //   }
  // }
}
