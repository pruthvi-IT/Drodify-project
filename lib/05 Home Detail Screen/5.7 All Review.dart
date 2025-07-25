import 'package:drodify_project/05%20Home%20Detail%20Screen/5.10%20All%20Review%20-%20Open%20Review.dart';
import 'package:drodify_project/05%20Home%20Detail%20Screen/5.8%20All%20Review-filter.dart';
import 'package:drodify_project/05%20Home%20Detail%20Screen/5.9%20All%20Review-Open%20Picture.dart';
import 'package:flutter/material.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({super.key});

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
        title: Text('Reviews', style: TextStyle(color: Colors.black)),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              padding: EdgeInsets.only(right: 4),
              icon: Image.asset('assets/icons/filter_icon.png'),
              //icon: const Icon(Icons.share, color: Colors.black, size: 18),
              style: IconButton.styleFrom(
                backgroundColor: Colors.white,
                shape: CircleBorder(
                  side: BorderSide(width: 0.3, color: Colors.grey),
                ),
              ),
              onPressed: () {
                showFilterBottomSheet(context);
              },
            ),
          ),
        ],
      ),
      // backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(16),
                children: [
                  _buildRatingSummary(),
                  SizedBox(height: 20),
                  buildFeatureRatings(),
                  SizedBox(height: 20),
                  Text(
                    "Pictures From Guests",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 12),
                  SizedBox(
                    height: 100, // Adjust height as needed
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildPhotoCard("assets/images/p1.png"),
                        SizedBox(width: 12),
                        _buildPhotoCard("assets/images/p2.png"),
                        SizedBox(width: 12),
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor:
                                  Colors.transparent, // transparent outside
                              builder: (_) => const ImageOverlaySheet(),
                            );
                          },
                          child: _buildOverlayCard(
                            "assets/images/p3.png",
                            "+98 Photos",
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      showReviewModal2(context);
                    },
                    child: _buildReviewCard(
                      "Billy J. Armstrong",
                      "assets/images/room1.png",
                      "It was amazing! Perfect beachfront location, friendly staff, and beautifully designed rooms. Can’t wait to re...",
                      "03 March 2025",
                      5.0,
                    ),
                  ),

                  _buildReviewCard(
                    "Tony Hawkwatch",
                    "assets/images/room2.png",
                    "My experience at Emerald Beach Hotel was fantastic! The rooms were spotless, the staff was incredibly frie...",
                    "02 March 2025",
                    5.0,
                  ),
                  _buildReviewCard(
                    "Alice Stronghold",
                    "assets/images/room3.png",
                    "This hotel exceeded my expectations! The spa treatments were heavenly, the pool area was beautiful...",
                    "28 February 2025",
                    4.7,
                  ),
                  _buildReviewCard(
                    "Phineas Mc Foy",
                    "assets/images/room4.png",
                    "Emerald Beach Hotel is located right in the heart of the city, making it super convenient for sightseeing. The...",
                    "28 February 2025",
                    4.8,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRatingSummary() {
    return Row(
      children: [
        Column(
          children: [
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber),
                SizedBox(width: 4),
                Text(
                  "4.7",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                Text("/5", style: TextStyle(color: Colors.grey)),
                SizedBox(width: 28),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      "Fantastic",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),

                    Text(
                      "From 12,245 Customers",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget buildFeatureRatings() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left Column
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildFeatureRowWithAsset(
              'assets/icons/Armchair.png',
              'Facilities',
              4.5,
            ),
            SizedBox(height: 16),
            _buildFeatureRowWithAsset(
              'assets/icons/Broom.png',
              'Cleanliness',
              4.8,
            ),
            SizedBox(height: 16),
            _buildFeatureRowWithAsset(
              'assets/icons/SealCheck.png',
              'Value',
              4.7,
            ),
          ],
        ),

        // Right Column
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildFeatureRowWithAsset(
              'assets/icons/CallBell.png',
              'Service',
              4.8,
            ),
            SizedBox(height: 16),
            _buildFeatureRowWithAsset(
              'assets/icons/MapPinArea.png',
              'Location',
              4.7,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFeatureRowWithAsset(
    String imagePath,
    String label,
    double rating,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(imagePath, width: 20, height: 20),
        SizedBox(width: 8),
        SizedBox(
          width: 100, // Ensures all text labels take same space
          child: Text(label, style: TextStyle(fontSize: 14)),
        ),
        SizedBox(width: 8),
        Text(rating.toString(), style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildFeatureRow(IconData icon, String label, double value) {
    return Row(
      children: [
        Icon(icon, color: Colors.green, size: 20),
        SizedBox(width: 8),
        Text(label, style: TextStyle(fontSize: 14)),
        SizedBox(width: 12),
        Text(value.toString(), style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildPhotoCard(String imagePath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(imagePath, width: 100, height: 100, fit: BoxFit.cover),
    );
  }

  Widget _buildOverlayCard(String imagePath, String overlayText) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(imagePath, width: 100, height: 100, fit: BoxFit.cover),
          Container(
            width: 100,
            height: 100,
            color: Colors.black.withOpacity(0.4),
            alignment: Alignment.center,
            child: Text(
              overlayText,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildReviewCard(
  String name,
  String imagePath,
  String text,
  String date,
  double rating,
) {
  return Container(
    margin: EdgeInsets.only(bottom: 16),
    padding: EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // First Row: Rating and Date
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${rating.toStringAsFixed(1)}/5.0",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            Text(date, style: TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),
        SizedBox(height: 8),
        // Second Row: Image and Content
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagePath,
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text(
                    text,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 13),
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
