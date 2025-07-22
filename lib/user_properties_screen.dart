import 'dart:io';
import 'package:flutter/material.dart';

import 'animated_backgroundpage.dart';
 // Adjust import according to your file structure

class UserPropertiesScreen extends StatefulWidget {
  final List<Map<String, String>> userProperties;

  const UserPropertiesScreen({Key? key, required this.userProperties})
      : super(key: key);

  @override
  State<UserPropertiesScreen> createState() => _UserPropertiesScreenState();
}

class _UserPropertiesScreenState extends State<UserPropertiesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Listed Properties',style: TextStyle(fontWeight: FontWeight.bold),)),
      body: Stack(
        children: [
          AnimatedBackgroundpage(),  // Add the animated background here
          ListView.builder(
            itemCount: widget.userProperties.length,
            itemBuilder: (context, index) {
              final property = widget.userProperties[index];
              return Card(
                child: ListTile(
                  title: Text(property['type'] ?? 'Unknown'),
                  subtitle: Text(
                      'Price: ${property['price']}\nDescription: ${property['description']}'),
                  leading: property['image'] != null ? Image.file(
                      File(property['image']!)) : null,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}