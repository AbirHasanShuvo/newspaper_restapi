import 'dart:async';
import 'dart:convert';

import 'package:newspaper/model/news_model.dart';
import 'package:http/http.dart' as http;

class NewsApi {
  static Future<List<NewsModel>> fetchNews(url) async {
    // const url =
    //     "https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=c0cb83d6ac054269b5e2f4c397b898b9";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['articles'] as List<dynamic>;

    final news = results.map((e) {
      return NewsModel.fromMap(e);
    }).toList();

    return news;
  }
}
