import 'package:flutter/material.dart';
import 'package:tryhello/category/hotels.dart';

void main() {
  runApp(const CategoryHomeScreen());
}

class CategoryHomeScreen extends StatefulWidget {
  const CategoryHomeScreen({super.key});

  @override
  State<CategoryHomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<CategoryHomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, String>> categories = const [
    {"title": "Luxury Villa/Resort", "image": "assets/images/villa_resort.jpg"},
    {"title": "Standard Hotel", "image": "assets/images/standard_hotel.webp"},
    {"title": "Apartment & flats", "image": "assets/images/flats.jpg"},
    {"title": "PG Rooms", "image": "assets/images/pgs.jpeg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // search bar
          Container(
            height: 150,
            padding: const EdgeInsets.only(top: 60, left: 10, right: 16),
            color: Colors.blue,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: _searchController,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.search, color: Colors.grey),
                        hintText: "Search by your location",
                        border: InputBorder.none,
                      ),
                      onSubmitted: (query) {
                        print("User searched: $query");
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),

          // header row with overflow fix
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "Choose your comfort stay :)",
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HotelListpage()),
                    );
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "View All",
                    style: TextStyle(fontWeight: FontWeight.w500),


                  ),
                )
              ],
            ),
          ),

          // Grid layout
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 0.61,
                children: categories.map((category) {
                  return Column(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            image: DecorationImage(
                              image: AssetImage(category["image"]!),
                              fit: BoxFit.cover,
                            ),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        category["title"]!,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
