class ArticleModel {
  final String articleId;
  final String title;
  final String link;
  final List<String>? keywords;
  final String? creator;
  final String? videoUrl;
  final String? description;
  final String content;
  final DateTime pubDate;
  final String? image;
  final String sourceId;
  final String sourceName;
  final String sourceUrl;
  final String? sourceIcon;
  final String language;
  final List<String> country;
  final List<String>? category;
  final String? aiTag;
  final String? sentiment;
  final String? sentimentStats;
  final String? aiRegion;
  final String? aiOrg;
  final bool duplicate;

  ArticleModel({
    required this.articleId,
    required this.title,
    required this.link,
    this.keywords,
    this.creator,
    this.videoUrl,
    this.description,
    required this.content,
    required this.pubDate,
    this.image,
    required this.sourceId,
    required this.sourceName,
    required this.sourceUrl,
    this.sourceIcon,
    required this.language,
    required this.country,
    this.category,
    this.aiTag,
    this.sentiment,
    this.sentimentStats,
    this.aiRegion,
    this.aiOrg,
    required this.duplicate,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      articleId: json['article_id'] as String,
      title: json['title'] as String,
      link: json['link'] as String,
      keywords: json['keywords'] != null ? List<String>.from(json['keywords']) : null,
      creator: json['creator'] as String?,
      videoUrl: json['video_url'] as String?,
      description: json['description'] as String?,
      content: json['content'] as String? ?? 'Content not available',
      pubDate: DateTime.parse(json['pubDate'] as String),
      image: json['image_url'] as String?,
      sourceId: json['source_id'] as String,
      sourceName: json['source_name'] as String,
      sourceUrl: json['source_url'] as String,
      sourceIcon: json['source_icon'] as String?,
      language: json['language'] as String,
      country: List<String>.from(json['country']),
      category: json['category'] != null ? List<String>.from(json['category']) : null,
      aiTag: json['ai_tag'] as String?,
      sentiment: json['sentiment'] as String?,
      sentimentStats: json['sentiment_stats'] as String?,
      aiRegion: json['ai_region'] as String?,
      aiOrg: json['ai_org'] as String?,
      duplicate: json['duplicate'] as bool,
    );
  }
}


/*class ArticleModel {
  final String? image;
  final String title;
  final String? description;
  final String content;
  final String date;
  final String source;

  ArticleModel({
    required this.image,
    required this.title,
    required this.description,
    required this.content,
    required this.date,
    required this.source,
  });

  factory ArticleModel.fromJson(json) {
    return ArticleModel(
      image: json['image_url'],
      title: json['title'],
      description: json['description'],
      content: json['content'],
      date: json['pubDate'],
      source: json['source_url'],
    );
  }
}*/
