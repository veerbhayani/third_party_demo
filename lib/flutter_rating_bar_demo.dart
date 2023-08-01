import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FlutterRatingBarDemo extends StatefulWidget {
  const FlutterRatingBarDemo({super.key});

  @override
  State<FlutterRatingBarDemo> createState() => _FlutterRatingBarDemoState();
}

class _FlutterRatingBarDemoState extends State<FlutterRatingBarDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RatingBar(
                minRating: 1,
                maxRating: 5,
                initialRating: 2.5,
                allowHalfRating: true,
                // itemCount: 8,
                itemSize: 45,
                itemPadding: const EdgeInsets.symmetric(
                  horizontal: 5,
                ),
                glow: false,
                glowColor: Colors.lightGreen,
                glowRadius: 15,
                ratingWidget: RatingWidget(
                  full: const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  half: const Icon(
                    Icons.star,
                    color: Colors.grey,
                  ),
                  empty: const Icon(
                    Icons.star,
                    color: Colors.grey,
                  ),
                ),
                onRatingUpdate: (value) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
