import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:math';

// Import your AnimatedBackgroundpage
import '../animated_backgroundpage.dart'; // Ensure this path is correct

class SubscriptionPage extends StatelessWidget {
  const SubscriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Subscriptions',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Animated background
          const AnimatedBackgroundpage(showPropertyCards: false), // Add the animated background here

          // Glassmorphism content
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  SubscriptionCard(
                    planName: 'Free Plan',
                    price: '₹0 / month',
                    benefits: [
                      'View limited listings',
                      'Basic support',
                      'Ads displayed',
                    ],
                    backgroundColor: Colors.white.withOpacity(0.3),
                    textColor: Colors.black,
                  ),
                  const SizedBox(height: 20),
                  SubscriptionCard(
                    planName: 'Silver Plan',
                    price: '₹199 / month',
                    benefits: [
                      'Up to 50 listings',
                      'Standard support',
                      'Ad-free experience',
                    ],
                    backgroundColor: Colors.grey.withOpacity(0.4),
                    textColor: Colors.black,
                  ),
                  const SizedBox(height: 20),
                  SubscriptionCard(
                    planName: 'Gold Plan',
                    price: '₹499 / month',
                    benefits: [
                      'Unlimited listings',
                      'Featured profile',
                      'Priority support',
                      'Ad-free experience',
                    ],
                    backgroundColor: Colors.amberAccent.withOpacity(0.3),
                    textColor: Colors.black,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SubscriptionCard extends StatelessWidget {
  final String planName;
  final String price;
  final List<String> benefits;
  final Color? backgroundColor;
  final Color? textColor;

  const SubscriptionCard({
    super.key,
    required this.planName,
    required this.price,
    required this.benefits,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: backgroundColor ?? Colors.white.withOpacity(0.15),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.white.withOpacity(0.2),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                planName,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: textColor ?? Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                price,
                style: TextStyle(
                  fontSize: 18,
                  color: textColor ?? Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              ...benefits.map(
                    (benefit) => Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.check,
                      color: textColor ?? Colors.white,
                      size: 18,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        benefit,
                        style: TextStyle(
                          color: textColor ?? Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle subscription logic here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    child: Text(
                      'Subscribe',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}