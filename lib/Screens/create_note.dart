import 'package:flutter/material.dart';
import 'package:note_app/Component/ReuseableBtn.dart';
import 'package:note_app/Component/textField.dart';
import 'package:note_app/Screens/homeScreen.dart';
import 'package:note_app/dbHelper.dart';
import 'package:note_app/models/note_model.dart';

class CreateNote extends StatefulWidget {
  CreateNote({Key? key}) : super(key: key);
  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  late DBHelper dbhelper;

  @override
  void initState() {
    super.initState();
    dbhelper = DBHelper();
  }

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final desController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Create Note'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  'Create Notes',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                ReUseAbleTextField(
                  titleName: 'Title',
                  fontSize: 18,
                  Control: titleController,
                ),
                const SizedBox(
                  height: 20,
                ),
                ReUseAbleTextField(
                  titleName: 'Description',
                  fontSize: 18,
                  MaxLines: 4,
                  Control: desController,
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                    onTap: () {
                      if (titleController.text.isNotEmpty &&
                          desController.text.isNotEmpty) {
                        dbhelper
                            .insert(NoteModel(
                          titleName: titleController.text,
                          body: desController.text,
                        ))
                            .then((value) {
                          print('data save');
                        }).catchError((error) {
                          print(error.toString());
                        });
                        setState(() {});
                      } else {
                        print('Data is not saved');
                      }
                    },
                    child: const ReUseAbleBtn(btnTitle: 'Save Note')),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()));
                    },
                    child: const ReUseAbleBtn(btnTitle: 'See Notes'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
