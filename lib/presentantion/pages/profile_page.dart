import 'package:flutter/material.dart';
import 'package:student_tawsel/generated/l10n.dart';
import 'package:student_tawsel/presentantion/pages/home_page.dart';
import 'package:student_tawsel/presentantion/widgets/app_bar_back_ground_widget.dart';
import 'package:student_tawsel/presentantion/pages/children_page.dart';
import 'package:student_tawsel/presentantion/widgets/password_change_widget.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 139,
          flexibleSpace: const AppBarBackGroundWidget(),
          backgroundColor: const Color(0xff182243),
          automaticallyImplyLeading: false,
          title: const AppBarUserContent(),
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(22),
              bottomRight: Radius.circular(22),
            ),
          ),
        ),
        body: Column(children: [
          Expanded(
              child: ListView(children: [
            profileoptionlist(
              icon: "assets/icongroup.png",
              title: S.of(context).address,
              onTap: () {},
            ),
            profileoptionlist(
              icon: "assets/icongroup.png",
              title: S.of(context).children,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const ChildrenPage();
                }));
              },
            ),
            profileoptionlist(
              icon: "assets/icongroup.png",
              title: S.of(context).cart,
              onTap: () {},
            ),
            profileoptionlist(
              icon: "assets/icongroup.png",
              title: S.of(context).changepassword,
              onTap: () {
                _changePasswordSheet(context);
              },
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
      style: const TextStyle(
          fontFamily: "Inter",
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Color(0xff130F44)),
    ),
    trailing: const Icon(Icons.arrow_forward_ios),
    onTap: onTap,
  );
}
