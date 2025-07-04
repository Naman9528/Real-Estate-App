import 'dart:ui';
import 'package:flutter/material.dart';

class DataControlsPage extends StatefulWidget {
  @override
  _DataControlsPageState createState() => _DataControlsPageState();
}

class _DataControlsPageState extends State<DataControlsPage> {
  bool allowAnalytics = true;
  bool personalizedContent = true;

  void _requestDownload() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Download request submitted.')),
    );
  }

  void _deleteData() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Confirm Delete'),
        content: Text('This action is irreversible. Your account will be permanently deleted.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Your data has been deleted.')),
              );
            },
            child: Text('Delete'),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Data Controls', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          // Background Image (optional)
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/back.jpg'), // optional background
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Glassmorphism effect
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: Container(
              color: Colors.white.withOpacity(0.1),
              padding: const EdgeInsets.all(20),
              child: ListView(
                children: [
                  _buildSectionTitle('Download Your Data'),
                  Text('Download a copy of your data from the app.'),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _requestDownload,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: Text('Request Download'),
                  ),
                  const SizedBox(height: 10),
                  Text('We will email you when your download is ready.'),
                  const SizedBox(height: 30),

                  _buildSectionTitle('Delete Your Data'),
                  Text('Permanently remove your data from our servers.'),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _deleteData,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: Text('Delete My Data'),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'This action is irreversible. Your account will be permanently deleted.',
                    style: TextStyle(color: Colors.red),
                  ),
                  const SizedBox(height: 30),

                  _buildSectionTitle('Manage Data Settings'),
                  Text('Customize how your data is stored and used.'),
                  const SizedBox(height: 20),

                  _buildSwitchTile(
                    title: 'Allow data for analytics',
                    subtitle: 'Help us improve by sharing anonymized usage data',
                    value: allowAnalytics,
                    onChanged: (val) => setState(() => allowAnalytics = val),
                  ),
                  _buildSwitchTile(
                    title: 'Personalized content',
                    subtitle: 'Enable personalized recommendations based on your activity',
                    value: personalizedContent,
                    onChanged: (val) => setState(() => personalizedContent = val),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildSwitchTile({
    required String title,
    required String subtitle,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return SwitchListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onChanged,
      activeColor: Colors.blue,
    );
  }
}
