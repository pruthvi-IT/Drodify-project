import 'package:drodify_project/04HomeScreen/4.1%20Home.dart';
import 'package:drodify_project/04HomeScreen/4.10%20notification-filter.dart';
import 'package:drodify_project/04HomeScreen/4.7%20search%20result-filter.dart';
import 'package:flutter/material.dart';

class HotelListingScreen extends StatefulWidget {
  @override
  _HotelListingScreenState createState() => _HotelListingScreenState();
}

class _HotelListingScreenState extends State<HotelListingScreen> {
  // Dummy data for hotels
  final List<Map<String, dynamic>> hotels = [
    {
      'name': 'Emerald Beach Hotel',
      'location': 'Kuta, Badung, Bali',
      'price': 100,
      'rating': 4.7,
      'image': 'assets/images/images4.png',
      // Placeholder image
    },
    {
      'name': 'Imperium Hotel',
      'location': 'Sanur, Denpasar, Bali',
      'price': 150,
      'rating': 4.8,
      'image': 'assets/images/images3.png',
    },
    {
      'name': 'Nexario Hotel',
      'location': 'Abiansemal, Badung, Bali',
      'price': 166,
      'rating': 4.4,
      'image': 'assets/images/images2.png',
    },
    {
      'name': 'Santorio Hotel',
      'location': 'Kelod, Gianyar, Bali',
      'price': 85,
      'rating': 4.5,
      'image': 'assets/images/images1.png', // Placeholder image
    },
    {
      'name': 'Mezoni Hotel',
      'location': 'Kuta, Badung, Bali',
      'price': 120, // Example price
      'rating': 4.2, // Example rating
      'image': 'assets/images/images5.png',
    },
    {
      'name': 'Homingo Hotel',
      'location': 'Kuta, Badung, Bali',
      'price': 90, // Example price
      'rating': 4.6, // Example rating
      'image': 'assets/images/images.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Get the total width available for the app bar title
    // This calculates remaining width after considering leading and actions
    double screenWidth = MediaQuery.of(context).size.width;
    double leadingWidth = kToolbarHeight; // Default width of leading widget
    double actionsWidth =
        48.0 +
        8.0; // Approx width of filter icon + padding. Adjust if your icon is different size.

    // Calculate available width for the title
    double titleWidth =
        screenWidth -
        leadingWidth -
        actionsWidth -
        (16.0 * 2); // 16*2 for default AppBar horizontal padding

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        //elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 20,
          ), // Adjust size if needed
          onPressed: () {
            // Handle back button
          },
        ),

        titleSpacing:
            0, // Remove default title spacing to maximize horizontal space for title
        title: ConstrainedBox(
          // Use ConstrainedBox to limit the width of the title
          constraints: BoxConstraints(
            maxWidth: screenWidth - actionsWidth - 16.0 * 2,
          ),
          child: Container(
            height: 60,
            width: 500, // Ensure it takes full width available
            //padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisSize: MainAxisSize
                  .min, // Essential to allow the row to size itself to children
              children: [
                Padding(padding: EdgeInsets.only(left: 8)), // Reduced padding
                Icon(
                  Icons.search,
                  color: Colors.grey,
                  size: 20,
                ), // Adjust size if needed
                SizedBox(width: 3), // Reduced spacing
                Text(
                  'Bali, Indonesia',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ), // Smaller font size
                  overflow: TextOverflow.ellipsis, // Handle overflow
                  maxLines: 1,
                ),
                SizedBox(width: 8), // Reduced spacing
                // Separator
                Container(height: 20, width: 1, color: Colors.grey[400]),
                SizedBox(width: 8), // Reduced spacing
                Expanded(
                  // Allow date/guest text to expand
                  child: Text(
                    '11-14 Mar • 2 Guests',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ), // Smaller font size
                    overflow: TextOverflow.ellipsis, // Handle overflow
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          IconButton(
            // Use a custom filter icon if needed, ensure it's in your assets folder
            icon: Image.asset(
              'assets/icons/SlidersHorizontal.png',
              height: 24,
              width: 24, // Explicitly set width/height for better control
              errorBuilder: (context, error, stackTrace) =>
                  Icon(Icons.filter_list, color: Colors.black), // Fallback
            ),
            onPressed: () {
              // Handle filter button
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (context) => FractionallySizedBox(
                  heightFactor: 0.85,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(24),
                      ),
                    ),
                    child: FilterBottomSheet(),
                  ),
                ),
              );
            },
          ),
          SizedBox(width: 8),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 6.0,
            ),
            child: Container(
              margin: EdgeInsets.all(8),
              height: 18,
              width: 361,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${hotels.length} hotels found',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  DropdownButton<String>(
                    value: 'Relevance',
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.green,
                    ), // Color the icon
                    underline: SizedBox(),
                    onChanged: (String? newValue) {
                      print('Selected: $newValue');
                    },
                    items:
                        <String>[
                          'Relevance',
                          'Price: Low to High',
                          'Price: High to Low',
                          'Rating',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(color: Colors.green),
                            ),
                          );
                        }).toList(),
                    style: TextStyle(color: Colors.green),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(11.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                // Adjusted childAspectRatio to be closer to the image
                // Height is slightly more than width for the hotel card.
                childAspectRatio:
                    0.72, // You may need to fine-tune this value on your device
              ),
              itemCount: hotels.length,
              itemBuilder: (context, index) {
                final hotel = hotels[index];
                return HotelCard(hotel: hotel);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar:
          CustomBottomNavBar(), // Your existing bottom navigation bar
    );
  }
}

class HotelCard extends StatelessWidget {
  final Map<String, dynamic> hotel;

  const HotelCard({Key? key, required this.hotel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image takes 55-60% of the card height approximately based on visual
          Expanded(
            flex: 6, // Give more flex to the image section
            child: Stack(
              children: [
                Image.asset(
                  hotel['image'].toString(),
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height:
                      double.infinity, // Ensure image fills its allocated space
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[300],
                      child: Center(
                        child: Icon(Icons.broken_image, color: Colors.grey),
                      ),
                    );
                  },
                ),
                // Positioned(
                //   bottom: 8,
                //   right: 8,
                //   child: Container(
                //     decoration: BoxDecoration(
                //       color: Colors.white.withOpacity(0.8),
                //       shape: BoxShape.circle,
                //     ),
                //     child: IconButton(
                //       icon: Icon(Icons.favorite,
                //           color: Colors.red, size: 30), // Adjust icon size
                //       onPressed: () {
                //         // Handle favorite button
                //       },
                //       padding: EdgeInsets
                //           .zero, // Remove default padding of IconButton
                //       constraints:
                //           BoxConstraints(), // Remove default constraints
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          Expanded(
            flex: 4, // Remaining flex for details
            child: Padding(
              padding: const EdgeInsets.all(8.0), // Reduced padding slightly
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    hotel['name'],
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 14, color: Colors.grey),
                      SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          hotel['location'],
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[700],
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  Spacer(), // Use Spacer to push price/rating to bottom
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        // Group price and /night together
                        children: [
                          Text(
                            '\$${hotel['price']}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.green,
                            ),
                          ),
                          Text(
                            '/night',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        // Group star and rating together
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 16),
                          Text(
                            '${hotel['rating']}',
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
