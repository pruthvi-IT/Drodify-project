import 'package:flutter/material.dart';

import 'dart:ui';

class AiHotelDetailsScreen extends StatelessWidget {
  const AiHotelDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: Colors.white.withOpacity(0.2),
      ),
      // backgroundColor: Colors.black,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            // Main hotel image - NO BLUR, clear image
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              width: double.infinity,
              height: 600,

              child: Image.network(
                'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/7af741fee53843867cfa449e86b23dba80e5e051%20%281%29.png-64ulg8YdPmQiATlkajtKxD5KKKoeOt.jpeg',
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    color: Colors.grey[300],
                    child: const Center(child: CircularProgressIndicator()),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: const Center(
                      child: Icon(Icons.image, size: 50, color: Colors.grey),
                    ),
                  );
                },
              ),
            ),
            // Back button with blur effect and custom icon
            Positioned(
              top: 10,
              left: 16,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0x261E1E1E), // #1E1E1E26
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Image.network(
                        'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/Vector%20%2828%29-QUs8hZH147HD39DlMTjEVBD6Gb89ON.png',
                        width: 20,
                        height: 20,
                        color: Colors.white,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const SizedBox(
                            width: 12,
                            height: 12,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 20,
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Share button with blur effect and custom icon
            Positioned(
              top: 10,
              right: 16,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0x261E1E1E), // #1E1E1E26
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Image.network(
                        'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/Vector%20%2827%29-UrToiCcDv2wnyWCJcCJA4VaCA6zOcJ.png',
                        width: 20,
                        height: 20,
                        color: Colors.white,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const SizedBox(
                            width: 12,
                            height: 12,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(
                            Icons.share,
                            color: Colors.white,
                            size: 20,
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Rectangle and 4 circles with equal spacing
            Positioned(
              top: 300,
              left: 0,
              right: 0,
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Rectangle
                    Container(
                      width: 24,
                      height: 4,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFFFF), // #FFFFFF
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    const SizedBox(width: 4), // Equal spacing
                    // First circle
                    Container(
                      width: 4,
                      height: 4,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF0F0F0), // #F0F0F0
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    const SizedBox(width: 4), // Equal spacing
                    // Second circle
                    Container(
                      width: 4,
                      height: 4,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF0F0F0), // #F0F0F0
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    const SizedBox(width: 4), // Equal spacing
                    // Third circle
                    Container(
                      width: 4,
                      height: 4,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF0F0F0), // #F0F0F0
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    const SizedBox(width: 4), // Equal spacing
                    // Fourth circle
                    Container(
                      width: 4,
                      height: 4,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF0F0F0), // #F0F0F0
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Content overlay - with custom facility icons
            Positioned(
              top: 350,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Hotel name and heart
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Emerald Beach Hotel',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                    fontFamily: 'Inter Tight',
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Row(
                                  children: [
                                    // Replace location icon with custom image
                                    Image.network(
                                      'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/Icon%20%282%29-mAskWG9KDve3M5zQGa65fg7CwaIDLY.png',
                                      width: 14,
                                      height: 14,
                                      color: const Color(0xFF6E6E6E),
                                      loadingBuilder:
                                          (context, child, loadingProgress) {
                                            if (loadingProgress == null)
                                              return child;
                                            return const SizedBox(
                                              width: 14,
                                              height: 14,
                                              child: CircularProgressIndicator(
                                                strokeWidth: 1,
                                              ),
                                            );
                                          },
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                            return const Icon(
                                              Icons.location_on,
                                              size: 14,
                                              color: Color(0xFF6E6E6E),
                                            );
                                          },
                                    ),
                                    const SizedBox(width: 4),
                                    Flexible(
                                      child: Container(
                                        constraints: const BoxConstraints(
                                          maxWidth: 238,
                                        ),
                                        child: const Text(
                                          'Kartika Plaza Street, Tuban, Kuta, Badung, Bali',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF6E6E6E),
                                            fontFamily: 'Inter Tight',
                                            height: 1.5,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: GestureDetector(
                              child: const Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 20,
                              ),
                              onTap: () {},
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      // Review section
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Review',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontFamily: 'Inter Tight',
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: const Size(0, 0),
                            ),
                            child: const Text(
                              'See All',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF13BE57),
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Inter Tight',
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      // Rating row
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 20),
                          const SizedBox(width: 4),
                          const Text(
                            '4.7',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                              fontFamily: 'Inter Tight',
                            ),
                          ),
                          const Text(
                            '/5',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontFamily: 'Inter Tight',
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Fantastic',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontFamily: 'Inter Tight',
                                ),
                              ),
                              Text(
                                'From 12,245 Customers',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF6E6E6E),
                                  fontFamily: 'Inter Tight',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      // Review card with hotel room interior image
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey[200]!),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RichText(
                                  text: const TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '5.0',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                          fontFamily: 'Inter Tight',
                                        ),
                                      ),
                                      TextSpan(
                                        text: '/5',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF6E6E6E),
                                          fontFamily: 'Inter Tight',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Text(
                                  '03 March 2025',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF6E6E6E),
                                    fontFamily: 'Inter Tight',
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  clipBehavior: Clip.antiAlias,
                                  child: Image.network(
                                    'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/0b02b5b6faf6cd16a2756bda42fd03bb9c103f29%20%282%29-d3lpmuzWRtYSCGMOg1QZLaWesDitm5.png',
                                    fit: BoxFit.cover,
                                    loadingBuilder:
                                        (context, child, loadingProgress) {
                                          if (loadingProgress == null)
                                            return child;
                                          return Container(
                                            color: Colors.grey[200],
                                            child: const Center(
                                              child: SizedBox(
                                                width: 16,
                                                height: 16,
                                                child:
                                                    CircularProgressIndicator(
                                                      strokeWidth: 2,
                                                    ),
                                              ),
                                            ),
                                          );
                                        },
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        color: Colors.grey[200],
                                        child: const Icon(
                                          Icons.person,
                                          color: Colors.grey,
                                          size: 20,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Billy J. Armstrong',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                          fontFamily: 'Inter Tight',
                                        ),
                                      ),
                                      const SizedBox(height: 3),
                                      Container(
                                        constraints: const BoxConstraints(
                                          maxWidth: 287,
                                          maxHeight: 36,
                                        ),
                                        child: const Text(
                                          'It was amazing! Perfect beachfront location, friendly staff, and beautifully designed rooms. Can\'t wait to re...',
                                          style: TextStyle(
                                            fontSize: 9.7,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF6E6E6E),
                                            fontFamily: 'Inter Tight',
                                            height: 1.5,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      // Popular Facilities
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Popular Facilities',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontFamily: 'Inter Tight',
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: const Size(0, 0),
                            ),
                            child: const Text(
                              'See All',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF13BE57),
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Inter Tight',
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      // Facilities icons with proper custom images matching the screenshot
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildFacilityItemWithImage(
                            'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/sunny-224GF8DTBarHa0BVKhpE8RgVPGskM9.png',
                            Icons.wb_sunny_outlined,
                            'Sunny',
                          ),
                          _buildFacilityItemWithImage(
                            'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/free_wifi-mKsVOpEbkZMUvOtQ5SgLbtp0tGULJu.png',
                            Icons.wifi,
                            'Free Wifi',
                          ),
                          _buildFacilityItemWithImage(
                            'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/beach-LiUmGv8NYIIFY7tpcPwO59WQrKKwuP.png',
                            Icons.beach_access,
                            'Beach',
                          ),
                          _buildFacilityItemWithImage(
                            'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/garden-9Xo4ncL0oDIeySNdLzsXXpgxwYe0Su.png',
                            Icons.park_outlined,
                            'Garden',
                          ),
                          _buildFacilityItemWithImage(
                            'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/cafe-OzflxsRqK2jKaJLgy45HuZsl4uQm0K.png',
                            Icons.local_cafe_outlined,
                            'Cafe',
                          ),
                          _buildFacilityItemWithImage(
                            'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/restaurant-rN4rW0Oq1e84WzjouzP3JrhCZR7zjU.png',
                            Icons.restaurant_outlined,
                            'Restaurant',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
          // borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
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

  Widget _buildFacilityItem(IconData icon, String label) {
    return Column(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(icon, size: 20, color: Colors.grey[600]),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 10,
            color: Colors.black,
            fontFamily: 'Inter Tight',
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildFacilityItemWithImage(
    String imageUrl,
    IconData fallbackIcon,
    String label,
  ) {
    return Column(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Image.network(
              imageUrl,
              width: 20,
              height: 20,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return SizedBox(
                  width: 12,
                  height: 12,
                  child: CircularProgressIndicator(
                    strokeWidth: 1.5,
                    color: Colors.grey[600],
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return Icon(fallbackIcon, size: 20, color: Colors.grey[600]);
              },
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 10,
            color: Colors.black,
            fontFamily: 'Inter Tight',
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
