import 'package:flutter/material.dart';
import 'package:newspaper/model/news_model.dart';
import 'package:newspaper/services/news_api.dart';

class NewsScreen extends StatefulWidget {
  NewsScreen({super.key, required this.indexNumber});
  var indexNumber;

  @override
  State<NewsScreen> createState() => _NewsScreenState(index: indexNumber);
}

class _NewsScreenState extends State<NewsScreen> {
  _NewsScreenState({required this.index});
  final index;
  List<NewsModel> news = [];

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  Future<void> fetchNews() async {
    var response;
    if (index == 0) {
      response = await NewsApi.fetchNews(
          "https://newsapi.org/v2/top-headlines?sources=al-jazeera-english&apiKey=c0cb83d6ac054269b5e2f4c397b898b9");
    }
    if (index == 1) {}

    setState(() {
      news = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: news.length,
            itemBuilder: (context, index) {
              final newsP = news[index];
              return ListTile(
                title: Text(newsP.title),
              );
            }));
  }
}
