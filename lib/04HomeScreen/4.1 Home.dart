import 'package:drodify_project/04HomeScreen/4.4%20select%20date.dart';
import 'package:drodify_project/04HomeScreen/4.5%20Add%20Guest.dart';
import 'package:drodify_project/04HomeScreen/4.9%20notification-default.dart';
import 'package:flutter/material.dart';
import '4.2 Search Location-default.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(),
      body: Stack(
        children: [
          Container(
            height: 260,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(color: Colors.green),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsets.only(left: 7)),
                CircleAvatar(
                  radius: 22,
                  backgroundImage: AssetImage('assets/images/image 1908.png'),
                  backgroundColor: Colors.white,
                ),
                SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi, Bruno!',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 1),
                    Text(
                      'Book Your Stay, Start Your Journey!',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.only(right: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NotificationScreen(),
                        ),
                      );
                    },
                    child: CircleAvatar(
                      radius: 22,
                      backgroundColor: const Color.fromARGB(255, 25, 116, 28),
                      child: Icon(
                        Icons.notifications_none,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 180),
                SearchCard(),
                SizedBox(height: 3),
                PromoBanner(),
                SizedBox(height: 3),
                RecommendationsSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SearchCard extends StatelessWidget {
  const SearchCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 270,
        margin: EdgeInsets.symmetric(horizontal: 16),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
        ),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (context) => Container(
                    height: MediaQuery.of(context).size.height * 0.8,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(26),
                      ),
                    ),
                    child: SearchLocationScreen(),
                  ),
                );
              },
              child: AbsorbPointer(
                child: CustomInput(
                  icon: Icons.search,
                  hint: "Search address, city, zip",
                ),
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(36),
                      ),
                    ),
                    child: CustomDatePickerDialog(),
                  ),
                );
              },
              child: AbsorbPointer(
                child: CustomInput(
                  icon: Icons.calendar_today,
                  hint: "Check In - Check Out",
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: CustomInput(
                    icon: Icons.home_work_outlined,
                    hint: "Type",
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) => Container(
                          height: MediaQuery.of(context).size.height * 0.45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(16),
                            ),
                          ),
                          child: AddGuestSection(),
                        ),
                      );
                    },
                    child: AbsorbPointer(
                      child: CustomInput(icon: Icons.person, hint: "1 Guest"),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1CB05F),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(16),
                ),
                child: Text(
                  'Search',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomInput extends StatelessWidget {
  final IconData icon;
  final String hint;
  const CustomInput({super.key, required this.icon, required this.hint});

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.black),
        hintText: hint,
        filled: true,
        fillColor: Colors.grey[100],
        contentPadding: EdgeInsets.symmetric(vertical: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class PromoBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 361,
      height: 125,
      child: Image.asset('assets/frames/frame2.png'),
    );
    // Container(
    //   margin: EdgeInsets.all(16),
    //   width: double.infinity,
    //   height: 160,
    //   decoration: BoxDecoration(
    //     gradient: LinearGradient(
    //       colors: [
    //         Colors.green.shade400,
    //         Colors.green.shade600,
    //         Colors.green.shade700,
    //       ],
    //       begin: Alignment.topLeft,
    //       end: Alignment.bottomRight,
    //     ),
    //     borderRadius: BorderRadius.circular(16),
    //     boxShadow: [
    //       BoxShadow(
    //         color: Colors.green.withOpacity(0.3),
    //         spreadRadius: 2,
    //         blurRadius: 10,
    //         offset: Offset(0, 5),
    //       ),
    //     ],
    //   ),
    //   child: Stack(
    //     children: [
    //       // Background Pattern/Image Effect
    //       Positioned.fill(
    //         left: 290,
    //         child: ClipRRect(
    //           borderRadius: BorderRadiusGeometry.circular(16),
    //           child: Container(
    //             width: double.infinity,
    //             decoration: BoxDecoration(
    //               image: DecorationImage(
    //                 image: AssetImage('assets/images/hotelimage.jpg'),
    //                 fit: BoxFit.fill,
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),

    //       // Content
    //       Padding(
    //         padding: EdgeInsets.all(20),
    //         child: Row(
    //           children: [
    //             // Left Content
    //             Expanded(
    //               flex: 2,
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //                   Text(
    //                     'March Super Sale!!',
    //                     style: TextStyle(
    //                       color: Colors.white,
    //                       fontSize: 22,
    //                       fontWeight: FontWeight.bold,
    //                       shadows: [
    //                         Shadow(
    //                           offset: Offset(1, 1),
    //                           blurRadius: 3,
    //                           color: Colors.black26,
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                   SizedBox(height: 8),
    //                   Text(
    //                     'Enjoy exclusive discounts on hotel\nbookings more affordable.',
    //                     style: TextStyle(
    //                       color: Colors.white,
    //                       fontSize: 14,
    //                       height: 1.4,
    //                       shadows: [
    //                         Shadow(
    //                           offset: Offset(1, 1),
    //                           blurRadius: 2,
    //                           color: Colors.black26,
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                   SizedBox(height: 12),
    //                   GestureDetector(
    //                     onTap: () {
    //                       ScaffoldMessenger.of(context).showSnackBar(
    //                         SnackBar(content: Text('Book now clicked!')),
    //                       );
    //                     },
    //                     child: Text(
    //                       'Book now!',
    //                       style: TextStyle(
    //                         color: Colors.yellow.shade300,
    //                         fontSize: 16,
    //                         fontWeight: FontWeight.bold,
    //                         decoration: TextDecoration.underline,
    //                         decorationColor: Colors.yellow.shade300,
    //                       ),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),

    //             // Right Content - Discount Badge
    //             Expanded(
    //               flex: 1,
    //               child: Container(
    //                 alignment: Alignment.center,
    //                 child: Container(
    //                   width: 100,
    //                   height: 100,
    //                   decoration: BoxDecoration(
    //                     color: Colors.green.shade600,
    //                     shape: BoxShape.circle,
    //                     border: Border.all(color: Colors.white, width: 3),
    //                     boxShadow: [
    //                       BoxShadow(
    //                         color: Colors.black26,
    //                         spreadRadius: 2,
    //                         blurRadius: 8,
    //                         offset: Offset(0, 3),
    //                       ),
    //                     ],
    //                   ),
    //                   child: Column(
    //                     mainAxisAlignment: MainAxisAlignment.center,
    //                     children: [
    //                       Text(
    //                         'SAVE UP TO',
    //                         style: TextStyle(
    //                           color: Colors.white,
    //                           fontSize: 10,
    //                           fontWeight: FontWeight.w600,
    //                         ),
    //                       ),
    //                       Text(
    //                         '50%',
    //                         style: TextStyle(
    //                           color: Colors.white,
    //                           fontSize: 24,
    //                           fontWeight: FontWeight.bold,
    //                         ),
    //                       ),
    //                       Text(
    //                         'OFF',
    //                         style: TextStyle(
    //                           color: Colors.white,
    //                           fontSize: 12,
    //                           fontWeight: FontWeight.w600,
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}

