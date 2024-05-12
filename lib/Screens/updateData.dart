import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:note_app/Component/ReuseableBtn.dart';
import 'package:note_app/Component/textField.dart';
import 'package:note_app/dbHelper.dart';
import 'package:note_app/models/note_model.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  late DBHelper dbHelper;
  TextEditingController titleController = TextEditingController();
  TextEditingController desController = TextEditingController();
  @override
  initState() {
    dbHelper = DBHelper();
  }

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
                  height: MediaQuery.of(context).size.height * 0.1,
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
                    onTap: () {},
                    child: const ReUseAbleBtn(btnTitle: 'Update data'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
