import 'package:flutter/material.dart';
import 'package:news_app_team/features/category/data/items/categories_item.dart';
import 'package:news_app_team/features/category/presentation/screens/widgets/category_card.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoriesItem.length,
        itemBuilder: (context, index) {
          return CategoryCard(
            category: categoriesItem[index],
          );
        },
      ),
    );
  }
}
