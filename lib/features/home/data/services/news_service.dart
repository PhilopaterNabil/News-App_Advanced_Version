import 'package:dio/dio.dart';
import 'package:news_app_team/features/home/data/models/article_model.dart';

class NewsService {
  final Dio dio;

  NewsService(this.dio);

  Future<List<ArticleModel>> getTopHeadlines({required String category}) async {
    try {
      Response response = await dio.get(
          "https://newsapi.org/v2/top-headlines?country=us&apiKey=c7dde1d6e15a4d17a40e3e78286390ec&category=$category");

      Map<String, dynamic> jsonData = response.data;

      List<dynamic> articles = jsonData["articles"];

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
