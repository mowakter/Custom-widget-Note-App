import 'package:flutter/material.dart';
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
          labelText: "Email",
          prefixIcon: Icon(Icons.email),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}