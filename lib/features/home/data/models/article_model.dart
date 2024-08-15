class ArticleModel {
  final String? image;
  final String title;
  final String? subTitle;

  ArticleModel(
      {required this.image, required this.title, required this.subTitle});

  factory ArticleModel.fromJson(json) {
    return ArticleModel(
      image: json['image_url'],
      title: json['title'],
      subTitle:json['description'],
    );
  }
}
