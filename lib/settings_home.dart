import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:math';
import 'animated_backgroundpage.dart';
import 'settings_profile.dart';
import 'settings_notification.dart';
import 'settings_security.dart';
import 'settings_privacy.dart';
import 'settings_data_control.dart';

class SettingsHome extends StatefulWidget {
  const SettingsHome({super.key});

  @override
  State<SettingsHome> createState() => _SettingsHomeState();
}

class _SettingsHomeState extends State<SettingsHome> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<JellyBubble> jellyBubbles = [];
  final Random random = Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _createJellyBubble(Offset position) {
    setState(() {
      jellyBubbles.add(JellyBubble(
        position: position,
        radius: random.nextDouble() * 40 + 30,
        color: Color.fromARGB(
          180,
          random.nextInt(200) + 55,
          random.nextInt(200) + 55,
          random.nextInt(200) + 55,
        ),
        creationTime: DateTime.now().millisecondsSinceEpoch,
      ));
    });

    // Remove old bubbles after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          if (jellyBubbles.isNotEmpty) jellyBubbles.removeAt(0);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final settingOptions = [
      {
        "icon": Icons.person,
        "title": "Profile",
        "subtitle": "Update your profile details",
        "page": ProfileSettings(),
      },
      {
        "icon": Icons.notifications,
        "title": "Notifications",
        "subtitle": "Manage notification preferences",
        "page": NotificationSettings(),
      },
      {
        "icon": Icons.lock,
        "title": "Security",
        "subtitle": "Secure your account",
        "page": SecurityPage(),
      },
      {
        "icon": Icons.privacy_tip,
        "title": "Privacy Policy",
        "subtitle": "Control your privacy settings",
        "page": PrivacyPolicyPage(),
      },
      {
        "icon": Icons.storage,
        "title": "Data Control",
        "subtitle": "Download or delete your data",
        "page": DataControlsPage(),
      },
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: GestureDetector(
        onTapDown: (details) {
          _createJellyBubble(details.localPosition);
        },
        child: Stack(
          children: [
            // 🌄 Animated Background
            AnimatedBackgroundpage(showPropertyCards: false), // Use the animated background

            // 💠 Glassmorphism effect
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 12.0, sigmaY: 12.0),
              child: Container(
                color: Colors.white.withOpacity(0.2),
              ),
            ),

            // 🔘 Jelly Bubbles
            CustomPaint(
              painter: JellyBubblePainter(jellyBubbles: jellyBubbles, animationValue: _controller.value),
              child: Container(),
            ),

            // 🔘 Settings List on top of frosted layer
            ListView.builder(
              padding: const EdgeInsets.fromLTRB(16, 100, 16, 16),
              itemCount: settingOptions.length,
              itemBuilder: (context, index) {
                final option = settingOptions[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 13.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.white30),
                    ),
                    child: ListTile(
                      leading: Icon(option["icon"] as IconData, size: 32, color: Colors.black),
                      title: Text(
                        option["title"] as String,
                        style: const TextStyle(fontSize: 23, color: Colors.black),
                      ),
                      subtitle: Text(
                        option["subtitle"] as String,
                        style: const TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      trailing: const Icon(Icons.chevron_right, color: Colors.black),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => option["page"] as Widget),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class JellyBubble {
  final Offset position;
  final double radius;
  final Color color;
  final int creationTime;
  double squishFactor = 1.0;

  JellyBubble({
    required this.position,
    required this.radius,
    required this.color,
    required this.creationTime,
  });

  void update(double animationValue) {
    final timeSinceCreation = DateTime.now().millisecondsSinceEpoch - creationTime;
    final normalizedTime = timeSinceCreation / 1000;

    if (normalizedTime < 1) {
      final progress = normalizedTime / 1;
      squishFactor = 1.0 + 0.25 * sin(progress * pi * 4);
    } else {
      squishFactor = 1.0;
    }
  }

  void draw(Canvas canvas) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10);

    canvas.drawOval(
      Rect.fromCenter(
        center: position,
        width: radius * 2 * squishFactor,
        height: radius * 2 / squishFactor,
      ),
      paint,
    );
  }
}

class JellyBubblePainter extends CustomPainter {
  final List<JellyBubble> jellyBubbles;
  final double animationValue;

  JellyBubblePainter({
    required this.jellyBubbles,
    required this.animationValue,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (final bubble in jellyBubbles) {
      bubble.update(animationValue);
      bubble.draw(canvas);
    }
  }

  @override
  bool shouldRepaint(JellyBubblePainter oldDelegate) => true;
}