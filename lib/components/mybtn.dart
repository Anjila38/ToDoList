import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.text, required this.ontap});
  final String text;
  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                side: BorderSide(
                    color: const Color.fromARGB(255, 180, 255, 174),
                    width: 2))),
        onPressed: ontap,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            color: const Color.fromARGB(255, 42, 61, 57),
          ),
        ));
  }
}
