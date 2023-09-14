import 'package:flutter/material.dart';
import 'my_app.dart';

void main() => runApp(MaterialApp(
      title: 'Rutas',
      home: MyApp(
        tasks: List.generate(
            10, (index) => Lista('Elemento $index', 'Description $index')),
      ),
    ));
