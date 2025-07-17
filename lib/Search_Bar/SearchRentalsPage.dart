import 'package:flutter/material.dart';
import 'dart:ui';

class SearchRentalsPage extends StatefulWidget {
  final List<Map<String, String>> allProperties;

  const SearchRentalsPage({Key? key, required this.allProperties}) : super(key: key);

  @override
  State<SearchRentalsPage> createState() => _SearchRentalsPageState();
}

class _SearchRentalsPageState extends State<SearchRentalsPage> {
  String searchQuery = '';
  String selectedCity = '';

  List<String> get cities {
    return widget.allProperties
        .map((property) => property['location'] ?? '')
        .toSet()
        .toList();
  }

  List<Map<String, String>> get filteredProperties {
    if (searchQuery.isEmpty && selectedCity.isEmpty) return [];
    return widget.allProperties.where((property) {
      final location = property['location']?.toLowerCase() ?? '';
      final queryMatch = location.contains(searchQuery.toLowerCase());
      final cityMatch = selectedCity.isEmpty || location == selectedCity.toLowerCase();
      return queryMatch && cityMatch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Search Your Property',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              'assets/images/back.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.white30),
                      ),
                      child: TextField(
                        decoration: const InputDecoration(
                          hintText: 'Search by location',
                          border: InputBorder.none,
                          icon: Icon(Icons.search),
                        ),
                        onChanged: (value) {
                          setState(() {
                            searchQuery = value;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField(
                  decoration: InputDecoration(
                    labelText: 'Select City',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  items: cities
                      .map((city) => DropdownMenuItem(value: city, child: Text(city)))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedCity = value.toString();
                    });
                  },
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: filteredProperties.isEmpty
                      ? const Center(child: Text("No results found"))
                      : ListView.builder(
                    itemCount: filteredProperties.length,
                    itemBuilder: (context, index) {
                      final property = filteredProperties[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  PropertyDetailsPage(property: property),
                            ),
                          );
                        },
                        child: Card(
                          margin: const EdgeInsets.only(bottom: 12),
                          child: ListTile(
                            leading: property['image'] != null
                                ? Image.asset(
                              property['image']!,
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            )
                                : const Icon(Icons.image_not_supported),
                            title: Text(property['type'] ?? 'No title'),
                            subtitle: Text(
                              '${property['price']} • ${property['bedrooms']}',
                            ),
                            isThreeLine: true,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PropertyDetailsPage extends StatelessWidget {
  final Map<String, String> property;

  const PropertyDetailsPage({Key? key, required this.property}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(property['type'] ?? 'Property Details'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (property['image'] != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(property['image']!),
              ),
            const SizedBox(height: 16),
            Text(
              property['type'] ?? 'Unknown Type',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              property['price'] ?? '',
              style: const TextStyle(fontSize: 18, color: Colors.green),
            ),
            const SizedBox(height: 8),
            if (property['bedrooms'] != null)
              Text('Bedrooms: ${property['bedrooms']}'),
            const SizedBox(height: 8),
            if (property['location'] != null)
              Text('Location: ${property['location']}'),
            const SizedBox(height: 8),
            if (property['description'] != null)
              Text('Description: ${property['description']}'),
            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Booking feature coming soon!')),
                  );
                },
                child: const Text(
                  'Book Now',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
