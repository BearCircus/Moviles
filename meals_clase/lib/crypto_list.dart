import 'package:flutter/material.dart';

class CryptoList extends StatelessWidget {
  const CryptoList({super.key, required this.cryptoList});

  final List cryptoList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network("${cryptoList[index]["image"]}"),
            title: Text("${cryptoList[index]["name"]}"),
            subtitle: Text(
                '''${cryptoList[index]["country"]}\n${cryptoList[index]["year_established"]}'''),
            trailing: CircleAvatar(
              backgroundColor: Colors.black,
              child: Text(
                "${cryptoList[index]["trust_score"]}",
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider();
        },
        itemCount: cryptoList.length);
  }
}
