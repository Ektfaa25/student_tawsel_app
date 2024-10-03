import 'package:flutter/material.dart';
import 'package:student_tawsel/features/presentantion/widgets/button_widget.dart';

import 'package:student_tawsel/features/auth/persentation/login_student_page.dart';

import 'login_parent_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();

    // Delay of 2 seconds before showing the bottom sheet
    Future.delayed(const Duration(milliseconds: 1500), () {
      _showPersistentBottomSheet(context);
    });
  }

  void _showPersistentBottomSheet(BuildContext context) {
    showModalBottomSheet(
      constraints: const BoxConstraints(
        maxHeight: 424,
      ),
      barrierColor: Colors.transparent,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(45),
          topRight: Radius.circular(45),
        ),
      ),
      backgroundColor: const Color(0xffD9D9D9),
      context: context,
      builder: (context) => const LoginSheetContent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: const Color(0xff182243),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Top part with the image and splash background
          const SizedBox(height: 60),
          Center(
            child: Image.asset(
              'assets/loginlogo.png', // Replace with actual image path
              height: 322,
              width: 277,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}

class LoginSheetContent extends StatelessWidget {
  const LoginSheetContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 70),
        const Text(
          'School Services At Your Home',
          style: TextStyle(
            fontFamily: "Inter",
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 36),
        const Text(
          'Management Education Serves \n   And Buses At Your Home',
          style: TextStyle(
            fontSize: 18,
            fontFamily: "Inter",
            fontWeight: FontWeight.bold,
            color: Color(0xff2D2828),
          ),
        ),
        ButtonWidget(
            label: "LOGIN AS STUDENT",
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LoginStudentPage()));
            }),
        ButtonWidget(
          controller: TextEditingController(),
          label: "LOGIN AS PARENT",
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>  LoginParentPage()));
          },
        )
      ],
    );
  }
}
