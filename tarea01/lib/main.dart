import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Colors.blueAccent.shade200),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Tarrea 1 Flutter McFlutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isFirstIconTapped = false;
  bool isSecondIconTapped = false;
  bool isThirdconTapped = false;
  bool isFourthIconTapped = false;

  void showSnackBar(String iconName) {
    final snackBar = SnackBar(
      content: Text(iconName),
      duration: const Duration(seconds: 1),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.grey,
                        child: Icon(
                          Icons.person,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 16.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Flutter McFlutter",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "La neta si se puso bien compleja",
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                          Text(
                            //si me pasaba de pixeles todo se ponia bien locochón
                            "esta tarea",
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("123 Main Street"), Text("33 1978 2915")],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              isFirstIconTapped = !isFirstIconTapped;
                            });
                            showSnackBar('contact');
                          },
                          child: Icon(Icons.person,
                              color: isFirstIconTapped
                                  ? Colors.indigo
                                  : Colors.black)),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              isSecondIconTapped = !isSecondIconTapped;
                            });
                            showSnackBar('clock');
                          },
                          child: Icon(Icons.timer,
                              color: isSecondIconTapped
                                  ? Colors.indigo
                                  : Colors.black)),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              isThirdconTapped = !isThirdconTapped;
                            });
                            showSnackBar('star');
                          },
                          child: Icon(Icons.star,
                              color: isThirdconTapped
                                  ? Colors.indigo
                                  : Colors.black)),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isFourthIconTapped = !isFourthIconTapped;
                          });
                          showSnackBar("phone");
                        },
                        child: Icon(Icons.phone_android,
                            color: isFourthIconTapped
                                ? Colors.indigo
                                : Colors.black),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          // The rest of your body content goes here
          Expanded(
            child: Container(), // Empty for now
          ),
        ],
      ),
    );
  }
}