class RecommendationsSection extends StatelessWidget {
  const RecommendationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Text(
                "Recommendations Hotel",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Spacer(),
              Text(
                "See more",
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 12),
        SizedBox(
          height: 210,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16),
            children: [
              HotelCard(
                image: 'assets/images/image2.png',
                name: 'Emerald Beach Hotel',
                location: 'Kuta, Badung, Bali',
                price: '\$100',
                rating: 4.7,
                isFavorite: true,
              ),
              SizedBox(width: 12),
              HotelCard(
                image: 'assets/images/image.png',
                name: 'Parkroyal Hotel',
                location: 'Kuta, Badung, Bali',
                price: '\$150',
                rating: 4.5,
                isFavorite: false,
              ),
              // Add more HotelCard widgets as needed
            ],
          ),
        ),
      ],
    );
  }
}

class HotelCard extends StatelessWidget {
  final String image;
  final String name;
  final String location;
  final String price;
  final double rating;
  final bool isFavorite;

  const HotelCard({
    super.key,
    required this.image,
    required this.name,
    required this.location,
    required this.price,
    required this.rating,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 180,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.asset(
                  image,
                  height: 100,
                  width: 160,
                  fit: BoxFit.cover,
                ),
              ),
              // Positioned(
              //   bottom: 8,
              //   right: 8,
              //   child: Icon(
              //     isFavorite ? Icons.favorite : Icons.favorite_border,
              //     color: isFavorite ? Colors.red : Colors.white,
              //     size: 22,
              //   ),
              // ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.grey, size: 14),
                    SizedBox(width: 2),
                    Expanded(
                      child: Text(
                        location,
                        style: TextStyle(fontSize: 11, color: Colors.grey),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Text(price, style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(
                      " /night",
                      style: TextStyle(fontSize: 11, color: Colors.grey),
                    ),
                    Spacer(),
                    Icon(Icons.star, color: Colors.amber, size: 16),
                    Text(rating.toString(), style: TextStyle(fontSize: 12)),
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

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int>? onTap;

  const CustomBottomNavBar({this.currentIndex = 0, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap ?? (index) {},
      showUnselectedLabels: true,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          label: "Favorite",
        ),
        BottomNavigationBarItem(
          icon: Center(
            child: Align(
              alignment: Alignment.center,
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(8),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [Colors.green, Colors.green.shade700],
                  ),
                ),
                child: Image.asset(
                  'assets/icons/Vector.png',
                  color: Colors.white,
                  width: 24,
                  height: 24,
                ),
              ),
            ),
          ),
          label: "",
        ),
        BottomNavigationBarItem(icon: Icon(Icons.book), label: "Bookings"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ],
    );
  }
}
