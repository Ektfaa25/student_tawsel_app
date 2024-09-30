import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:student_tawsel/features/presentantion/widgets/button_widget.dart';
import 'package:student_tawsel/features/auth/domain/repository/firebase_auth.dart';
import 'package:student_tawsel/features/auth/persentation/login_page.dart';
import 'package:student_tawsel/features/auth/persentation/login_parent_page.dart';
import 'package:student_tawsel/features/auth/persentation/o_t_p.dart';

import 'package:student_tawsel/features/presentantion/widgets/button_widget.dart';
import 'package:student_tawsel/features/presentantion/widgets/form_field_widget.dart';
import 'package:student_tawsel/features/presentantion/pages/home_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        backgroundColor: Colors.white,
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginParentPage()),
          );
        },
        child: Column(
          children: [
            const Text("Sign up",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                )),
            Padding(
              padding: const EdgeInsets.all(23),
              child: Column(
                children: [
                  FormFieldWidget(
                    controller: usernameController,
                    label: "Name",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FormFieldWidget(
                    controller: emailController,
                    label: "Email",
                    // value: "mohamed@gmail.com",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FormFieldWidget(
                    controller: passwordController,
                    label: "Password",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FormFieldWidget(
                    controller: TextEditingController(),
                    label: "Address",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FormFieldWidget(
                    controller: TextEditingController(),
                    label: "Phone",
                  ),
                ],
              ),
            ),
            ButtonWidget(
              onPressed: () {
                signUp();
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const OTP()),
                // );
              },
              label: "SIGN UP",
            ),
          ],
        ),
      ),
    );
  }

  void signUp() async {
    String email = emailController.text;
    String password = passwordController.text;
    String username = usernameController.text;

    User? user = await _auth.signUpWithEmailAndPassword(
        context, email, password, username);

    if (user != null) {
      // print("user signed up successfully");

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HomePage(
                    onLocaleChange: (p0) {},
                  )));
    } else {
      // print("error occurred");
    }
  }
}
