import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.text,
      this.width = 180,
      this.hexColor = "#267b7b",
      this.textColor = Colors.white,
      required this.callback})
      : super(key: key);

  final String text;
  final VoidCallback callback;
  final double width;
  final String hexColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        child: ElevatedButton(
            style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                backgroundColor: MaterialStateProperty.all(HexColor(hexColor)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)))),
            onPressed: callback,
            child: Text(
              text,
              style: TextStyle(color: textColor, fontSize: 16),
            )));
  }
}
