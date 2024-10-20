import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newspaper/const/const.dart';

class PScreen extends StatefulWidget {
  const PScreen({super.key});

  @override
  State<PScreen> createState() => _PScreenState();
}

class _PScreenState extends State<PScreen> {
  var currentPosition = 0;

  @override
  Widget build(BuildContext context) {
    List<String> items = [
      'Home',
      'Explore',
      'Search',
      'Feed',
      'Post',
      'Activity',
      'Settings',
      'Profile'
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
                            print(currentPosition);
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

          //main screen start from here

          Expanded(
              child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: currentPosition == 3
                ? const Column(
                    children: [
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                      Text('hello World'),
                    ],
                  )
                : const Text('No Hello World'),
          ))
        ],
      ),
    );
  }
}
