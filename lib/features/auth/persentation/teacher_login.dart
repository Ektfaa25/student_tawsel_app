import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:student_tawsel/features/add_child/presentation/add_child_page.dart';
import 'package:student_tawsel/features/auth/firebase_auth.dart';
import 'package:student_tawsel/features/auth/persentation/login_student_page.dart';
import 'package:student_tawsel/features/auth/persentation/signup_page.dart';
import 'package:student_tawsel/features/presentantion/pages/home_page.dart';
import 'package:student_tawsel/features/presentantion/widgets/app_bar_back_ground_widget.dart';
import 'package:student_tawsel/features/presentantion/widgets/button_widget.dart';
import 'package:student_tawsel/features/presentantion/widgets/form_field_widget.dart';

class TeacherLogin extends StatefulWidget {
  final User? user;
  const TeacherLogin({
    super.key,
    this.user,
  });

  @override
  State<TeacherLogin> createState() => _TeacherLoginState();
}

class _TeacherLoginState extends State<TeacherLogin> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: const AppBarBackGroundWidget(isloginparent: true),
      ),
      body: Padding(
        padding: const EdgeInsets.all(17),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // const SizedBox(
            //   height: 20,
            // ),
            const Text("Login",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(
              height: 47,
            ),
            FormFieldWidget(
              controller: emailController,
              label: "Email",
            ),
            const SizedBox(
              height: 31,
            ),
            FormFieldWidget(
              controller: passwordController,
              label: "Password",
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Forgot your Password?",
              style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.red),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const SignupPage();
                }));
              },
              child: const Text(
                "don't have an account?",
                style: TextStyle(fontSize: 18, color: Color(0xff101010)),
              ),
            ),
            ButtonWidget(
              onPressed: () {
                signIn(emailController.text, passwordController.text);
              },
              label: "LOGIN",
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const TeacherLogin();
                  }));
                },
                child: RichText(
                  text: const TextSpan(
                      text: "Login as ",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff09206A)),
                      children: [
                        TextSpan(
                          text: "Parent?",
                          style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ]),
                )),

            const SizedBox(
              height: 31,
            ),
            const Text(
              "Management Education Serves\n   And Buses At Your Home",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  void signIn(String email, String password) async {
    // String email = emailController.text;
    // String password = passwordController.text;
    User? user = await _auth.signInParent(email, password);

    if (user != null) {
      print("user signed in successfully");
      // Redirect to parent dashboard
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return HomePage(
          onLocaleChange: (p0) {},
        );
      }));
    } else {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Login failed'),
      ));
    }
  }

  void gotohome() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return HomePage(onLocaleChange: (p0) {});
    }));
  }
}
