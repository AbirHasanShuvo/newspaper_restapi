class NewsModel {
  final String author;
  final String title;
  final String imageUrl;
  final String content;
  final String description;
  final String publishedAt;

  NewsModel(
      {required this.author,
      required this.title,
      required this.imageUrl,
      required this.content,
      required this.description,
      required this.publishedAt});

  factory NewsModel.fromMap(Map<String, dynamic> e) {
    return NewsModel(
        author: e['author'],
        title: e['title'],
        imageUrl: e['urlToImage'],
        content: e['content'],
        description: e['description'],
        publishedAt: e['publishedAt']);
  }
}
