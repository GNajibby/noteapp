import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:noteapp/style/app_style.dart';

class NoteEditorScreen extends StatefulWidget {
  const NoteEditorScreen({Key? key}) : super(key: key);

  @override
  State<NoteEditorScreen> createState() => _NoteEditorScreenState();
}

class _NoteEditorScreenState extends State<NoteEditorScreen> {
  int color_id = Random().nextInt(AppStyle.cardcolor.length);
  String date = DateTime.now().toString();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _mainController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.cardcolor[color_id],
      appBar: AppBar(
        backgroundColor: AppStyle.cardcolor[color_id],
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Add New Note",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Note Title',
              ),
              style: AppStyle.mainTitle,
            ),
            SizedBox(height: 8.0),
            Text(date, style: AppStyle.dateTitle),
            SizedBox(height: 28.0),
            TextField(
              controller: _mainController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Note Content',
              ),
              style: AppStyle.mainContent,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppStyle.accentColor,
        onPressed: () async {
          FirebaseFirestore.instance.collection("note").add({
            "note_title": _titleController.text,
            "creation_date": date,
            "note_content": _mainController.text,
            "color_id": color_id
          }).then((value) {
            print(value.id);
            Navigator.pop(context);
          }).catchError((error) => print("Failed to add note $error"));
        },
        child: Icon(Icons.save),
      ),
    );
  }
}
