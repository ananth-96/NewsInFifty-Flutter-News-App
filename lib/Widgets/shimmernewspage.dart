import 'package:flutter/material.dart';
import 'package:news_app/constants/constants.dart';
import 'package:news_app/view/newsPage.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerApp extends StatelessWidget {
  const ShimmerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(17.0),
      child: Shimmer.fromColors(
baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
        child: Column(
          children: [
            SizedBox(
                          height: 270,
                          child: ListView.separated(
                            separatorBuilder:
                                (context, index) => SizedBox(width: 10),
                            itemBuilder: (context, index) {
          
                              return NewsContainers(
                              
          
                              );
                            },
                            itemCount: 10,
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
          ],
        ),
      ),
    );
  }
}
