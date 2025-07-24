import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:tryhello/category/fifthhotel.dart';
import 'package:tryhello/category/firsthotel.dart';
import 'package:tryhello/category/fourthhotel.dart';
import 'package:tryhello/category/secondhotel.dart';
import 'package:tryhello/category/thirdhotel.dart';

void main() {
  runApp( HotelListpage());
}

void openMap(String query) async {
  final Uri googleMapUrl = Uri.parse('https://www.google.com/maps/search/?api=1&query=$query');

  if (await canLaunchUrl(googleMapUrl)) {
    await launchUrl(googleMapUrl, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not open Google Maps.';
  }
}
class HotelListpage extends StatefulWidget {
  @override
  State<HotelListpage> createState() => _HotelListPageState();
}
class _HotelListPageState extends State<HotelListpage> {

  DateTimeRange? selectedDateRange;
  String selectedSort = '';
  List<String> selectedUserRatings = [];

  String getFormattedDateRange() {
    if (selectedDateRange == null) {
      return 'Today, Tomorrow';
    }
    final DateFormat formatter = DateFormat('E, d MMM');
    final start = formatter.format(selectedDateRange!.start);
    final end = formatter.format(selectedDateRange!.end);
    return '$start – $end';
  }

  void _openDateRangeSelector() async {
    final DateTime now = DateTime.now();
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: now,
      lastDate: DateTime(now.year + 1),
      initialDateRange: selectedDateRange ?? DateTimeRange(
        start: now,
        end: now.add(Duration(days: 1)),
      ),
    );
    if (picked != null) {
      setState(() {
        selectedDateRange = picked;
      });
    }
  }
  void _applySearch() {
    final query = _searchController.text.trim().toLowerCase();

    setState(() {
      if (query.isNotEmpty) {
        filteredHotels = hotels.where((hotel) {
          return hotel['name']!.toLowerCase().contains(query) ||
              hotel['location']!.toLowerCase().contains(query);
        }).toList();
      } else {
        filteredHotels = [...hotels];
      }
    });
  }


  Widget _buildDateRangeDisplay() {
    return GestureDetector(
      onTap: _openDateRangeSelector,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white.withAlpha(25),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.calendar_today, color: Colors.white, size: 18),
            SizedBox(width: 8),
            Text(
              getFormattedDateRange(),
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  final TextEditingController _searchController = TextEditingController();
  bool isLiked = false;
  bool isFav1 = false;
  bool isFav2 = false;
  bool includeBreakfast = false;
   List<Map<String, dynamic>> likedHotels = [];

  List<Map<String, dynamic>> filteredHotels = [];

    @override
    void initState() {
      super.initState();
      filteredHotels = [...hotels];
    }
  int extractPrice(String price) {
    return int.tryParse(price.replaceAll(RegExp(r'[^\d]'), '')) ?? 0;
  }
  void applyFiltersAndSort() {
    filteredHotels = [...hotels];

    if (selectedUserRatings.isNotEmpty) {

      final selectedThresholds = selectedUserRatings.map((label) {
        final parts = label.split(':');
        if (parts.length == 2) {
          return double.tryParse(parts[1].trim());
        }
        return null;
      }).whereType<double>().toList();

      filteredHotels = filteredHotels.where((hotel) {
        final hotelRating = double.tryParse(hotel['userRating'] ?? '') ?? 0.0;
        return selectedThresholds.any((threshold) => hotelRating >= threshold);
      }).toList();
    }


    if (selectedSort == 'Price (Low to High)') {
      filteredHotels.sort((a, b) =>
          extractPrice(a['price']!).compareTo(extractPrice(b['price']!)));
    } else if (selectedSort == 'Price (High to Low)') {
      filteredHotels.sort((a, b) =>
          extractPrice(b['price']!).compareTo(extractPrice(a['price']!)));
    }
    setState(() {});
  }
  final List<Map<String, String>> hotels = [

    {
      'name': 'The Roseate',
      'type': 'Hotel',
      'userRating': '8.6',
      'location': 'Indira Gandhi int Airport 2.52 km from Delhi...',
      'price': '₹10,725/night',
      'deal': 'Last-Minute Hotel Deals',
      'image': 'assets/images/roseate_hotel.jpg',
    },
    {
      'name': 'Ratnadeep Villas',
      'type': 'Apartment',
      'userRating': '9.8',
      'location': 'Lonavala',
      'price': '₹17,086/night',
      'deal': 'Less than usual',
      'image': 'assets/images/ratnadeep_villas.webp',
    },
    {
      'name': 'The Hosteller Delhi',
      'type': 'Hostel',
      'userRating': '8.7',
      'location': 'A-10. Mathura Rd, Near Ashram Chowk...',
      'price': '₹379/night',
      'deal': 'Offer of the year',
      'image': 'assets/images/hosteller_hotel.jpg',
    },
    {
      'name': 'Quality Inn Bhagsu Heritage',
      'type': 'Resort',
      'userRating': '8.1',
      'location': 'Bhagsung Road, Himachal Pradesh',
      'price': '₹2,027/night',
      'deal': 'Limited-Time deal',
      'image': 'assets/images/quality_inn_hotel.jpg',
    },
    {
      'name': 'Novotel Mumbai Juhu Beach',
      'type': 'Hostel',
      'userRating': '8.0',
      'location': 'Bala Sahani Marg Mumbai',
      'price': '₹7,858/night',
      'deal': 'Book Today Save More',
      'image': 'assets/images/juhu_hotel.jpg',
    },
  ];

  final List<String> userRatingOptions = [
    'Exceptional: 9.0',
    'Excellent: 8.0',
    'Very Good: 7.0',
    'Good: 6.0',
    'Pleasant: 5.0',
  ];
  get selectedSortOption => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(180),
        child: AppBar(
          backgroundColor: Colors.blue[600],
          elevation: 0,
          automaticallyImplyLeading: false,
          flexibleSpace: SafeArea(

            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10, right: 12, bottom: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center, // Updated alignment
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white), // More visible color
                        onPressed: () => Navigator.pop(context),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius: 4,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 5),
                              Expanded(
                                child: TextField(
                                  controller: _searchController,
                                  decoration: InputDecoration(
                                    prefixIcon: IconButton(
                                      icon: Icon(Icons.search, color: Colors.grey),
                                      onPressed: _applySearch, // Updated
                                    ),
                                    hintText: 'Search for city, Hotel',
                                    border: InputBorder.none,
                                  ),
                                  onSubmitted: (query) {
                                    _applySearch(); // Updated
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 6),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0,),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: double.infinity, child: _buildDateRangeDisplay()),
                  SizedBox(height: 12),

                      Row(
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                                ),
                                builder: (context) {
                                  final sortOptions = [
                                    'Price (Low to High)',
                                    'Price (High to Low)',
                                  ];
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: sortOptions.map((option) {
                                        return GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              selectedSort = option;
                                              applyFiltersAndSort();
                                            });
                                            Navigator.pop(context);
                                          },
                                          child: ListTile(
                                            title: Text(
                                              option,
                                              style: TextStyle(
                                                fontWeight: selectedSort == option
                                                    ? FontWeight.bold
                                                    : FontWeight.normal,
                                                color: selectedSort == option
                                                    ? Colors.indigo
                                                    : Colors.black,
                                              ),
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  );
                                },
                              );
                            },
                            label: Text("Sort"),
                            icon: Icon(Icons.sort),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.indigo,
                            ),
                          ),
                          SizedBox(width: 20),
                          //GestureDetector(
                          ElevatedButton.icon(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                                ),
                                builder: (context) {
                                  return Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: StatefulBuilder(
                                      builder: (context, setModalState) {
                                        return Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("User Rating", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                            ...userRatingOptions.map((rating) => CheckboxListTile(
                                              contentPadding: EdgeInsets.zero,
                                              title: Text(rating),
                                              value: selectedUserRatings.contains(rating),
                                              onChanged: (bool? value) {
                                                setModalState(() {
                                                  if (value == true) {
                                                    selectedUserRatings.add(rating);
                                                  } else {
                                                    selectedUserRatings.remove(rating);
                                                  }
                                                });
                                              },
                                              dense: true,
                                              controlAffinity: ListTileControlAffinity.leading,
                                            )),
                                            SizedBox(height: 20),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                TextButton(
                                                  onPressed: () {
                                                    setModalState(() {
                                                      selectedUserRatings.clear();
                                                    });
                                                  },
                                                  child: Text("Clear"),
                                                ),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                    applyFiltersAndSort();
                                                  },
                                                  child: Text(
                                                    "Show Results",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  style: ElevatedButton.styleFrom(
                                                    backgroundColor: Colors.blue,
                                                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(8),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  );
                                },
                              );
                            },
                            label: Text("Rating"),
                            icon: Icon(Icons.eighteen_up_rating),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.indigo,
                            ),
                          ),
                          SizedBox(width: 20),
                          // map button
                          ElevatedButton.icon(
                            onPressed: () {

                              launchUrl(Uri.parse('https://maps.google.com'));
                            },
                            label: Text("Map"),
                            icon: Icon(Icons.map),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.indigo,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
      ),
    ),

      body: ListView.builder(
          padding: EdgeInsets.all(10),
          itemCount: filteredHotels.length,
          itemBuilder: (context, index) {

            final hotel = filteredHotels[index];

            return HotelCard(
                hotel: hotel.cast<String, String>(),
                isFav: index == 0 ? isFav1 : isFav2,
                onFavToggle: () {
                  setState(() {
                    if (likedHotels.contains(hotel)) {
                      likedHotels.remove(hotel);
                    } else {
                      likedHotels.add(hotel);
                    }
                  });
                },

                onTap: () {
                  late Widget detailPage;

                  switch (hotel['name']) {
                    case 'The Roseate':
                      detailPage = RoseatePage();
                      break;
                    case 'Ratnadeep Villas':
                      detailPage = RatnadeepPage();
                      break;
                    case 'The Hosteller Delhi':
                      detailPage = HostellerPage();
                      break;
                    case 'Quality Inn Bhagsu Heritage':
                      detailPage = BhagsuPage();
                      break;
                    case 'Novotel Mumbai Juhu Beach':
                      detailPage = NovotelPage();
                      break;
                    default:
                      detailPage = HotelDetailPage(hotelName: hotel['name']!); // fallback page
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => detailPage),
                  );
                }
            );
          },
      ),
    );
  }
}

