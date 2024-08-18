import 'package:flutter/material.dart';
import 'package:news_app_team/features/home/data/models/article_model.dart';
import 'package:news_app_team/features/home/presentation/screens/widgets/news_tile.dart';
import 'package:news_app_team/models/theme_provider.dart';
import 'package:news_app_team/screens/news_details_screen.dart';
import 'package:provider/provider.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({
    super.key,
    required this.articles,
    required this.imageEqualNull,
  });

  final List<ArticleModel> articles;
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
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewsDetailsScreen(
                            articleModel: articles[index],
                            imageEqualNull: imageEqualNull,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: 300,
                      margin: const EdgeInsets.only(right: 12),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: context
                            .watch<ThemeProvider>()
                            .themedata
                            .colorScheme
                            .primary,
                      ),
                      child: NewsTile(
                        articleModel: articles[index],
                        imageEqualNull: imageEqualNull,
                      ),
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
                    : GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NewsDetailsScreen(
                                articleModel: articles[index],
                                imageEqualNull: imageEqualNull,
                              ),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 22),
                          child: NewsTile(
                            articleModel: articles[index],
                            imageEqualNull: imageEqualNull,
                          ),
                        ),
                      );
              },
            ),
          );
  }
}
