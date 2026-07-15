import 'package:flutter/material.dart';
import 'package:project_1/home.dart';
import 'package:project_1/login.dart';

class RegScreen extends StatefulWidget {
  const RegScreen({super.key});

  @override
  State<RegScreen> createState() => _RegScreenState();
}

class _RegScreenState extends State<RegScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "REGISTER HERE",
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.pink,
            ),
          ),
          Text("Create your  new account Registration now"),
          SizedBox(height: 20,),
          MyTextField(email: name, hint: "Enter your Name",),
          MyTextField(email: phone, hint: "Enter your Phone",),
          MyTextField(email: email, hint: "Enter your Email",),
          MyTextField(email: password, hint: "Enter your Password",),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>HomeScreen()));
            },
            child: Card(
              margin: EdgeInsets.all(8),
              color: Colors.lightBlueAccent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                        child: Text("Register", style: TextStyle(fontSize: 25))),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 40,
            children: [
              Text("Already registered"),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>LoginScreen()));
                },
                child: Text(
                  "Sign In",
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: email,
        decoration: InputDecoration(
          labelText: hint,
          prefixIcon: Icon(Icons.email),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}