import 'package:flutter/material.dart';

class ImageOverlaySheet extends StatelessWidget {
  const ImageOverlaySheet({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      'assets/images/big image.png',

      //'assets/images/ima1.png',
      'assets/images/ima2.png',
      'assets/images/ima3.png',
      'assets/images/ima4.png',
    ];

    return Container(
      margin: const EdgeInsets.only(bottom: 200), // 🧲 Pulls it to center
      decoration: const BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Close Button
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.close, color: Colors.black),
              ),
            ),
          ),

          const SizedBox(height: 12),

          // Main Image
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              images[0],
              width: double.infinity,
              height: 350,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 8),

          // "1/98" Text BELOW image
          Container(
            decoration: BoxDecoration(color: Colors.blueGrey),
            child: const Text(
              "1/98",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                fontSize: 14,
              ),
            ),
          ),

          const SizedBox(height: 12),

          // Thumbnail List
          SizedBox(
            height: 90,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(right: 12),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      images[index],
                      width: 90,
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
