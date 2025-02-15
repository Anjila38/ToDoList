import 'package:flutter/material.dart';
import 'package:todolist/components/mybtn.dart';
import 'package:todolist/pages/mainpage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 125, 236, 255),
                const Color.fromARGB(255, 93, 255, 190),
                const Color.fromARGB(255, 144, 255, 164),
                const Color.fromARGB(255, 93, 255, 190),
                const Color.fromARGB(255, 125, 236, 255),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        Center(child: Image.asset('lib/assets/todo.png')),
        Container(
            alignment:
                Alignment.lerp(Alignment.bottomCenter, Alignment.center, 0.4),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(
                  colors: [
                    const Color.fromARGB(255, 125, 236, 255),
                    const Color.fromARGB(255, 93, 255, 190),
                    const Color.fromARGB(255, 144, 255, 164),
                    const Color.fromARGB(255, 93, 255, 190),
                    const Color.fromARGB(255, 125, 236, 255),
                  ],
                ),
              ),
              child: MyButton(
                text: 'Get Started',
                ontap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Mainpage();
                    },
                  ));
                },
              ),
            )),
      ]),
    );
  }
}
