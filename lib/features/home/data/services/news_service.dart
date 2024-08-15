import 'package:dio/dio.dart';
import 'package:news_app_team/features/home/data/models/article_model.dart';

class NewsService {
  final Dio dio;

  NewsService(this.dio);

  Future<List<ArticleModel>> getTopHeadlines({required String category}) async {
    try {
      Response response = await dio.get(
          "https://newsdata.io/api/1/latest?apikey=pub_48877d7f24eb03c0801a6f75f198c168effea&country=fr&category=$category");

      Map<String, dynamic> jsonData = response.data;

      List<dynamic> articles = jsonData["results"];

      List<ArticleModel> articlesList = [];

      for (var article in articles) {
        ArticleModel articleModel = ArticleModel.fromJson(article);
        articlesList.add(articleModel);
      }

      return articlesList;
    } catch (e) {
      return [];
    }
  }
}
