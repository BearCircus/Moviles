import 'package:flutter/material.dart';
import 'package:meals/screens/meal_info.dart';

class MealsList extends StatelessWidget {
  const MealsList({super.key, required this.mealsList});

  final List mealsList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: mealsList.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return SizedBox(
            height: 250,
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            MealInfo(meal: mealsList[index]),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          const begin = Offset(1.0, 0);
                          const end = Offset.zero;
                          const curve = Curves.easeInOut;

                          var tween = Tween(begin: begin, end: end)
                              .chain(CurveTween(curve: curve));
                          var offsetAnimation = animation.drive(tween);

                          return SlideTransition(
                              position: offsetAnimation, child: child);
                        }));
              },
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                margin: const EdgeInsets.all(10.0),
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Image.asset(
                      mealsList[index]['image'],
                      fit: BoxFit.cover,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        width: double.infinity,
                        color: Colors.black54,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Center(
                              child: Text(
                                mealsList[index]['title'],
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Row(
                                  children: [
                                    const Icon(Icons.timer,
                                        color: Colors.white, size: 16),
                                    const SizedBox(width: 4),
                                    Text(mealsList[index]['time'],
                                        style: const TextStyle(
                                            color: Colors.white))
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.bar_chart,
                                        color: Colors.white, size: 16),
                                    const SizedBox(width: 4),
                                    Text(mealsList[index]['difficulty'],
                                        style: const TextStyle(
                                            color: Colors.white))
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.monetization_on,
                                        color: Colors.white, size: 16),
                                    const SizedBox(width: 4),
                                    Text(mealsList[index]['price'],
                                        style: const TextStyle(
                                            color: Colors.white))
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
