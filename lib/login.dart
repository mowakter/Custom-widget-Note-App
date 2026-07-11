import 'package:flutter/material.dart';
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
          Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAlFlbIg6UsLYnlL2hZZGrcvmSCkWl9bwy9kHzpuVZxQ&s"),
          Text("LOGIN HERE",style:TextStyle(
           fontSize: 35,fontWeight: FontWeight.bold,
           color: Colors.pink,
          ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: email,
             decoration: InputDecoration(
               labelText: "Email",
               prefixIcon: Icon(Icons.email),
               border:OutlineInputBorder(
                 borderRadius: BorderRadius.circular(15),
               ),
             ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: password,
              decoration: InputDecoration(
                labelText: "Password",
                prefixIcon:Icon(Icons.lock),
                suffixIcon: Icon(Icons.remove_red_eye),
                border:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Forgot Password ?",style: TextStyle(color: Colors.blue),),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              if(email.text == "mow@gmail.com" && password.text == '290905'){
                Navigator.push(context, MaterialPageRoute(builder: (context) =>RegScreen()));
              }else{
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Wrong User or Password")));
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
                      child: Text("Login",style: TextStyle(fontSize: 25),),
                    ),
                  ],
                ),
              ),
          ),
        ],
      ),
    );
  }
}
