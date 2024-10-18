import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newspaper/model/news_model.dart';
import 'package:newspaper/model/user.dart';
import 'package:newspaper/services/news_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<NewsModel> news = [];
  List<User> user = [];
  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Press Line',
          style: GoogleFonts.lora(),
        ),
      ),
      body: ListView.builder(
          itemCount: news.length,
          itemBuilder: (context, index) {
            final newsP = news[index];
            return ListTile(
              title: Text(newsP.title),
              leading: Image.network(newsP.imageUrl),
            );
          }),
    );
  }

  Future<void> fetchNews() async {
    final response = await NewsApi.fetchNews();
    setState(() {
      news = response;
    });
  }
}
