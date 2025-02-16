import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  MyCard({
    super.key,
    required this.text,
    required this.taskCompleted,
    required this.onChanged,
  });
  final String text;
  final bool taskCompleted;
  Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Checkbox(
              value: taskCompleted,
              onChanged: onChanged,
              checkColor: const Color.fromARGB(255, 255, 255, 255),
              activeColor: Colors.green,
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  text,
                  style: TextStyle(
                      fontSize: 20,
                      color: const Color.fromARGB(255, 27, 36, 0),
                      decoration: taskCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none),
                )),
            IconButton(onPressed: () {}, icon: Icon(Icons.delete))
          ],
        ),
      ),
    );
  }
}
