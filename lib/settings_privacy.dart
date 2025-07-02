import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle headingStyle = const TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
    TextStyle bodyStyle = const TextStyle(fontSize: 14);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Privacy Policy",style: TextStyle(fontWeight: FontWeight.bold),),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
    );
  }
}
