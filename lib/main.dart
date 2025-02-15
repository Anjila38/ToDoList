import 'package:flutter/material.dart';
import 'package:todolist/pages/homepage.dart';

void main() {
  runApp(const ToDo());
}

class ToDo extends StatelessWidget {
  const ToDo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      // initialRoute: '/',
      // routes: {
      //   '/':(context)=> HomePage(),

      // },
    );
  }
}
