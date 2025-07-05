import 'dart:ui';
import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle headingStyle = const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black);
    TextStyle bodyStyle = const TextStyle(fontSize: 14, color: Colors.black);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("Privacy Policy", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image or Color
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/back.jpg'), // Change this to your desired background
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Glassmorphism Container
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white.withOpacity(0.2)),
                    ),
                    child: ListView(
                      children: [
                        Text("1. Types of Data We Collect", style: headingStyle),
                        const SizedBox(height: 8),
                        Text(
                          "We collect personal information including your name, email address, contact number, and booking history. "
                              "We may also collect information related to your location, preferences, and listed properties if you are a property owner.",
                          style: bodyStyle,
                        ),
                        const SizedBox(height: 16),
                        Text("2. Use of Your Personal Data", style: headingStyle),
                        const SizedBox(height: 8),
                        Text(
                          "Your data is used to provide and improve our services, facilitate bookings, send notifications, verify identity, and personalize your experience on the app. "
                              "We also use this data to communicate important updates and promotions.",
                          style: bodyStyle,
                        ),
                        const SizedBox(height: 16),
                        Text("3. Disclosure of Your Personal Data", style: headingStyle),
                        const SizedBox(height: 8),
                        Text(
                          "We do not sell your personal data to third parties. However, your data may be shared with trusted service providers "
                              "for purposes such as payment processing, customer support, or property management. These parties are obligated to protect your information.",
                          style: bodyStyle,
                        ),
                        const SizedBox(height: 16),
                        Text("4. Data Security", style: headingStyle),
                        const SizedBox(height: 8),
                        Text(
                          "We implement secure protocols and encryption to safeguard your personal data. Despite our efforts, no method of transmission over the internet is 100% secure.",
                          style: bodyStyle,
                        ),
                        const SizedBox(height: 16),
                        Text("5. Your Rights", style: headingStyle),
                        const SizedBox(height: 8),
                        Text(
                          "You have the right to access, update, or delete your personal data. You can do this directly from the app or by contacting our support team.",
                          style: bodyStyle,
                        ),
                        const SizedBox(height: 16),
                        Text("6. Changes to This Policy", style: headingStyle),
                        const SizedBox(height: 8),
                        Text(
                          "We may update this Privacy Policy periodically. Any changes will be posted on this page and, if significant, will be notified to you through the app.",
                          style: bodyStyle,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
