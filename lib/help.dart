import 'package:flutter/material.dart';
import 'dart:math';

import 'animated_backgroundpage.dart';

void main() {
  runApp(RentAndRestApp());
}

class RentAndRestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rent & Rest',
      debugShowCheckedModeBanner: false,
      home: HelpCenterPage(),
    );
  }
}

class HelpCenterPage extends StatelessWidget {
  final List<HelpSection> sections = [
    HelpSection(
      title: 'For Tenants',
      items: [
        FAQItem(
            question: 'How do I apply for a property?',
            answer: 'You can apply through the property page.'),
        FAQItem(
            question: 'What should I do if I have a maintenance issue?',
            answer: 'Report issues in the maintenance section of the app.'),
      ],
    ),
    HelpSection(
      title: 'For Landlords',
      items: [
        FAQItem(
            question: 'How do I list my property?',
            answer: 'Use the “List Property” button to get started.'),
        FAQItem(
            question: 'How do I handle tenant applications?',
            answer: 'You can manage them in the property dashboard.'),
      ],
    ),
    HelpSection(
      title: 'Privacy Policies',
      items: [
        FAQItem(
            question: 'What data do we collect?',
            answer: 'We collect only necessary rental and profile info.'),
        FAQItem(
            question: 'How is my data protected?',
            answer: 'All data is securely encrypted and stored.'),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help Center'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Stack(
        children: [
          AnimatedBackgroundpage(showPropertyCards: false), // Add the animated background
          ListView.builder(
            padding: EdgeInsets.all(16),
            itemCount: sections.length,
            itemBuilder: (context, index) {
              final section = sections[index];
              return Container(
                margin: EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8), // Background color with opacity
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.5),
                      Colors.white.withOpacity(0.2),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          section.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      ...section.items.map((item) => ExpansionTile(
                        title: Text(item.question),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(item.answer),
                          ),
                        ],
                      )),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class HelpSection {
  final String title;
  final List<FAQItem> items;

  HelpSection({required this.title, required this.items});
}

class FAQItem {
  final String question;
  final String answer;

  FAQItem({required this.question, required this.answer});
}

// Include the AnimatedBackgroundpage and related classes here
// (Bubble, FloatingParticle, JellyBubble, ParticleSystemPainter, etc.)