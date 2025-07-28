import 'package:drodify_project/7.10%20Delete%20Hotel.dart';
import 'package:drodify_project/7.7%20Collection-Filter.dart';
import 'package:flutter/material.dart';

class HotelListScreen extends StatefulWidget {
  const HotelListScreen({super.key});

  @override
  State<HotelListScreen> createState() => _HotelListScreenState();
}

class _HotelListScreenState extends State<HotelListScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<bool> selected = List.generate(6, (_) => false); // 6 hotels

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF1CB05F), Color(0xFF0A8F4B)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            // borderRadius: BorderRadius.vertical(
            //   bottom: Radius.circular(24),
            // ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                children: [
                  IconButton(
                    padding: EdgeInsets.only(left: 6),
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 18,
                    ),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.black.withOpacity(0.2),
                      shape: CircleBorder(),
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        "Hotels in Bali\n    14 Hotels",
                        style: TextStyle(
                          color: Colors.white,
                          //fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/icons/vector icon.png'),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.black.withOpacity(0.2),
                      shape: CircleBorder(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            buildSearchBar(),
            Expanded(child: _buildHotelGrid()),
            if (selected.where((e) => e).isNotEmpty) _buildBottomBar(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF19BF6E),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () {
            showDeleteHotelsBottomSheet(context);
          },
          child: const Text(
            'Delete 2 Hotels',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          // Search Field Container
          Expanded(
            child: Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Icon(Icons.search, color: Colors.grey),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: 'Search hotel',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(width: 12),

          // Filter Button
          GestureDetector(
            onTap: () {
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
                    child: FilterBottomSheet2(),
                  ),
                ),
              );
            },
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.asset('assets/icons/SlidersHorizontal.png'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHotelGrid() {
    final hotels = [
      {
        "name": "Emerald Beach Hotel",
        "location": "Kuta, Badung, Bali",
        "price": "\$100",
        "rating": "4.7",
        "image": "assets/images/emerald.png",
      },
      {
        "name": "Imperium Hotel",
        "location": "Sanur, Denpasar, Bali",
        "price": "\$150",
        "rating": "4.8",
        "image": "assets/images/imperium.png",
      },
      {
        "name": "Nexario Hotel",
        "location": "Abiansmail, Badung, Bali",
        "price": "\$166",
        "rating": "4.4",
        "image": "assets/images/Nexario.png",
      },
      {
        "name": "Santorio Hotel",
        "location": "Kelod, Gianyar, Bali",
        "price": "\$85",
        "rating": "4.5",
        "image": "assets/images/Santorio.png",
      },
      {
        "name": "Mezoni Hotel",
        "location": "Seminyak, Bali",
        "price": "\$120",
        "rating": "4.6",
        "image": "assets/images/Mezoni.png",
      },
      {
        "name": "Hominao Hotel",
        "location": "Ubud, Bali",
        "price": "\$99",
        "rating": "4.3",
        "image": "assets/images/Hominao.png",
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        itemCount: hotels.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 230,
          crossAxisSpacing: 16,
          mainAxisSpacing: 0,
        ),
        itemBuilder: (context, index) {
          final hotel = hotels[index];
          return Stack(
            children: [
              Container(
                height: 206,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(12),
                      ),
                      child: Image.asset(
                        hotel['image']!,
                        height: 120,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            hotel['name']!,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                size: 14,
                                color: Colors.grey,
                              ),
                              const SizedBox(width: 4),
                              Expanded(
                                child: Text(
                                  hotel['location']!,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              Text(
                                hotel['price']!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                " /night",
                                style: TextStyle(color: Colors.grey),
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.star,
                                size: 16,
                                color: Colors.amber,
                              ),
                              Text(
                                hotel['rating']!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildBottomBar() {
    int count = selected.where((e) => e).length;
    return Container(
      height: 56,
      width: double.infinity,
      color: const Color(0xFF06B782),
      alignment: Alignment.center,
      child: Text(
        'Delete $count Hotels',
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
    );
  }
}
