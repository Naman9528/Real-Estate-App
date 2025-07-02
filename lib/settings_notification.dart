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
      appBar: AppBar(
        title: const Text('Notifications',style: TextStyle(fontWeight: FontWeight.bold),),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
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
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }

  Widget _buildSwitchTile(String title, List<bool> list, int index) {
    return SwitchListTile(
      title: Text(title),
      value: list[index],
      onChanged: (val) {
        setState(() {
          list[index] = val;
        });
      },
      activeColor: Colors.blue,
      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
    );
  }
}
