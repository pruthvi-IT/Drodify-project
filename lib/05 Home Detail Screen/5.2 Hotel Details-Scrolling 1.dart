import 'package:flutter/material.dart';

class HotelDetailsPage extends StatelessWidget {
  const HotelDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          padding: EdgeInsets.only(left: 6),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 18),
          style: IconButton.styleFrom(
            backgroundColor: Colors.white,
            shape: CircleBorder(
              side: BorderSide(width: 0.3, color: Colors.grey),
            ),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: Text(
          'Emerald Beach Hotel',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              padding: EdgeInsets.only(right: 6),
              icon: const Icon(Icons.share, color: Colors.black, size: 18),
              style: IconButton.styleFrom(
                backgroundColor: Colors.white,
                shape: CircleBorder(
                  side: BorderSide(width: 0.3, color: Colors.grey),
                ),
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Review section
              _buildSectionHeader('Review'),
              SizedBox(height: 4),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.amber),
                  SizedBox(width: 4),
                  Text(
                    '4.7',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text('/5  ', style: TextStyle(color: Colors.grey)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Fantastic',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'From 12,245 Customers',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 4),
              _buildReviewCard(),

              SizedBox(height: 4),

              // Facilities
              _buildSectionHeader('Popular Facilities'),
              SizedBox(height: 18),
              _buildFacilitiesRow(),

              SizedBox(height: 20),

              // Location
              _buildSectionHeader('Location'),
              SizedBox(height: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/frames/Framemap.png',
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.location_on, color: Colors.grey),
                  SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      'Kartika Plaza Street, Tuban, Kuta, Badung, Bali',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),

              // Nearby destinations
              _buildSectionHeader('Nearby Destinations'),
              SizedBox(height: 12),
              _buildNearbyItem(
                Icons.restaurant,
                'Yoyo Restaurant',
                'Restaurant',
                '20m',
                Colors.amber,
              ),
              _buildNearbyItem(
                Icons.shopping_bag,
                'Taruma Accessories Kuta Square',
                'Shopping area',
                '25m',
                Colors.blue,
              ),
              _buildNearbyItem(
                Icons.pets,
                'Faures Kencana Zoo',
                'Zoo',
                '100m',
                Colors.green,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Start from'),
                Row(
                  children: [
                    Text(
                      '\$100',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text('/night'),
                  ],
                ),
              ],
            ),
            SizedBox(width: 82),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                child: Text("See Room"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
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

Widget _buildSectionHeader(String title) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      Text('See all', style: TextStyle(color: Colors.green)),
    ],
  );
}

Widget _buildReviewCard() {
  return Container(
    padding: EdgeInsets.all(12),
    decoration: BoxDecoration(
      //color: Colors.grey[100],
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Rating and date (above image)
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('5.0/5', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(
              '03 March 2025',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
        SizedBox(height: 8),

        // Image and review content
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/userimage.png', // Replace with your asset
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Billy J. Armstrong',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'It was amazing! Perfect beachfront location, friendly staff, and beautifully designed rooms. Can’t wait to return!',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.grey[800]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _buildFacilitiesRow() {
  final List<Map<String, dynamic>> facilities = [
    {'image': 'assets/icons/Sun.png', 'label': 'Sunny'},
    {'image': 'assets/icons/WifiHigh.png', 'label': 'Free Wifi'},
    {'image': 'assets/icons/Island.png', 'label': 'Beach'},
    {'image': 'assets/icons/Plant.png', 'label': 'Garden'},
    {'image': 'assets/icons/Coffee.png', 'label': 'Caffe'},
    {'image': 'assets/icons/BowlFood.png', 'label': 'Restaurant'},
  ];

  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: facilities.map((facility) {
        return Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey[200],
                radius: 24,
                child: Image.asset(facility['image'], width: 24, height: 24),
              ),
              SizedBox(height: 4),
              Text(facility['label'], style: TextStyle(fontSize: 12)),
            ],
          ),
        );
      }).toList(),
    ),
  );
}

Widget _buildNearbyItem(
  IconData icon,
  String title,
  String type,
  String distance,
  Color backgroundColor,
) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: Row(
      children: [
        CircleAvatar(
          backgroundColor: backgroundColor,
          child: Icon(icon, color: Colors.white),
        ),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
              Text(type, style: TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
        ),
        Text(distance, style: TextStyle(color: Colors.black)),
      ],
    ),
  );
}
