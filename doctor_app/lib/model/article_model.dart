

class ArticleModel {
    ArticleModel({
        required this.docArticlesId,
        required this.docId,
        required this.docName,
        required this.docImage,
        required this.description,
    });

    String docArticlesId;
    String docId;
    String docName;
    String docImage;
    String description;

    factory ArticleModel.fromMap(Map<String, dynamic> json) => ArticleModel(
        docArticlesId: json["doc_articles_id"],
        docId: json["doc_id"],
        docName: json["doc_name"],
        docImage: json["doc_image"],
        description: json["description"],
    );

    Map<String, dynamic> toMap() => {
        "doc_articles_id": docArticlesId,
        "doc_id": docId,
        "doc_name": docName,
        "doc_image": docImage,
        "description": description,
    };

  @override
  String toString() {
    return 'ArticleModel(docArticlesId: $docArticlesId, docId: $docId, docName: $docName, docImage: $docImage, description: $description)';
  }
}
