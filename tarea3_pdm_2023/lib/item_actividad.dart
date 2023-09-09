import 'package:flutter/material.dart';

class ItemActividad extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  ItemActividad(
      {Key? key,
      required this.imagePath,
      required this.title,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(imagePath), fit: BoxFit.cover)),
          ),
          Text(title, style: TextStyle(fontSize: 11)),
          Text(description),
        ],
      ),
    );
  }
}
