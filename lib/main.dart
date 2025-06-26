import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '𝓡𝓮𝓷𝓽 & 𝓡𝓮𝓼𝓽',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: LogoAnimationPage(),
    );
  }
}
// Splash screen animation page
class LogoAnimationPage extends StatefulWidget {
  @override
  _LogoAnimationPageState createState() => _LogoAnimationPageState();
}

class _LogoAnimationPageState extends State<LogoAnimationPage> with SingleTickerProviderStateMixin {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() => _opacity = 1.0);
    });

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: AnimatedOpacity(
          opacity: _opacity,
          duration: const Duration(seconds: 2),
          curve: Curves.easeIn,
          child: Image.asset(
            'assets/images/appicon2.png',
            width: 300,
            height: 300,
          ),
        ),
      ),
    );
  }
}

// Home screen with background image
class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, String>> allProperties = [
    {'image': 'assets/images/villa.jpg', 'price': '₹ 85,00,000', 'type': 'Villa', 'bedrooms': '4 Rooms(in Ground floor)', 'location': 'Agra'},
    {'image': 'assets/images/house.jpg', 'price': '₹ 90,00,000', 'type': 'house', 'bedrooms': '5 Rooms(in Ground floor)', 'location': 'Delhi'},
    {'image': 'assets/images/houses2.jpg', 'price': '₹ 36,00,000', 'type': 'House', 'bedrooms': 'For Sale', 'location': 'Mumbai'},
    {'image': 'assets/images/3 BHK room.jpg', 'price': '₹ 23,000/Month', 'type': 'Apartment rooms', 'bedrooms': '2 BHK', 'location': 'Bangalore'},
    {'image': 'assets/images/room in delhi.jpg', 'price': '₹ 32,000/month', 'type': 'Apartment rooms', 'bedrooms': '2 BHk', 'location': 'Delhi'},
    {'image': 'assets/images/house in agra.jpg', 'price': '₹ 25,00,000', 'type': 'House', 'bedrooms': 'For Sale', 'location': 'Agra'},
    {'image': 'assets/images/rooms in agra.jpg', 'price': '₹ 19,000/month', 'type': 'Apartment rooms', 'bedrooms': '2 BHK', 'location': 'Agra'},
    {'image': 'assets/images/rooms in bangalore.jpg', 'price': '₹ 25,000/month', 'type': 'Apartment rooms', 'bedrooms': '3 BHK', 'location': 'Bangalore'},
    {'image': 'assets/images/villas in agra.jpg', 'price': '₹ 50,00,000', 'type': 'Villa', 'bedrooms': '4 rooms(GroundFloor)', 'location': 'Agra'},
    {'image': 'assets/images/villas in bangalore.jpg', 'price': '₹ 1,00,00,000', 'type': 'Villa', 'bedrooms': '6 rooms(GroundFloor)', 'location': 'Bangalore'},
    {'image': 'assets/images/villas in delhi.jpg', 'price': '₹ 90,00,000', 'type': 'Villa', 'bedrooms': '5 rooms(GroundFloor)', 'location': 'Delhi'},
    {'image': 'assets/images/villas in mumbai.jpg', 'price': '₹ 1,00,00,000', 'type': 'Villa', 'bedrooms': '7 rooms(GroundFloor)', 'location': 'Mumbai'},
    {'image': 'assets/images/agra hotel room.jpg', 'price': '₹ 9,000/day', 'type': 'Hotel rooms', 'location': 'Agra'},
    {'image': 'assets/images/agra hotel.jpg',
      'price': '₹ 10,000/day',
      'type': 'Hotel rooms',
      'location': 'Agra'},
    {'image': 'assets/images/hotel room in delhi.jpg',
      'price': '₹ 9,800/day',
      'type': 'Hotel rooms',
      'location': 'Delhi'},
    {'image': 'assets/images/hotel room delhi.jpg',
      'price': '₹ 10,200/day',
      'type': 'Hotel rooms',
      'location': 'Delhi'},
    {'image': 'assets/images/bangalore hotel.jpg',
      'price': '₹ 10,800/day',
      'type': 'Hotel rooms',
      'location': 'Bangalore'},
    {'image': 'assets/images/bangalore hotel room.jpg',
      'price': '₹ 11,500/day',
      'type': 'Hotel rooms',
      'location': 'Bangalore'},
    {'image': 'assets/images/mumbai hotel.jpg',
      'price': '₹ 11,000/day',
      'type': 'Hotel rooms',
      'location': 'Mumbai'},
    {'image': 'assets/images/mumbai hotel1.jpg',
      'price': '₹ 12,000/day',
      'type': 'Hotel rooms',
      'location': 'Mumbai'},
    {'image': 'assets/images/delhi villas.jpg',
      'price': '₹ 93,00,000',
      'type': 'Villa',
      'bedrooms': '5 Rooms(in Ground floor)',
      'location': 'Delhi'},
    {'image': 'assets/images/villa bangalore.jpg',
      'price': '₹ 95,00,000',
      'type': 'Villa',
      'bedrooms': '6 Rooms(in Ground floor)',
      'location': 'Bangalore'},
    {'image': 'assets/images/mumabi villa.jpg',
      'price': '₹ 90,00,000',
      'type': 'Villa',
      'bedrooms': '6 Rooms(in Ground floor)',
      'location': 'Mumbai'},
    {'image': 'assets/images/delhi apartment1.png',
      'price': '₹ 20,000/Month',
      'type': 'Apartment rooms',
      'bedrooms': '2 BHK',
      'location': 'Delhi'},
    {'image': 'assets/images/mumbai apartment.jpg',
      'price': '₹ 23,000/Month',
      'type': 'Apartment rooms',
      'bedrooms': '3 BHK',
      'location': 'Mumbai'},
    {'image': 'assets/images/mumbai apartment2.jpg',
      'price': '₹ 20,000/Month',
      'type': 'Apartment rooms',
      'bedrooms': '2 BHK',
      'location': 'Mumbai'},
    {'image': 'assets/images/agra apartment1.jpg',
      'price': '₹ 25,000/Month',
      'type': 'Apartment rooms',
      'bedrooms': '3 BHK',
      'location': 'Agra'},
    {'image': 'assets/images/delhi house2.jpg',
      'price': '₹ 95,00,000',
      'type': 'house',
      'bedrooms': '4 Rooms(in Ground floor)',
      'location': 'Delhi'},
    {'image': 'assets/images/agra house2.jpg',
      'price': '₹ 80,00,000',
      'type': 'house',
      'bedrooms': '5 Rooms(in Ground floor)',
      'location': 'Agra'},
    {'image': 'assets/images/mumbai house2.jpeg',
      'price': '₹ 99,00,000',
      'type': 'house',
      'bedrooms': '6 Rooms(in Ground floor)',
      'location': 'Mumbai'},
    {'image': 'assets/images/bangalore house1.jpg',
      'price': '₹ 91,00,000',
      'type': 'house',
      'bedrooms': '5 Rooms(in Ground floor)',
      'location': 'Bangalore'},
    {'image': 'assets/images/bangalore house2.jpg',
      'price': '₹ 98,00,000',
      'type': 'house',
      'bedrooms': '6 Rooms(in Ground floor)',
      'location': 'Bangalore'},
  ];

  List<Map<String, String>> displayedProperties = [];
  String? selectedLocation;
  String? selectedType;
  double _minPrice = 9000;
  double _maxPrice = 10000000;
  RangeValues _currentRangeValues = const RangeValues(9000, 10000000);

  @override
  void initState() {
    super.initState();
    displayedProperties = List.from(allProperties);
  }

  void applyFilters() {
    setState(() {
      displayedProperties = allProperties.where((property) {
        int numericPrice = int.tryParse(property['price']!.replaceAll(RegExp(r'[^\d]'), '')) ?? 0;
        final inRange = numericPrice >= _currentRangeValues.start && numericPrice <= _currentRangeValues.end;
        final matchesLocation = selectedLocation == null || property['location'] == selectedLocation;
        final matchesType = selectedType == null || property['type']?.toLowerCase() == selectedType!.toLowerCase();
        return inRange && matchesLocation && matchesType;
      }).toList();
    });
  }

  void clearFilters() {
    setState(() {
      selectedLocation = null;
      selectedType = null;
      _currentRangeValues = RangeValues(_minPrice, _maxPrice);
      displayedProperties = List.from(allProperties);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('𝓡𝓮𝓷𝓽 & 𝓡𝓮𝓼𝓽', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        actions: const [
          Icon(Icons.search),
          SizedBox(width: 25),
          Icon(Icons.notification_important_outlined),
          SizedBox(width: 25),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/hillvilla.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SizedBox(height: 27),
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/user.jpg'),
                  ),
                ],
              ),
            ),
            ListTile(leading: Icon(Icons.category_outlined), title: Text('Category')),
            ListTile(leading: Icon(Icons.trending_up), title: Text('Trending houses')),
            ListTile(leading: Icon(Icons.local_activity), title: Text('Activity')),
            ListTile(leading: Icon(Icons.wallet_outlined), title: Text('Wallet')),
            ListTile(leading: Icon(Icons.language), title: Text('Change language')),
            ListTile(leading: Icon(Icons.help_outline), title: Text('Help')),
            const Divider(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Are you a property owner ?', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            ),
            ListTile(leading: Icon(Icons.apartment_sharp), title: Text('List your property')),
            ListTile(leading: Icon(Icons.settings), title: Text('Settings')),
            ListTile(leading: Icon(Icons.logout_outlined), title: Text('Logout')),
          ],
        ),
      ),
      body: Container(
        // ✅ Added background image here:
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/back.jpg'), // <-- put your image path
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Filter UI
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Price Range: ₹${_currentRangeValues.start.toInt()} - ₹${_currentRangeValues.end.toInt()}'),
                              RangeSlider(
                                values: _currentRangeValues,
                                min: _minPrice,
                                max: _maxPrice,
                                divisions: 100,
                                labels: RangeLabels(
                                  '₹${_currentRangeValues.start.toInt()}',
                                  '₹${_currentRangeValues.end.toInt()}',
                                ),
                                onChanged: (values) {
                                  setState(() => _currentRangeValues = values);
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              labelText: "Location",
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                            value: selectedLocation,
                            items: ['Agra', 'Delhi', 'Mumbai', 'Bangalore']
                                .map((loc) => DropdownMenuItem(
                              value: loc,
                              child: Text(loc),
                            ))
                                .toList(),
                            onChanged: (value) => setState(() => selectedLocation = value),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: "Type",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      value: selectedType,
                      items: ['Villa', 'House', 'Apartment rooms', 'Hotel rooms']
                          .map((type) => DropdownMenuItem(
                        value: type,
                        child: Text(type),
                      ))
                          .toList(),
                      onChanged: (value) => setState(() => selectedType = value),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
                            onPressed: applyFilters,
                            child: const Text('Apply Filters', style: TextStyle(color: Colors.white)),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                            onPressed: clearFilters,
                            child: const Text('Clear Filters', style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: const Text(
                  "Best offer for you",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Stack(
                    children: [
                      Image.asset('assets/images/offer2.jpg', height: 180, width: double.infinity, fit: BoxFit.cover),
                      const Positioned(
                        top: 20,
                        right: 20,
                        child: Text(
                          'Book Now',
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Stack(
                    children: [
                      Image.asset('assets/images/offer1.jpg', height: 180, width: double.infinity, fit: BoxFit.cover),
                      const Positioned(
                        top: 20,
                        left: 20,
                        child: Text(
                          'Book Now',
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: List.generate(
                    displayedProperties.length,
                        (index) {
                      final property = displayedProperties[index];
                      return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 500),
                        child: FlipAnimation(
                          curve: Curves.easeInOut,
                          child: FadeInAnimation(
                            child: Card(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              elevation: 4,
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                                    child: Image.asset(
                                      property['image']!,
                                      height: 200,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Price: ${property['price']}',
                                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          'Type: ${property['type']}',
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                        if ((property['bedrooms'] ?? '').isNotEmpty)
                                          Padding(
                                            padding: const EdgeInsets.only(top: 4),
                                            child: Text(
                                              property['bedrooms']!,
                                              style: const TextStyle(fontSize: 16),
                                            ),
                                          ),
                                        const SizedBox(height: 4),
                                        const Text(
                                          'More Details...',
                                          style: TextStyle(fontSize: 14, color: Colors.blueAccent),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
    ),
    bottomNavigationBar: BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    items: const [
    BottomNavigationBarItem(
    icon: Icon(Icons.home_filled), label: 'Home'),
    BottomNavigationBarItem(
    icon: Icon(Icons.shopping_bag_rounded), label: 'Shortlist'),
    BottomNavigationBarItem(
    icon: Icon(Icons.bookmark_border), label: 'Booking'),
    BottomNavigationBarItem(
    icon: Icon(Icons.person), label: 'You'),
    ],
    ),

    );
  }
}
