import 'package:flutter/material.dart';

class SearchRentalsPage extends StatefulWidget {
  @override
  _SearchRentalsPageState createState() => _SearchRentalsPageState();
}

class _SearchRentalsPageState extends State<SearchRentalsPage> {
  String searchQuery = '';
  String selectedCity = '';
  List<String> cities = ['Mumbai', 'Delhi', 'Bangalore', 'Agra'];
  List<String> filters = ['PG', 'Flat', '1 BHK', '2 BHK'];
  Set<String> selectedFilters = {};

  List<Map<String, String>> allProperties = [
    {
      'title': '2 BHK in Andheri',
      'price': '₹20,500,000',
      'desc': 'Semi-Furnished',
      'city': 'Mumbai',
    },
    {
      'title': '1 BHK in Koramangala',
      'price': '₹18,00,000',
      'desc': 'Fully Furnished',
      'city': 'Bangalore',
    },
    {
      'title': 'Flat in Connaught Place',
      'price': '₹35,000,000',
      'desc': 'Unfurnished',
      'city': 'Delhi',
    },
    {
      'title': '2 BHK near Taj Mahal',
      'price': '₹80,00,000',
      'desc': 'Basic Furnished',
      'city': 'Agra',
    },
    {
      'title': '2 BHK in Andheri',
      'price': '₹25,000,000',
      'desc': 'Semi-Furnished',
      'city': 'Mumbai',
    },
    {
      'title': '1 BHK in Bandra',
      'price': '₹20,000,000',
      'desc': 'Fully Furnished',
      'city': 'Mumbai',
    },
    {
      'title': 'Flat near India Gate',
      'price': '₹1,000,000',
      'desc': 'Unfurnished',
      'city': 'Delhi',
    },
    {
      'title': 'PG near IIT Delhi',
      'price': '₹8,000/month',
      'desc': 'Shared Room',
      'city': 'Delhi',
    },
    {
      'title': 'Villa in Koramangala',
      'price': '₹22,000,000',
      'desc': 'Fully Furnished',
      'city': 'Bangalore',
    },
    {
      'title': '2 BHK in Whitefield',
      'price': '₹28,000/month',
      'desc': 'Semi-Furnished',
      'city': 'Bangalore',
    },
  ];

  List<Map<String, String>> get filteredProperties {
    return allProperties.where((property) {
      final matchQuery = property['title']!
          .toLowerCase()
          .contains(searchQuery.toLowerCase());
      final matchCity = selectedCity.isEmpty ||
          property['city']!.toLowerCase() == selectedCity.toLowerCase();
      return matchQuery && matchCity;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Rentals'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search by city, locality, or landmark',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),

            const SizedBox(height: 12),

            // Filters
            Wrap(
              spacing: 8,
              children: filters.map((filter) {
                final isSelected = selectedFilters.contains(filter);
                return FilterChip(
                  label: Text(filter),
                  selected: isSelected,
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        selectedFilters.add(filter);
                      } else {
                        selectedFilters.remove(filter);
                      }
                    });
                  },
                );
              }).toList(),
            ),

            const SizedBox(height: 12),

            // Dropdown for City
            DropdownButtonFormField(
              decoration: InputDecoration(
                labelText: 'Select City',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              items: cities
                  .map((city) =>
                  DropdownMenuItem(value: city, child: Text(city)))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedCity = value.toString();
                });
              },
            ),

            const SizedBox(height: 16),

            // Results
            Expanded(
              child: filteredProperties.isEmpty
                  ? Center(child: Text("No results found"))
                  : ListView.builder(
                itemCount: filteredProperties.length,
                itemBuilder: (context, index) {
                  final property = filteredProperties[index];
                  return Card(
                    margin: EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      leading: Icon(Icons.home, size: 36),
                      title: Text(property['title']!),
                      subtitle: Text(
                        '${property['price']} • ${property['desc']}',
                      ),
                      trailing:
                      Icon(Icons.arrow_forward_ios, size: 16),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
