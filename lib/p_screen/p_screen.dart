import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

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
      body: Container(
        margin: const EdgeInsets.all(5),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 60,
              width: double.infinity,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          currentPosition = index;
                          print(currentPosition);
                          print('index ' + index.toString());
                          if (currentPosition == index) {
                            print('true');
                          }
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
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
