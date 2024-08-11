import 'package:flutter/material.dart';
import 'package:news_app_team/features/home/presentation/screens/widgets/news_list_view_builder.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key, required this.category});

  final String category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        forceMaterialTransparency: true,
        title: Text(
          category,
          style: const TextStyle(
            color: Colors.purpleAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          slivers: [
            NewsListViewBuilder(
              category: category,
              imageEqualNull: true,
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            NewsListViewBuilder(
              category: category,
              imageEqualNull: false,
            ),
          ],
        ),
      ),
    );
  }
}
