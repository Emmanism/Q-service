import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProviderSkeleton extends StatelessWidget {
  const ProviderSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 250,
        padding: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipOval(
              child: Container(
                width: 50,
                height: 50,
                color: Colors.grey,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 100,
                    height: 10,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 5),
                  Container(
                    width: 60,
                    height: 10,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),
            Container(
              width: 90,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}