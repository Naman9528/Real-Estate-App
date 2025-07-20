import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/booking_provider.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Bookings"),
        backgroundColor: Colors.blueAccent,
      ),
      // Use a Consumer widget to listen for changes in the BookingProvider
      body:Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/back.jpg'),
          fit: BoxFit.cover
          ),
        ),

      child:
      Consumer<BookingProvider>(
        builder: (context, provider, child) {
          // Get the list of booked properties from the provider
          final bookedList = provider.bookedProperties;

          // If the list is empty, show a message
          if (bookedList.isEmpty) {
            return const Center(
              child: Text(
                'You have no bookings yet.',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            );
          }

          // If the list has items, display them in a ListView
          return ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: bookedList.length,
            itemBuilder: (context, index) {
              final property = bookedList[index];
              // This is your Card UI for a booked item
              return Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(12),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    // Display the image
                    child: Image.asset(
                      property.imageUrl,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                      // Handle potential image loading errors
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.house_rounded, size: 50);
                      },
                    ),
                  ),
                  title: Text(
                    property.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Text(
                    "Paid: ${property.price}",
                    style: TextStyle(
                      color: Colors.green.shade700,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    // You can navigate to a more detailed booking view here
                  },
                ),
              );
            },
          );
        },
      ),
      )
    );
  }
}