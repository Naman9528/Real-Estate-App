import 'package:flutter/material.dart';
import '../animated_backgroundpage.dart';
import 'activity_model.dart';
 // Import the file where AnimatedBackgroundpage is defined

class ActivityPage extends StatelessWidget {
  final List<Activity> activities;

  const ActivityPage({Key? key, required this.activities}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Activity', style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Stack(
        children: [
          // Use the AnimatedBackgroundpage as the background
          AnimatedBackgroundpage(showPropertyCards: false),
          // Overlay the activity list on top
          Container(
            child: ListView.builder(
              itemCount: activities.length,
              itemBuilder: (context, index) {
                final activity = activities[index];
                return ListTile(
                  leading: Image.asset(
                    activity.imagePath,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(activity.description, style: TextStyle(color: Colors.black)), // Change text color for visibility
                  subtitle: Text(activity.timestamp.toString(), style: TextStyle(color: Colors.black)), // Change text color for visibility
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}