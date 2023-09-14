import 'package:flutter/material.dart';
import 'package:routes_test/second_screen.dart';

class Lista {
  final String title;
  final String content;

  Lista(this.title, this.content);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.tasks});

  final List<Lista> tasks;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ruta 1"),
      ),
      body: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(tasks[index].title),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => SecondScreen(
                              lst: tasks[index],
                            ))));
              },
            );
          }),
      // body: Center(
      //   child: ElevatedButton(
      //     onPressed: () {
      //       Navigator.push(context,
      //           MaterialPageRoute(builder: (context) => const SecondScreen()));
      //     },
      //     child: const Text("Press me!"),
      //   ),
      // ),
    );
  }
}

