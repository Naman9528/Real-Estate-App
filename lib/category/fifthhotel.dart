import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: NovotelPage()));

class NovotelPage extends StatefulWidget {
  @override
  _HotelDetailPageState createState() => _HotelDetailPageState();
}
class _HotelDetailPageState extends State<NovotelPage> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Hotel Image with heart icon
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(16)),
                    child: Image.asset(
                      'assets/images/juhu_hotel.jpg',
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 16,
                    left: 16,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Positioned(
                    top: 16,
                    right: 16,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isLiked = !isLiked;
                        });
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.favorite,
                          color: isLiked ? Colors.red : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // Amenities Row
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _iconText(Icons.wifi, "Free Wifi"),
                    _iconText(Icons.money, "Pay at the property"),
                    _iconText(Icons.star, "4", color: Colors.yellow[700]),

                  ],
                ),
              ),

              // Hotel Name and Price
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        "Novotel Mumbai Juhu Beach",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      "₹7,858/ night",
                      style: TextStyle(fontSize: 18, color: Colors.redAccent),
                    ),
                  ],
                ),
              ),

              // Location
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 8),
                child: Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.redAccent),
                    SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        "Bala Sahani Marg Mumbai",
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                  ],
                ),
              ),

              // Top Amenities
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Top Amenities", style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    _bulletText("Superior Room & 1 King Bed"),
                    _bulletText("Hotel Bar  & Restaurant"),
                    _bulletText("Parking & Air Conditioning"),
                    _bulletText("Pets are allowed"),
                    _bulletText("Wheelchair accessible."),
                  ],
                ),
              ),

              // Description
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Description", style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Text(
                      "Novotel Mumbai Juhu Beach is a seaside hotel in Mumbai with"
                          " rainfall showers & more.It offers multi cuisine dining "
                          " (French, Indian, Chinese, Italian) and a 24-hour buffet.",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ],
                ),
              ),

              // Preview Images
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Preview", style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    SizedBox(
                      height: 100,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          _previewImage('assets/images/hotel13.jpg'),
                          _previewImage('assets/images/hotel14.jpg'),
                          _previewImage('assets/images/hotel15.jpg'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 80),
            ],
          ),
        ),
      ),

      // Booking Button
      bottomSheet: Container(
        width: double.infinity,
        color: Colors.white,
        padding: EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            padding: EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)),
          ),
          child: Text("Booking Now",
              style: TextStyle(color: Colors.white, fontSize: 16)),
        ),
      ),
    );
  }

  // Reusable icon + text widget
  Widget _iconText(IconData icon, String label, {Color? color}) {
    return Column(
      children: [
        Icon(icon, color: Colors.black54),
        SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }

  // Reusable bullet point
  Widget _bulletText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("• ", style: TextStyle(fontSize: 16)),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }

  // Reusable image preview
  Widget _previewImage(String assetPath) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          assetPath,
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}