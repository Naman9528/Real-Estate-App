import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:math';

// Import your AnimatedBackgroundpage from your app
import '../animated_backgroundpage.dart'; // Ensure this path is correct

class GlassContainer extends StatelessWidget {
  final Widget child;
  final double? height;

  const GlassContainer({
    super.key,
    required this.child,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          height: height,
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.15),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withOpacity(0.2)),
          ),
          child: child,
        ),
      ),
    );
  }
}

class ReviewsPage extends StatelessWidget {
  const ReviewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> reviews = [
      {
        'rating': 5,
        'review': 'Fantastic app! Super easy to use and beautiful design.',
        'date': '2025-07-10'
      },
      {
        'rating': 4,
        'review': 'Very helpful features. Just wish it was a bit faster.',
        'date': '2025-06-28'
      },
      {
        'rating': 3,
        'review': 'Good, but needs more customization options.',
        'date': '2025-05-15'
      },
      {
        'rating': 5,
        'review': 'Absolutely love this app! Great job to the developers.',
        'date': '2025-04-02'
      },
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text(
          'My Reviews',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Stack(
        children: [
          // Animated background
          const AnimatedBackgroundpage(showPropertyCards: false), // Add the animated background here
          // Glass content
          SafeArea(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: reviews.length,
              itemBuilder: (context, index) {
                final review = reviews[index];

                return GlassContainer(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Date
                        Text(
                          review['date'],
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(height: 8),
                        // Star rating
                        Row(
                          children: List.generate(
                            5,
                                (i) => Icon(
                              i < review['rating']
                                  ? Icons.star
                                  : Icons.star_border,
                              color: Colors.amber,
                              size: 20,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        // Review text
                        Text(
                          review['review'],
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}