extension on Image {
  toLowerCase() {}
}
class HotelCard extends StatelessWidget {
  final Map<String, String> hotel;
  final bool isFav;
  final VoidCallback onFavToggle;
  final VoidCallback onTap;

  HotelCard({
    required this.hotel,
    required this.isFav,
    required this.onFavToggle,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                child:hotel['image'] != null
                    ? Image.asset(
                  hotel['image']!,
                  height: 170,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    height: 170,
                    color: Colors.grey[300],
                    child: Icon(Icons.broken_image, size: 60),
                  ),
                )
                    : Container(
                  height: 170,
                  color: Colors.grey[300],
                  child: Icon(Icons.broken_image, size: 60),
                ),
              ),
            ],
          ),
          ListTile(
            title: GestureDetector(
              onTap: onTap,
              child: Text(
                hotel['name']!,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(hotel['type']!),
                Text(hotel['userRating']!),

                Text(hotel['location']!),
                SizedBox(height: 5),
                Row(
                  children: [
                    Text(
                      hotel['price']!,
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.green[100],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        hotel['deal']!,
                        style: TextStyle(color: Colors.green[800]),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class HotelDetailPage extends StatelessWidget {
  final String hotelName;

  HotelDetailPage({required this.hotelName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(hotelName)),
      body: Center(
        child: Text(
          'Hotel Detail Page: $hotelName',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

