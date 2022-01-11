import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key, required this.text, this.width = 180, required this.callback})
      : super(key: key);

  final String text;
  final VoidCallback callback;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        child: ElevatedButton(
            style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                backgroundColor: MaterialStateProperty.all(HexColor("#267b7b")),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)))),
            onPressed: callback,
            child: Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            )));
  }
}
