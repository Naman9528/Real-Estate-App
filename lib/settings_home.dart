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
        "page": const ProfileSettings(),
      },
      {
        "icon": Icons.notifications,
        "title": "Notifications",
        "subtitle": "Manage notification preferences",
        "page": const NotificationSettings(),
      },
      {
        "icon": Icons.lock,
        "title": "Security",
        "subtitle": "Secure your account",
        "page": const SecurityPage(),
      },
      {
        "icon": Icons.privacy_tip,
        "title": "Privacy Policy",
        "subtitle": "Control your privacy settings",
        "page": const PrivacyPolicyPage(),
      },

      {
        "icon": Icons.storage,
        "title": "Data Control",
        "subtitle": "Download or delete your data",
        "page": DataControlsPage(),
      },
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        itemCount: settingOptions.length,
        itemBuilder: (context, index) {
          final option = settingOptions[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 13.0), // spacing between items
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              leading: Icon(option["icon"] as IconData, size: 32),
              title: Text(
                option["title"] as String,
                style: const TextStyle( fontSize: 23),
              ),
              subtitle: Text(option["subtitle"] as String,
                style: const TextStyle( fontSize: 15),
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => option["page"] as Widget),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
