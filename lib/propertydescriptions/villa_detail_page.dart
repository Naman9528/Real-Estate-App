import 'dart:ui';
import 'package:flutter/material.dart';

class VillaDetailPage extends StatelessWidget {
  final Map<String, String> property;

  const VillaDetailPage({required this.property, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // let content go behind AppBar for full effect
      appBar: AppBar(
        title: Text(property['type'] ?? 'Property Details'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          // Fullscreen background image
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/back.jpg'), // your background image
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Glassmorphism effect overlay
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
            child: Container(
              color: Colors.white.withOpacity(0.18), // adjust opacity for more/less glass
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          // Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      property['image']!,
                      height: 220,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Price: ${property['price']}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Type: ${property['type']}',
                    style: const TextStyle(fontSize: 20, color: Colors.black87),
                  ),
                  if ((property['bedrooms'] ?? '').isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Text(
                      'Bedrooms: ${property['bedrooms']}',
                      style: const TextStyle(color: Colors.black87),
                    ),
                  ],
                  const SizedBox(height: 8),
                  Text(
                    'Location: ${property['location']}',
                    style: const TextStyle(color: Colors.black87),
                  ),
                  const SizedBox(height: 18),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        property['description'] ?? 'No description available.',
                        style: const TextStyle(fontSize: 17, color: Colors.black87),
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Buy Now clicked!')),
                        );
                      },
                      child: const Text(
                        'Buy Now',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}