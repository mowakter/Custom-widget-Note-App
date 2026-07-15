import 'package:flutter/material.dart';
import 'Custom widget/text widget.dart';
import 'data/notes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 2),
          child: ListTile(
            leading: CircleAvatar(child: MyTextWidget(title: "${i+1}"),),
            tileColor: Colors.grey.shade300,
            title: MyTextWidget(title: "${NotesData.note[i]["title"]}",tColor: Colors.black,),
            subtitle: MyTextWidget(title: "${NotesData.note[i]["details"]}",tSize: 15,),
            trailing: InkWell(
              onTap: (){
                NotesData.note.removeAt(i);
                setState(() {});
              },
              child: Icon(Icons.delete,color: Colors.red,),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(onPressed: () {
      NotesData.note.add({
         "title" : "School Home Work",
         "details" : "Every day schools home work notes"
       });
       setState(() {
       });

      },child: Icon(Icons.add),)
    );
  }
}
