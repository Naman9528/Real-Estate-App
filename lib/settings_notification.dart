import 'dart:ui';
import 'package:flutter/material.dart';

class NotificationSettings extends StatefulWidget {
  const NotificationSettings({super.key});

  @override
  State<NotificationSettings> createState() => _NotificationSettingsState();
}

class _NotificationSettingsState extends State<NotificationSettings> {
  // Toggle state variables
  List<bool> common = [true, false];
  List<bool> booking = [true, true, false];
  List<bool> system = [false, true];
  List<bool> others = [false, true];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Notifications',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          // Background image (optional)
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/back.jpg'), // Your image path
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Glassmorphic effect
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 12.0, sigmaY: 12.0),
            child: Container(
              color: Colors.black.withOpacity(0.2),
            ),
          ),

          // Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white.withOpacity(0.3)),
                  ),
                  child: ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      _buildSectionTitle("Common"),
                      _buildSwitchTile("App Updates", common, 0),
                      _buildSwitchTile("Exclusive Offers & Promotions", common, 1),
                      const Divider(height: 32),

                      _buildSectionTitle("Booking Notifications"),
                      _buildSwitchTile("Booking Confirmations", booking, 0),
                      _buildSwitchTile("Check-in Reminders", booking, 1),
                      _buildSwitchTile("Cancellation Updates", booking, 2),
                      const Divider(height: 32),

                      _buildSectionTitle("System & Services"),
                      _buildSwitchTile("Maintenance Alerts", system, 0),
                      _buildSwitchTile("Payment Status Updates", system, 1),
                      const Divider(height: 32),

                      _buildSectionTitle("Others"),
                      _buildSwitchTile("Community Announcements", others, 0),
                      _buildSwitchTile("Third-party Offers", others, 1),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
      ),
    );
  }

  Widget _buildSwitchTile(String title, List<bool> list, int index) {
    return SwitchListTile(
      title: Text(title, style: const TextStyle(color: Colors.white)),
      value: list[index],
      onChanged: (val) {
        setState(() {
          list[index] = val;
        });
      },
      activeColor: Colors.lightBlueAccent,
      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
    );
  }
}
