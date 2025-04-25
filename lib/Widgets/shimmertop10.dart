import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerApp10 extends StatelessWidget {
  const ShimmerApp10({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: 2, // Simulating 5 shimmer placeholders
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Image Placeholder
                Container(
                  height: 400,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(height: 15),

                // Title Placeholder
                Container(
                  height: 50,
                  width: double.infinity,
                  color: Colors.white,
                ),
                const SizedBox(height: 5),

                // Description Placeholder
                Container(
                  height: 220,
                  width: double.infinity,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
