import 'package:flutter/material.dart';

class Dialogbox extends StatelessWidget {
  final controller;
  Dialogbox({super.key, required this.controller, required this.cancelBtn, required this.onSave});

  final Function()? cancelBtn;
  VoidCallback onSave;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 150,
        child: Column(
          children: [
            Text(
              'Add a new task',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: controller,
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                    onPressed: cancelBtn,
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                          color: (const Color.fromARGB(255, 101, 101, 101))),
                    )),
                IconButton(
                  onPressed: onSave,
                  icon: Icon(Icons.check),
                  color: Colors.green,
                  iconSize: 30,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
