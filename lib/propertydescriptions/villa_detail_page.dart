// --- FIX: Corrected import for Dart's UI library ---
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

import '../models/property_model.dart';
import '../providers/booking_provider.dart';

class VillaDetailPage extends StatelessWidget {
  final Map<String, String> property;

  const VillaDetailPage({required this.property, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/back.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 250.0,
              pinned: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: const EdgeInsets.symmetric(horizontal: 48, vertical: 12),
                centerTitle: true,
                title: Text(property['type'] ?? 'Details', style: const TextStyle(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.bold)),
                background: Hero(
                  tag: property['image']!,
                  child: Image.asset(
                    property['image']!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: AnimationLimiter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.2),
                            width: 1,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: AnimationConfiguration.toStaggeredList(
                              duration: const Duration(milliseconds: 500),
                              childAnimationBuilder: (widget) => SlideAnimation(
                                verticalOffset: 50.0,
                                child: FadeInAnimation(
                                  child: widget,
                                ),
                              ),
                              children: [
                                Text(
                                  'Price: ${property['price']}',
                                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Type: ${property['type']}',
                                  style: const TextStyle(fontSize: 18, fontStyle: FontStyle.italic, color: Colors.black),
                                ),
                                if ((property['bedrooms'] ?? '').isNotEmpty) ...[
                                  const SizedBox(height: 8),
                                  Text(
                                    '${property['bedrooms']}',
                                    style: const TextStyle(fontSize: 18, color: Colors.black),
                                  ),
                                ],
                                const SizedBox(height: 8),
                                Text(
                                  'Location: ${property['location']}',
                                  style: TextStyle(fontSize: 18, color: Colors.black.withOpacity(0.8)),
                                ),
                                const Divider(height: 32, color: Colors.black),
                                const Text(
                                  'Description',
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  property['description'] ?? 'No description available.',
                                  style: TextStyle(fontSize: 16, height: 1.5, color: Colors.black.withOpacity(0.9)),
                                ),
                                const SizedBox(height: 24),
                                SizedBox(
                                  width: double.infinity,
                                  height: 50,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blueAccent.withOpacity(0.8),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    onPressed: () {
                                      final propertyObject = Property(
                                        title: property['type'] ?? 'Unknown Property',
                                        price: property['price'] ?? 'N/A',
                                        imageUrl: property['image'] ?? '',
                                      );

                                      Provider.of<BookingProvider>(context, listen: false).addBooking(propertyObject);

                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                          content: Text('✅ Added to My Bookings!'),
                                          backgroundColor: Colors.green,
                                        ),
                                      );

                                      Navigator.of(context).pop();
                                    },
                                    child: const Text(
                                      'Buy Now',
                                      style: TextStyle(fontSize: 18, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}