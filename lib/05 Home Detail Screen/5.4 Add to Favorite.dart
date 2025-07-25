import 'package:drodify_project/05%20Home%20Detail%20Screen/5.5%20Create%20New%20Collection.dart';
import 'package:flutter/material.dart';

void showFavoritesBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    isScrollControlled: true,
    builder: (_) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Spacer(),
                Text(
                  'Add to Favorites – Save Your Perfect Stay!',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 10),
                Icon(Icons.close),
              ],
            ),
            SizedBox(height: 16),

            // Hotel List
            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                _buildHotelTile(
                  'Hotel in Bali',
                  '14 Hotels',
                  'assets/images/BALI.png',
                ),
                _buildHotelTile(
                  'Hotel in UK',
                  '7 Hotels',
                  'assets/images/UK.png',
                ),
                _buildHotelTile(
                  'Hotel in Maldives',
                  '2 Hotels',
                  'assets/images/MALDIVES.png',
                ),
                _buildHotelTile(
                  'Hotel in Dubai',
                  '7 Hotels',
                  'assets/images/DUBAI.png',
                ),
                _buildHotelTile(
                  'Hotel in Tokyo',
                  '3 Hotels',
                  'assets/images/TOKYO.png',
                ),
              ],
            ),

            SizedBox(height: 16),

            // Create Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    'Create New Collection',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 12),
          ],
        ),
      );
    },
  );
}

Widget _buildHotelTile(String title, String subtitle, String imagePath) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            imagePath,
            height: 45,
            width: 45,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 2),
              Text(subtitle, style: TextStyle(color: Colors.grey)),
            ],
          ),
        ),
        Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      ],
    ),
  );
}
