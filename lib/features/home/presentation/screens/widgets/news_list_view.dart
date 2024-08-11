import 'package:flutter/material.dart';
import 'package:news_app_team/features/home/data/models/article_model.dart';
import 'package:news_app_team/features/home/presentation/screens/widgets/news_tile.dart';

class NewsListView extends StatelessWidget {
  final List<ArticleModel> articles;

  const NewsListView(
      {super.key, required this.articles, required this.imageEqualNull});

  final bool imageEqualNull;

  @override
  Widget build(BuildContext context) {
    return imageEqualNull == true
        ? SliverToBoxAdapter(
            child: SizedBox(
              height: 90,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 300,
                    margin: const EdgeInsets.only(right: 22),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.black12,
                    ),
                    child: NewsTile(
                      articleModel: articles[index],
                      imageEqualNull: imageEqualNull,
                    ),
                  );
                },
              ),
            ),
          )
        : SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: articles.length,
              (context, index) {
                return articles[index].image == null
                    ? const SizedBox()
                    : Padding(
                        padding: const EdgeInsets.only(bottom: 22),
                        child: NewsTile(
                          articleModel: articles[index],
                          imageEqualNull: imageEqualNull,
                        ),
                      );
              },
            ),
          );
  }
}
