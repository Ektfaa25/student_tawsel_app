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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff182243),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Top part with the image and splash background
            const SizedBox(height: 50),
            Center(
              child: Image.asset(
                'assets/loginlogo.png', // Replace with actual image path
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
            ),

            // Use a Builder to ensure proper context under Scaffold
            Builder(
              builder: (BuildContext context) {
                return ElevatedButton(
                  onPressed: () {
                    _showPersistentBottomSheet(context);
                  },
                  child: const Text('Sign In'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showPersistentBottomSheet(BuildContext context) {
    showBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 424,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: Color(0xffD9D9D9),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'School Services At Your Home',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Management Education Serves\nAnd Buses At Your Home',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[700],
                ),
              ),
              const SizedBox(height: 20),
              ButtonWidget(
                  label: "LOGIN AS A STUDENT",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginStudentPage()));
                  }),
              ButtonWidget(
                controller: TextEditingController(),
                label: "LOGIN AS A PARENT",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginParentPage()));
                },
              )
            ],
          ),
        );
      },
    );
  }
}
