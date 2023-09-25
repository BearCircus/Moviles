import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:meals/screens/meals_list.dart';
import '../data/data.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<dynamic> meals = [];

  @override
  void initState() {
    super.initState();
    meals = jsonDecode(MEALS);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.black, brightness: Brightness.dark)),
      home: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Quick and Easy',
            ),
            centerTitle: true,
          ),
          body: MealsList(mealsList: meals)),
    );
  }
}
