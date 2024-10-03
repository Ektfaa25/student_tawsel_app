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
                      "moahmed@gmail.com",
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
    String childUsername,
    String parentEmail,
    String parentPassword,
  ) async {
    try {
      // Authenticate using the parent's email and password
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: parentEmail,
        password: parentPassword,
      );

      // Fetch the parent's document from Firestore
      DocumentSnapshot parentDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .get();

      // Check if the childUsername matches one of the parent's children
      List children = parentDoc['children'];
      var childData = children.firstWhere(
        (child) => child['username'] == childUsername,
        orElse: () => null,
      );

      if (childData != null) {
        // If the child is found, navigate to the student dashboard
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StudentHomePage(childData: childData),
          ),
        );
      } else {
        print('No child with username $childUsername found.');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Invalid child username.'),
        ));
      }
    } catch (e) {
      print('Login failed: $e');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Login failed. Please check your credentials.'),
      ));
    }
  }
}

class StudentHomePage extends StatelessWidget {
  final Map<String, dynamic> childData;
  const StudentHomePage({super.key, required this.childData});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${childData['username']}'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Name: ${childData['username']}'),
          Text('Grade: ${childData['grade']}'),
          Text('Subjects: ${childData['subjects'] ?? 'No subjects found'}'),
        ],
      ),
    );
  }
}
