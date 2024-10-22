import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:newspaper/model/news_model.dart';

import 'package:newspaper/services/news_api.dart';

class PScreen extends StatefulWidget {
  const PScreen({super.key});

  @override
  State<PScreen> createState() => _PScreenState();
}

class _PScreenState extends State<PScreen> {
  var currentPosition = 0;
  List<NewsModel> news = [];

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  Future<void> fetchNews() async {
    var response;

    if (currentPosition == 0) {
      response = await NewsApi.fetchNews(
          "https://newsapi.org/v2/top-headlines?sources=al-jazeera-english&apiKey=c0cb83d6ac054269b5e2f4c397b898b9");
    }
    if (currentPosition == 1) {
      response = await NewsApi.fetchNews(
          "https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=c0cb83d6ac054269b5e2f4c397b898b9");
    } else {
      response = await NewsApi.fetchNews(
          "https://newsapi.org/v2/top-headlines?sources=al-jazeera-english&apiKey=c0cb83d6ac054269b5e2f4c397b898b9");
    }

    setState(() {
      news = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> items = [
      'Al Jazeera',
      'BBC',
      'CNN',
      'Google News',
      'CNBC',
      'New York Post',
      'NDTV News',
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Press Line',
          style: GoogleFonts.lora(),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 60,
            width: double.infinity,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            currentPosition = index;
                            fetchNews();
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.all(5),
                          width: 80,
                          height: 45,
                          decoration: BoxDecoration(
                              color: currentPosition == index
                                  ? Colors.white70
                                  : Colors.white12,
                              border: currentPosition == index
                                  ? Border.all(color: Colors.black, width: 2)
                                  : Border.all(color: Colors.white),
                              borderRadius: currentPosition == index
                                  ? BorderRadius.circular(15)
                                  : BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              items[index],
                              style: currentPosition == index
                                  ? GoogleFonts.merriweather(
                                      fontWeight: FontWeight.bold)
                                  : GoogleFonts.lato(),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                          visible: currentPosition == index ? true : false,
                          child: Container(
                            height: 5,
                            width: 5,
                            color: Colors.black,
                          ))
                    ],
                  );
                }),
          ),

          const SizedBox(
            height: 7,
          ),

          //main screen start from here

          Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: news.length,
                  itemBuilder: (context, index) {
                    final newsJ = news[index];

                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      margin: const EdgeInsets.only(right: 5),
                      child: Stack(
                        // alignment: AlignmentDirectional.bottomStart,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                                fit: BoxFit.cover,
                                height: 300,
                                width: 250,
                                newsJ.imageUrl),
                          ),
                          Positioned(
                            top: 150,
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              margin: const EdgeInsets.only(left: 2, right: 2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              width: 250,
                              child: Text(
                                maxLines: 2,
                                newsJ.title,
                                style: GoogleFonts.lato(),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  })),

          const SizedBox(
            height: 3,
          ),

          Expanded(
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: news.length,
                  itemBuilder: (context, index) {
                    final newInd = news.length / 2;
                    final newsP = news[index];
                    return Column(
                      children: [
                        // index == 0
                        //     ? Text('asdasdas')
                        //     : ListTile(
                        //         title: Text(newsP.title),
                        //       ),

                        index >= 3
                            ? ListTile(
                                title: Text(
                                  maxLines: 3,
                                  newsP.title,
                                  style: GoogleFonts.merriweather(),
                                ),
                                leading: Image.network(
                                    height: 80, width: 80, newsP.imageUrl),
                                subtitle: Text(
                                  newsP.author,
                                  style: GoogleFonts.lato(),
                                ),

                                // trailing: Text(newsP.publishedAt),
                              )
                            : SizedBox()
                      ],
                    );
                  })),
        ],
      ),
    );
  }
}
