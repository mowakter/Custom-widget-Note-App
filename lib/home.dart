import 'package:flutter/material.dart';
import 'package:project_1/Custom%20widget/text_field.dart';
import 'Custom widget/text widget.dart';
import 'data/notes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController title = TextEditingController();
  TextEditingController details = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyTextWidget(title: "My NoteBook", tColor: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        itemCount: NotesData.note.length,
        itemBuilder: (context, i) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          child: ListTile(
            onTap: () {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) => AlertDialog(
                  title: MyTextWidget(
                    title: "${NotesData.note[i]["title"]}",tSize: 25,
                    tColor: Colors.black,
                  ),
                  content: MyTextWidget(
                    title: "${NotesData.note[i]["details"]}",
                    tSize: 15,
                  ),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Ok"),
                    ),
                  ],
                ),
              );
            },
            onLongPress: () {
              NotesData.note.removeAt(i);
              setState(() {});
            },
            leading: CircleAvatar(child: MyTextWidget(title: "${i + 1}")),
            tileColor: Colors.grey.shade300,
            title: MyTextWidget(
              title: "${NotesData.note[i]["title"]}",
              tColor: Colors.black,
            ),
            subtitle: MyTextWidget(
              title: "${NotesData.note[i]["details"]}",
              mLine: 50,
              tSize: 15,
            ),
            trailing: InkWell(
              onTap: () {
                 title.text = "${NotesData.note[i]["title"]}";
                 details.text = "${NotesData.note[i]["details"]}";
                 showDialog(
                     barrierDismissible: false,
                     context: context, builder: (context) => AlertDialog(
                   title: MyTextWidget(title: "Update"),
                   content: Column(
                     mainAxisSize: MainAxisSize.min,
                     children: [
                       MyTextField(email: title, hint: "Enter Your Title"),
                       MyTextField(email: details, hint: "Enter Your Notes Details"),
                     ],
                   ),
                   actions: [
                     ElevatedButton(onPressed: (){
                       Navigator.pop(context);
                     }, child: Text("Cancel")),
                     ElevatedButton(onPressed: (){setState(() {
                       NotesData.note[i]["title"] = title.text;
                       NotesData.note[i]["details"] = details.text;
                     });
                       Navigator.pop(context);
                     }, child: Text("Save"))
                   ],
                 ));
              },
              child: Icon(Icons.edit_note, color: Colors.black),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => AlertDialog(
              title: MyTextWidget(title: "Add Yours Note"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  MyTextField(email: title, hint: "Enter Title"),
                  MyTextField(email: details, hint: "Enter Note Details"),
                ],
              ),
              actions: [
                ElevatedButton(onPressed: (){
                  Navigator.pop(context);
                }, child: Text("Cancel")),
                ElevatedButton(
                  onPressed: () {
                    if (title.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Please give Data")),
                      );
                      return;
                    }
                    NotesData.note.add({
                      "title": title.text,
                      "details": details.text,
                    });
                    setState(() {});
                    title.clear();
                    details.clear();
                    Navigator.pop(context);
                  },
                  child: Text("Add"),
                ),
              ],
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
