import 'package:flutter/material.dart';
import 'package:news_app/constants/constants.dart';

class TopTen extends StatelessWidget {
  const TopTen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    height: 350,
                    child: Image.asset('assets/zool festival.jpg',fit: BoxFit.cover,),
                  ),
                  AppSpacing.kheight15,
                  Container(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        style: TextStyle(
                          fontSize: 23,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        "Aishmuqam Ablaze: Zool Festival 2025 Unites Faith, Folklore, and Community",
                      ),
                    ),
                  ),
                  AppSpacing.kheight05,
                  Container(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                        "The 2025 Zool Festival illuminated Aishmuqam's shrine in Kashmir, honoring Sufi saint Hazrat Zain-ud-din Wali. Thousands of devotees carried flaming torches, symbolizing the triumph of good over evil and marking spring's arrival. The event blended spiritual devotion, folklore, and community unity in a centuries-old tradition.",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
