import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final routeAgrs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeAgrs['id'];
    final categoryTitle = routeAgrs['title'];

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: Text('Receipes of the category'),
      ),
    );
  }
}
