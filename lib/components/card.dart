import 'package:flutter/material.dart';

class MyCard extends StatefulWidget {
  MyCard({
    super.key,
    required this.text,
    required this.taskCompleted,
    required this.onChanged,
    required this.delTask,
  });
  final String text;
  final bool taskCompleted;

  void Function()? delTask;
  Function(bool?)? onChanged;

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
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
              value: widget.taskCompleted,
              onChanged: widget.onChanged,
              checkColor: const Color.fromARGB(255, 255, 255, 255),
              activeColor: Colors.green,
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  widget.text,
                  style: TextStyle(
                      fontSize: 20,
                      color: const Color.fromARGB(255, 27, 36, 0),
                      decoration: widget.taskCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none),
                )),
            IconButton(
              onPressed: widget.delTask,
              icon: Icon(Icons.delete),
              color: const Color.fromARGB(255, 255, 104, 78),
            )
          ],
        ),
      ),
    );
  }
}
