import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:student_tawsel/features/add_child/presentation/add_child_page.dart';
import 'package:student_tawsel/features/auth/data/user_model.dart';

import 'package:student_tawsel/features/presentantion/widgets/button_widget.dart';
import 'package:student_tawsel/features/auth/firebase_auth.dart';

import 'package:student_tawsel/features/auth/persentation/login_parent_page.dart';



import 'package:student_tawsel/features/presentantion/widgets/form_field_widget.dart';


class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    addressController.dispose();
    phoneController.dispose();

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
      body: Column(
        children: [
          const Text("Sign up",
              style: TextStyle(
                fontFamily: "Inter",
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
              signUpParent();
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const OTP()),
              // );
            },
            label: "SIGN UP",
          ),
        ],
      ),
    );
  }

  void signUpParent() async {
    String email = emailController.text;
    String password = passwordController.text;
    String username = usernameController.text;
    String address = addressController.text;
    String phone = phoneController.text;

    try {
      // Create the parent account in Firebase Authentication

      User? user = await _auth.signUpWithEmailAndPassword(
          context, email, password, username, address, phone);

      if (user != null) {
        // Save parent data in Firestore, including children information
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'uid': user.uid,
          'name': username,
          'email': email,
          'role': 'parent',
          'password':
              password, // You can store hashed passwords here or omit if not needed
          'children': [], // Empty for now, will be updated later
        });

        // Navigate to the parent login page
        goToParentLoginPage(user);
      }
    } catch (e) {
      print('Failed to register user: $e');
    }
  }

  void goToParentLoginPage(User user) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginParentPage(user: user)),
    );
  }
}
