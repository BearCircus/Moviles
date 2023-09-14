import 'package:flutter/material.dart';
import 'package:routes_test/my_app.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key, required this.lst});
  final Lista lst;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Ruta 2"),
        ),
        body: Padding(
          padding: EdgeInsets.all(18),
          child: Text(lst.content),
        ));
  }
}
