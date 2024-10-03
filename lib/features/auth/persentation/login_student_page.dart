import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:student_tawsel/features/auth/persentation/login_parent_page.dart';
import 'package:student_tawsel/features/add_child/presentation/add_child_page.dart';
import 'package:student_tawsel/features/presentantion/widgets/button_widget.dart';
import 'package:student_tawsel/features/presentantion/widgets/app_bar_back_ground_widget.dart';
import 'package:student_tawsel/features/presentantion/widgets/form_field_widget.dart';

class LoginStudentPage extends StatefulWidget {
  const LoginStudentPage({super.key});

  @override
  State<LoginStudentPage> createState() => _LoginStudentPageState();
}

class _LoginStudentPageState extends State<LoginStudentPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        backgroundColor: Colors.white,
        flexibleSpace: Stack(children: [
          Positioned(
            right: 100,
            left: 1,
            top: -30,
            child: Image.asset(
              "assets/pngtree-template-of-fluid-organic-shapes-picture-image_8114472 1.png",
            ),
          ),
          //  AppBarBackGroundWidget()
        ]),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Login",
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(
                  height: 77,
                ),
                FormFieldWidget(
                  controller: usernameController,
                  label: "Username",
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
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.red),
                ),
                ButtonWidget(
                  onPressed: () {
                    loginAsStudent(
                      usernameController.text,
                    
                      passwordController.text,
                    );
                  },
                  label: "LOGIN",
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return LoginParentPage();
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
                  height: 51,
                ),
                const Text(
                  "Management Education Serves\n   And Buses At Your Home",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> loginAsStudent(
      String username, String password) async {
    try {
      // Step 1: Authenticate using the parent's email and password
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: username,
        password: password,
      );

      // Step 2: Get parent data from Firestore
      DocumentSnapshot parentDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .get();

      if (parentDoc.exists) {
        Map<String, dynamic> parentData =
            parentDoc.data() as Map<String, dynamic>;

        // Step 3: Check if the username matches one of the parent's children
        List children = parentData['children'];
        var childData = children.firstWhere(
          (child) => child['username'] == username,
          orElse: () => null,
        );

        if (childData != null) {
          // Step 4: Child (student) found, redirect to student page
          print('Login successful! Child username: $username');

          // Navigate to the student-specific page
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => (childData: childData),
          //   ),
          // );
        } else {
          // Child username not found
          print('No child with username $username found for this parent.');
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Invalid username.'),
          ));
        }
      } else {
        print('No parent data found.');
      }
    } catch (e) {
      print('Failed to log in as student: $e');
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Login failed. Please check your credentials.'),
      ));
    }
  }
}
