import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ReUseAbleTextField extends StatelessWidget {
  final String titleName;
  final TextEditingController Control;
  final double fontSize;
  final int MaxLines;

  const ReUseAbleTextField(
      {required this.titleName,
      required this.Control,
      this.fontSize = 10,
      this.MaxLines = 1,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: MaxLines,
      enableSuggestions: true,
      controller: Control,
      style: TextStyle(
        fontSize: fontSize,
      ),
      decoration: InputDecoration(
        alignLabelWithHint: true,
        contentPadding: const EdgeInsets.only(left: 15, top: 15),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white, width: 9)),
        labelText: titleName,
      ),
    );
  }
}
