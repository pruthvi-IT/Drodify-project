import 'package:flutter/material.dart';

class HotelDetailPage2 extends StatelessWidget {
  const HotelDetailPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            children: [
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
              _buildNearbyItem(
                Icons.beach_access_outlined,
                'Kuta Beach',
                'Beach',
                '150m',
                Colors.green,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Accommodation Rules',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'See all',
                        style: TextStyle(fontSize: 14, color: Colors.green),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),

                  // Check-in Time Info
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/icons/time.png', // Replace with your icon
                        width: 20,
                        height: 20,
                      ),
                      SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Check-in & Check-out Time',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Check-in',
                                    style: TextStyle(fontSize: 13),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    '14:00–23:59',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 40),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Check-out',
                                    style: TextStyle(fontSize: 13),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    '12:00',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          SizedBox(
                            width: 280,
                            child: Text(
                              'Want to check in early? Fill out the Special Request form on the booking page',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 24),

                  // Children Info
                  Text(
                    'Children',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Children ages 12 years old and above will be considered as adults.',
                    maxLines: 1,

                    style: TextStyle(fontSize: 13),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Please make sure that the children\'s age is consistent with the information provided.',
                    maxLines: 1,

                    style: TextStyle(fontSize: 13),
                  ),

                  SizedBox(height: 24),

                  // About Accommodation
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'About Accommodation',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'See more',
                        style: TextStyle(fontSize: 14, color: Colors.green),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Welcome to Emerald Beach Hotel, where luxury meets the tranquility of the sea. Nestled along a pristine coastline, our hotel offers breathtaking ocean views, world-class amenities, and exceptional...',
                    style: TextStyle(fontSize: 13),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
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

Widget _buildSectionHeader(String title) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      Text('See all', style: TextStyle(color: Colors.green)),
    ],
  );
}
Widget buildSearchOverlay(TextEditingController controller) {
  return Container(
    width: 300, // adjust this width as needed
    padding: const EdgeInsets.all(16),
    margin: const EdgeInsets.only(right: 16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 10,
          offset: Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Search Bar
        TextField(
          controller: controller,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            hintText: 'Bali',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          ),
        ),
        const SizedBox(height: 16),

        // Search Result List
        ..._buildSearchResults(),
      ],
    ),
  );
}

// Helper for each result row
Widget _buildHotelSearchItem(String title, String subtitle, IconData icon, {Color titleColor = Colors.black}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: Colors.black87),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.w600, color: titleColor),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: const TextStyle(color: Colors.black54, fontSize: 13),
              ),
            ],
          ),
        )
      ],
    ),
  );
}

// All search results
List<Widget> _buildSearchResults() {
  return [
    _buildHotelSearchItem('Bali', 'Indonesia', Icons.public, titleColor: Colors.green),
    _buildHotelSearchItem('Balikpapan', 'East Kalimantan, Indonesia', Icons.location_on, titleColor: Colors.green),
    _buildHotelSearchItem('Balige', 'Toba, North Sumatera, Indonesia', Icons.location_on, titleColor: Colors.green),
    _buildHotelSearchItem('Baligong Hotel', 'Kaliruang, Yogyakarta, Indonesia', Icons.apartment, titleColor: Colors.green),
    _buildHotelSearchItem('Balinesia Hotel', 'Gianyar, Bali, Indonesia', Icons.apartment, titleColor: Colors.green),
    _buildHotelSearchItem('Aabali Hotel', 'London, United Kingdom', Icons.apartment),
    _buildHotelSearchItem('Empirabalina Hotel', 'Marylebone, London, UK', Icons.apartment),
    _buildHotelSearchItem('Nobalica Hotel', 'Liverpool, United Kingdom', Icons.apartment),
    _buildHotelSearchItem('Yubalinah Hotel', 'Abu Dhabi, UAE', Icons.apartment),
  ];
}