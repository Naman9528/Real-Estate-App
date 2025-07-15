import 'package:flutter/material.dart';
import 'package:tryhello/propertydescriptions/villa_detail_page.dart';

class ShortlistPage extends StatelessWidget {
  final List<Map<String, String>> favoriteProperties;

  const ShortlistPage({Key? key, required this.favoriteProperties}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shortlisted Properties'),
        backgroundColor: Colors.blueAccent,
      ),
      body: favoriteProperties.isEmpty
          ? Center(child: Text('No shortlisted properties yet'))
          : ListView.builder(
        itemCount: favoriteProperties.length,
        itemBuilder: (context, index) {
          final property = favoriteProperties[index];
          return Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              leading: Image.asset(
                property['image']!,
                width: 100,
                fit: BoxFit.cover,
              ),
              title: Text(property['price']!),
              subtitle: Text(property['type']!),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        VillaDetailPage(property: property),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}