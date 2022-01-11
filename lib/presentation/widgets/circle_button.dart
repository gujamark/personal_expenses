import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({Key? key, required this.icon, required this.callback})
      : super(key: key);

  final IconData icon;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callback,
      child: Icon(
        icon,
        size: 35,
      ),
      style: ElevatedButton.styleFrom(
          primary: HexColor("#267b7b"),
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(20)),
    );
  }
}
