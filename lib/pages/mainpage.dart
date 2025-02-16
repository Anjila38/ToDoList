import 'package:flutter/material.dart';
import 'package:todolist/components/card.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  List taskList = [
    ['Travel Plans', false],
    ['Diet Plans', false],
  ];
  void checkListClicked(bool? value, int index) {
    setState(() {
      taskList[index][1] = !taskList[index][1];
    });
  }
  // final TextEditingController _taskController = TextEditingController();

  // void addTask() {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         title: const Text('Add New Task'),
  //         content: TextField(
  //           controller: _taskController,
  //           decoration: const InputDecoration(hintText: "Enter task name"),
  //         ),
  //         actions: [
  //           TextButton(
  //             onPressed: () => Navigator.pop(context), // Close without saving
  //             child: const Text('Cancel'),
  //           ),
  //           TextButton(
  //             onPressed: () {
  //               if (_taskController.text.isNotEmpty) {
  //                 setState(() {
  //                   taskList.add([_taskController.text, false]);
  //                   _taskController.clear();
  //                 });
  //                 Navigator.pop(context);
  //               }
  //             },
  //             child: const Text('Add', style: TextStyle(color: Colors.green)),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 210, 255, 211),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 210, 255, 211),
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tasks',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Create your own board ( ^.^ )',
                      style: TextStyle(color: Colors.black54),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.create),
                )
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: taskList.length,
                itemBuilder: (context, index) {
                  return MyCard(
                    text: taskList[index][0],
                    taskCompleted: taskList[index][1],
                    onChanged: (value) {
                      return checkListClicked(value, index);
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
