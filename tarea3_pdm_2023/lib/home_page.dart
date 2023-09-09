import 'package:flutter/material.dart';
import 'package:info_lugar/info_lugar.dart';
import 'package:info_lugar/item_actividad.dart';

class HomePage extends StatelessWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  static const List<String> imagePaths = [
    'assets/pic1.jpg',
    'assets/pic2.jpg',
    'assets/pic3.jpg',
  ];
  static const List<String> imageTitles = [
    'Día 1',
    'Día 2',
    'Día 3',
  ];
  static const List<String> imageDescription = [
    'Que rico',
    'Que sabroso',
    'Que comodin',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            fit: StackFit.expand,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset('assets/banner_image.jpg',
                        fit: BoxFit.fill)),
              ),
              Positioned(
                top: 64,
                bottom: 0,
                left: 0,
                right: 0,
                child: ListView(
                  children: [
                    InfoLugar(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("Details"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.grey[200],
                          ),
                        ),
                        Text("Walkthrough Flight Detail"),
                      ],
                    ),
                    Container(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: imagePaths.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ItemActividad(
                            imagePath: imagePaths[index],
                            title: imageTitles[index],
                            description: imageDescription[index],
                          );
                        },
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        final snackBar = SnackBar(
                          content: Text("Reservation in progress"),
                          duration: Duration(seconds: 3),
                        );
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        
                      },
                      child: Text("Start booking"),
                      color: Colors.grey[200],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
