import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:student_tawsel/features/auth/domain/repository/firebase_auth.dart';
import 'package:student_tawsel/features/auth/persentation/login_student_page.dart';
import 'package:student_tawsel/features/auth/persentation/signup_page.dart';
import 'package:student_tawsel/features/add_child/presentation/add_child_page.dart';
import 'package:student_tawsel/features/presentantion/widgets/button_widget.dart';
import 'package:student_tawsel/features/presentantion/widgets/app_bar_back_ground_widget.dart';
import 'package:student_tawsel/features/presentantion/widgets/form_field_widget.dart';
import 'package:student_tawsel/features/presentantion/pages/home_page.dart';

class LoginParentPage extends StatefulWidget {
  const LoginParentPage({super.key});

  @override
  State<LoginParentPage> createState() => _LoginStudentPageState();
}

class _LoginStudentPageState extends State<LoginParentPage> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        backgroundColor: Colors.white,
        flexibleSpace: const AppBarBackGroundWidget(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text("Login",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(
              height: 77,
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
                  fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const SignupPage();
                }));
              },
              child: const Text(
                "Don't have an account?",
                style: TextStyle(fontSize: 18, color: Color(0xff101010)),
              ),
            ),
            ButtonWidget(
              onPressed: () {
                signIn();
               
              },
              label: "Login",
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const LoginStudentPage();
                  }));
                },
                child: const Text(
                  "Login As Student",
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff09206A)),
                )),
            const SizedBox(
              height: 51,
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

  void signIn() async {
    String email = emailController.text;
    String password = passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);
    print("user signed in successfully");

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomePage(
                  onLocaleChange: (p0) {},
                )));
  }
}
