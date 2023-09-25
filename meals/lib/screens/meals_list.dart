import 'package:flutter/material.dart';
import 'package:meals/screens/meal_info.dart';

class MealsList extends StatelessWidget {
  const MealsList({super.key, required this.mealsList});

  final List mealsList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          MealInfo(mealDescription: mealsList[index])));
            },
          );
        });
  }
}
