import 'package:flutter/material.dart';

class MealInfo extends StatefulWidget {
  const MealInfo({super.key, required this.meal});
  final Map<String, dynamic> meal;

  @override
  State<MealInfo> createState() => _MealInfoState();
}

class _MealInfoState extends State<MealInfo> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    List<String> ingredients = widget.meal['ingredients'].split('\\n');
    List<String> steps = widget.meal['steps'].split('\\n');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.meal['title']),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        actions: <Widget>[
          IconButton(
            icon: _isFavorite
                ? const Icon(Icons.star)
                : const Icon(Icons.star_border_outlined),
            onPressed: () {
              setState(() {
                _isFavorite = !_isFavorite;
              });

              final snackBar = SnackBar(
                content: Text(_isFavorite
                    ? 'Meal added to favorites'
                    : 'Meal removed from favorites'),
              );
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Hero(
              tag: 'meal-hero-${widget.meal['title']}',
              child: Image(
                image: AssetImage(widget.meal['image']),
                fit: BoxFit.cover,
                width: 400,
                height: 250,
              ),
            ),
            const SetTitle(mealTitle: 'Ingredients'),
            const SizedBox(height: 5),
            SetLists(list: ingredients),
            const SizedBox(height: 20),
            const SetTitle(mealTitle: 'Steps'),
            const SizedBox(height: 5),
            SetLists(list: steps)
          ],
        ),
      ),
    );
  }
}

class SetLists extends StatelessWidget {
  const SetLists({
    super.key,
    required this.list,
  });

  final List<String> list;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: list
          .map(
            (ingred) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text(
                ingred,
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          )
          .toList(),
    );
  }
}

class SetTitle extends StatelessWidget {
  const SetTitle({super.key, required this.mealTitle});
  final String mealTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        mealTitle,
        style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 245, 113, 106)),
      ),
    );
  }
}
