class NewsModel {
  final String author;
  final String title;
  final String imageUrl;

  NewsModel(
      {required this.author, required this.title, required this.imageUrl});

  factory NewsModel.fromMap(Map<String, dynamic> e) {
    return NewsModel(
        author: e['author'], title: e['title'], imageUrl: e['urlToImage']);
  }
}
