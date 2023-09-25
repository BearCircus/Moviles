import 'dart:convert';
import 'package:flutter/material.dart';
import 'crypto_list.dart';
import 'data/constants.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<dynamic> criptos = [];

  @override
  void initState() {
    criptos = jsonDecode(CRYPTO_EXCHANGES);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Crypto App'),
        ),
        body: CryptoList(cryptoList: criptos),
      ),
    );
  }
}
