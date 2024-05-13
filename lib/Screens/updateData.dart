import 'package:flutter/material.dart';
import 'package:note_app/Component/ReuseableBtn.dart';
import 'package:note_app/Component/textField.dart';
import 'package:note_app/dbHelper.dart';
import 'package:note_app/models/note_model.dart';

class UpdateScreen extends StatefulWidget {
  final NoteModel noteModel;
  final Function() onUpdate;

  const UpdateScreen(
      {Key? key, required this.noteModel, required this.onUpdate})
      : super(key: key);

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  late DBHelper dbHelper;
  TextEditingController titleController = TextEditingController();
  TextEditingController desController = TextEditingController();

  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
    // Initialize controllers with the values of the note model
    titleController.text = widget.noteModel.titleName;
    desController.text = widget.noteModel.body;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.02),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                const Text(
                  'Update Data ',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
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
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.04,
                ),
                GestureDetector(
                  onTap: () {
                    dbHelper
                        .update(NoteModel(
                      id: widget.noteModel.id,
                      titleName: titleController.text,
                      body: desController.text,
                    ))
                        .then((_) {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const AlertDialog(
                              title: Text('Congraculation '),
                              content: Text(
                                  'data Successfully update in the dataBase'),
                              actions: [BackButton()],
                            );
                          });

                      widget.onUpdate();

                      Navigator.pop(context);
                    });
                  },
                  child: const ReUseAbleBtn(btnTitle: 'Update data'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
