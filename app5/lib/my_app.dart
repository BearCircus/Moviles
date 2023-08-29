import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key})
      : super(
            key:
                key); // Here's the correct way to declare a constructor with an optional key.

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLiked = false;
  int counter = 0;

  bool firstIcon = false;
  bool secondIcon = false;
  bool thirdIcon = false;

  void _showSnackBar(String message, BuildContext context) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 3),
    );
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App ITESO',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('App ITESO'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Builder(
            builder: (context) => Column(
              children: [
                Image.network(
                    "https://keystoneacademic-res.cloudinary.com/image/upload/element/12/121980_121891__MG_2277.jpg"),
                ListTile(
                    title: const Text("El ITESO"),
                    subtitle: const Text("blablablabla"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (isLiked) {
                                counter--;
                              } else {
                                counter++;
                              }
                              isLiked = !isLiked;
                            });
                          },
                          child: Icon(
                            Icons.thumb_up,
                            color: isLiked ? Colors.blue : Colors.black,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text('$counter'),
                      ],
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        IconButton(
                            iconSize: 48,
                            onPressed: () {
                              _showSnackBar(
                                  "Manda un mensaje a servicios.iteso@mx",
                                  context);
                              setState(() {
                                firstIcon = !firstIcon;
                              });
                            },
                            icon: Icon(
                              Icons.mail,
                              color: firstIcon ? Colors.indigo : Colors.black,
                            )),
                        const Text("Correo"),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                            iconSize: 48,
                            onPressed: () {
                              _showSnackBar("Llama al (33)-1978-2915", context);

                              setState(() {
                                secondIcon = !secondIcon;
                              });
                            },
                            icon: Icon(
                              Icons.phone,
                              color: secondIcon ? Colors.indigo : Colors.black,
                            )),
                        const Text("Llamada"),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                            iconSize: 48,
                            onPressed: () {
                              _showSnackBar(
                                  "Se encuentra ubicado en Periférico Sur 8585",
                                  context);
                              setState(() {
                                thirdIcon = !thirdIcon;
                              });
                            },
                            icon: Icon(Icons.directions,
                                color:
                                    thirdIcon ? Colors.indigo : Colors.black)),
                        const Text("Ruta"),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 36.4),
                const Text(
                    '''El ITESO, Universidad Jesuita de Guadalajara (Instituto Tecnológico y de Estudios Superiores de Occidente) es una universidad privada ubicada en la Zona Metropolitana de Guadalajara, Jalisco, México, fundada en el año 1957.'''),
                const SizedBox(height: 24),
                const Text(
                    '''   La institución forma parte del Sistema Universitario Jesuita (SUJ) que integra a ocho universidades en México. La universidad es nombrada como la Universidad Jesuita de Guadalajara.'''),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
