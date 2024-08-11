import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app_team/features/home/data/models/article_model.dart';
import 'package:news_app_team/features/home/data/services/news_service.dart';
import 'package:news_app_team/features/home/presentation/screens/widgets/error_message.dart';
import 'package:news_app_team/features/home/presentation/screens/widgets/news_list_view.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder(
      {super.key, required this.category, required this.imageEqualNull});

  final String category;
  final bool imageEqualNull;

  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  late Future<List<ArticleModel>> future;
  @override
  void initState() {
    super.initState();
    future = NewsService(Dio()).getTopHeadlines(
      category: widget.category,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return NewsListView(
            articles: snapshot.data!,
            imageEqualNull: widget.imageEqualNull,
          );
        } else if (snapshot.hasError) {
          return const SliverToBoxAdapter(
            child: ErrorMessage(),
          );
        } else {
          return widget.imageEqualNull == true
              ? const SliverToBoxAdapter()
              : const SliverToBoxAdapter(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
        }
      },
    );
  }
}
