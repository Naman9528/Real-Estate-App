import 'dart:ui';
import 'package:flutter/material.dart';
import 'settings_profile.dart';
import 'settings_notification.dart';
import 'settings_security.dart';
import 'settings_privacy.dart';
import 'settings_data_control.dart';

class SettingsHome extends StatelessWidget {
  const SettingsHome({super.key});

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
      body: Stack(
        children: [
          // 🌄 Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/back.jpg'), // replace with your path
                fit: BoxFit.cover,
              ),
            ),
          ),

          // 💠 Glassmorphism effect
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 12.0, sigmaY: 12.0),
            child: Container(
              color: Colors.white.withOpacity(0.2),
            ),
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
    );
  }
}
