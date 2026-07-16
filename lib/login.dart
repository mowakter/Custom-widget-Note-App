import 'package:flutter/material.dart';
import 'package:project_1/Custom%20widget/text%20widget.dart';
import 'package:project_1/home.dart';

import 'package:project_1/screen/forgot_password.dart';
import 'package:project_1/reg.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyTextWidget(title: "LOGIN HERE"),
          MyTextField(email: email, hint: "Email",),
          MyTextField(email:  password,hint: "Password",),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ForgotPasswordScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "Forgot Password ?",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              if (email.text == "mow@gmail.com" && password.text == '290905') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Wrong User or Password")),
                );
              }
            },
            child: Card(
              margin: EdgeInsets.all(8),
              color: Colors.lightBlueAccent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Login", style: TextStyle(fontSize: 25)),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 40,
            children: [
              Text("Not Register Yet?"),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>RegScreen()));
                },
                child: Text(
                  "Sign Up",
                  style: TextStyle(color: Colors.deepPurpleAccent),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
   MyTextField({
    super.key,
    required this.email,required this.hint,
  });

   TextEditingController email;
   String hint;

  TextEditingController? get controller => null;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          label: MyTextWidget(title: hint),
          prefixIcon: Icon(Icons.email),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
