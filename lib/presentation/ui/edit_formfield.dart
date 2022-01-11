import 'package:flutter/material.dart';

class EditFormField extends StatelessWidget {
  const EditFormField(
      {Key? key,
      required this.controller,
      required this.hintText,
      required this.errorText})
      : super(key: key);

  final TextEditingController controller;
  final String errorText;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.center,
      controller: controller,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black)),
          hintText: hintText,
          hintStyle: const TextStyle(
              color: Colors.grey, fontSize: 15, fontWeight: FontWeight.bold)),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return errorText;
        }
      },
    );
  }
}
