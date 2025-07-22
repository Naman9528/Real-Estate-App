import 'package:flutter/material.dart';
import 'activity_model.dart';

class ActivityPage extends StatelessWidget {
  final List<Activity> activities;

  const ActivityPage({Key? key, required this.activities}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity Log'),
      ),
      body: ListView.builder(
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
            title: Text(activity.description),
            subtitle: Text(activity.timestamp.toString()),
          );
        },
      ),
    );
  }
}