import 'dart:convert';

class ResourceModel {
  String articlesId;
  String articleThumbnailImg;
  String articleLink;
  String articlePlayImage;
  String articleDescription;
  ResourceModel({
    required this.articlesId,
    required this.articleThumbnailImg,
    required this.articleLink,
    required this.articlePlayImage,
    required this.articleDescription,
  });
  

  Map<String, dynamic> toMap() {
    return {
      'articles_id': articlesId,
      'article_thumbnail_img': articleThumbnailImg,
      'article_link': articleLink,
      'article_play_image': articlePlayImage,
      'article_description': articleDescription,
    };
  }

  factory ResourceModel.fromMap(Map<String, dynamic> map) {
    return ResourceModel(
      articlesId: map['articles_id'] ?? '',
      articleThumbnailImg: map['article_thumbnail_img'] ?? '',
      articleLink: map['article_link'] ?? '',
      articlePlayImage: map['article_play_image'] ?? '',
      articleDescription: map['article_description'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ResourceModel.fromJson(String source) => ResourceModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ArticleModel(articlesId: $articlesId, articleThumbnailImg: $articleThumbnailImg, articleLink: $articleLink, articlePlayImage: $articlePlayImage, articleDescription: $articleDescription)';
  }
}
