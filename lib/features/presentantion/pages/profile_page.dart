import 'package:flutter/material.dart';
import 'package:student_tawsel/core/theme/app_pallete.dart';
import 'package:student_tawsel/generated/l10n.dart';
import 'package:student_tawsel/features/presentantion/widgets/app_bar_back_ground_widget.dart';
import 'package:student_tawsel/features/presentantion/pages/children_page.dart';
import 'package:student_tawsel/features/presentantion/widgets/app_bar_user_content_wodget.dart';
import 'package:student_tawsel/features/presentantion/widgets/password_change_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: const AppBarBackGroundWidget(),
          automaticallyImplyLeading: false,
          title: const AppBarUserContentWidget(),
        ),
        body: Column(children: [
          Expanded(
              child: ListView(children: [
            profileoptionlist(
              icon: "assets/MyProfile.png",
              title: S.of(context).address,
              onTap: () {},
              context: context,
            ),
            profileoptionlist(
              icon: "assets/icongroup.png",
              title: S.of(context).children,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ChildrenPage();
                }));
              },
              context: context,
            ),
            profileoptionlist(
              icon: "assets/cart.png",
              title: S.of(context).cart,
              onTap: () {},
              context: context,
            ),
            profileoptionlist(
              icon: "assets/editpencil.png",
              title: S.of(context).changepassword,
              onTap: () {
                _changePasswordSheet(context);
              },
              context: context,
            ),
          ]))
        ]));
  }

  Future _changePasswordSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return const PasswordChangeWidget();
      },
    );
  }
}

Widget profileoptionlist({
  required String icon,
  required String title,
  required VoidCallback onTap,
  required BuildContext context,
}) {
  return ListTile(
    contentPadding: const EdgeInsets.only(left: 18, right: 18, top: 28),
    leading: Container(
        height: 50,
        width: 50,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xff182243),
        ),
        child: Image.asset(icon)),
    title: Text(
      title,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(),
    ),
    trailing:
        Icon(Icons.arrow_forward_ios, color: Theme.of(context).iconTheme.color),
    onTap: onTap,
  );
}
