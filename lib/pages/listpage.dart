import 'package:flutter/material.dart';

/// A simple data model for each task.
class Task {
  String name;
  bool isDone;
  Task({required this.name, this.isDone = false});
}

class Listpage extends StatefulWidget {
  final String title;
  final List<Task> initialTasks;

  const Listpage({
    super.key,
    required this.title,
    required this.initialTasks,
  });

  @override
  State<Listpage> createState() => _ListpageState();
}

class _ListpageState extends State<Listpage> {
  late List<Task> tasks;
  final TextEditingController _taskController = TextEditingController();

  int get completedCount => tasks.where((task) => task.isDone).length;

  @override
  void initState() {
    super.initState();
    // Create a copy of the initial tasks to work on locally.
    tasks = List.from(widget.initialTasks);
  }

  // Toggle the 'done' state of a task.
  void _toggleTaskDone(int index) {
    setState(() {
      tasks[index].isDone = !tasks[index].isDone;
    });
  }

  // Delete a single task.
  void _deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  // Add a new task.
  void _addTask() {
    final taskName = _taskController.text.trim();
    if (taskName.isNotEmpty) {
      setState(() {
        tasks.add(Task(name: taskName));
      });
      _taskController.clear();
    }
  }

  // When the user navigates back, return the updated task list.
  Future<bool> _onWillPop() async {
    Navigator.pop(context, tasks);
    return false;
  }

  @override
  Widget build(BuildContext context) {
    String subtitle = '$completedCount of ${tasks.length} Tasks';

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          // You can add other AppBar actions here if needed.
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Display the task count.
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // List of tasks.
              Expanded(
                child: ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    final task = tasks[index];
                    return ListTile(
                      leading: Checkbox(
                        value: task.isDone,
                        onChanged: (_) => _toggleTaskDone(index),
                      ),
                      title: Text(
                        task.name,
                        style: TextStyle(
                          decoration: task.isDone
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => _deleteTask(index),
                      ),
                    );
                  },
                ),
              ),

              // Row to add a new task.
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _taskController,
                      decoration: const InputDecoration(
                        hintText: 'Add new task...',
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: _addTask,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
