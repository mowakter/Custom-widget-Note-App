import 'package:flutter/material.dart';
import 'package:project_1/Custom%20widget/text%20widget.dart';
import 'package:project_1/screen/students/student.dart';
import 'package:project_1/screen/students/students_details.dart';

class StudentsList extends StatefulWidget {
  const StudentsList({super.key});


  @override
  State<StudentsList> createState() => _StudentsListState();
}


class _StudentsListState extends State<StudentsList> {
  List stdList = Students.std;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student List"),
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount:Students.std.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          child:  ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) =>StudentsDetails(
                img: Students.std[index]["image"],
                name: Students.std[index]['name'],
                phone: Students.std[index]['phone'],
                email: Students.std[index]['email'],
                dep: Students.std[index]['dep'],
                status: Students.std[index]['status'],
              ) ));
            },
            tileColor: Colors.black12,
            leading: CircleAvatar(child: MyTextWidget(title: "${Students.std[index]["id"]}",tSize: 20,),),
            title: MyTextWidget(title:"${Students.std[index]["name"]}"),
            subtitle: MyTextWidget(title:"${Students.std[index]["email"]}"),
            trailing: IconButton(onPressed: () {}, icon: Icon(Icons.edit_note)),
          ),
        ),
      ),
    );
  }
}
