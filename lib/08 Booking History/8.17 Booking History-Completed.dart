import 'package:flutter/material.dart';

class BookingHistoryScreenCompleted extends StatelessWidget {
  const BookingHistoryScreenCompleted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),

      bottomNavigationBar: CustomBottomNavBar(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90),
        child: AppBar(
          elevation: 0,
          backgroundColor: null,
          flexibleSpace: Container(
            height: 120,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color.fromARGB(255, 92, 195, 138), Color(0xFF0A8F4B)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(
              top: 18.0,
            ), // Move text and icon down
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My Booking History',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.add, color: Colors.white, size: 18),
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.black.withOpacity(0.2),
                    shape: CircleBorder(),
                  ),
                ),
              ],
            ),
          ),
          centerTitle: false,
        ),
      ),

      body: SafeArea(
        child: Column(
          children: [
            // Remove the header Container here
            // Tabs
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 16,
              ),
              child: TabButtons(), // Use the new TabButtons widget
            ),
            // Booking cards
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _BookingCard(
                    image: 'assets/images/Nexario Hotel.png',
                    hotelName: 'Nexario Hotel',
                    location: 'Abiansemal, Badung,Bali',
                    room: 'single Suite Room',
                    checkIn: 'Fri, 28 Feb 2025',
                    checkInTime: '13:00',
                    checkOut: 'sat, 01 Mar 2025',
                    checkOutTime: '12:00',
                    nights: '1 Nights',
                    total: '\$132.40',
                  ),
                  SizedBox(height: 16),
                  _BookingCard(
                    image: 'assets/images/Homingo Hotel.png',
                    hotelName: 'Homingo Hotel',
                    location: 'serangan, Denpasar, Bali',
                    room: 'Double Deluxe Room',
                    checkIn: 'Fri, 14 Feb 2025',
                    checkInTime: '14:00',
                    checkOut: 'sun, 16 Feb 2025',
                    checkOutTime: '12:00',
                    nights: '2 Night',
                    total: '\$148.20',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TabButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _SingleTab(text: 'Upcoming', selected: false),
          _SingleTab(text: 'Completed', selected: true),
          _SingleTab(text: 'Canceled', selected: false),
        ],
      ),
    );
  }
}

class _SingleTab extends StatelessWidget {
  final String text;
  final bool selected;
  const _SingleTab({required this.text, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        decoration: BoxDecoration(
          color: selected ? Color(0xFF23C465) : Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: selected ? Colors.white : Colors.black87,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

class _BookingCard extends StatelessWidget {
  final String image; // Only for local asset image
  final String hotelName;
  final String location;
  final String room;
  final String checkIn;
  final String checkInTime;
  final String checkOut;
  final String checkOutTime;
  final String nights;
  final String total;

  const _BookingCard({
    required this.image,
    required this.hotelName,
    required this.location,
    required this.room,
    required this.checkIn,
    required this.checkInTime,
    required this.checkOut,
    required this.checkOutTime,
    required this.nights,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hotel image and info
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    image,
                    width: 100, // changed from 70 to 100
                    height: 64, // changed from 70 to 64
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        hotelName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.location_on, size: 14, color: Colors.grey),
                          SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              location,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[700],
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 2),
                      Row(
                        children: [
                          Icon(
                            Icons.meeting_room_outlined,
                            size: 14,
                            color: Colors.grey,
                          ),
                          SizedBox(width: 4),
                          Text(
                            room,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            // Check-in/out and nights
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Check in',
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                    Text(
                      checkIn,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      checkInTime,
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.nights_stay, color: Colors.green, size: 20),
                    Text(
                      nights,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Check out',
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                    Text(
                      checkOut,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      checkOutTime,
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 12),
            // Total and buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: TextStyle(fontSize: 13, color: Colors.grey[700]),
                ),
                Text(
                  total,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.black87,
                      side: BorderSide(color: Colors.grey.shade300),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 0,
                      ), // Reduce padding
                      minimumSize: Size(0, 40), // Set a fixed height
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'Re-Book',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),

                SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF23C465),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text('Add Review'),
                  ),
                ),
              ],
            ),
          ],
        ),
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

      ///selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
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
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/icons/Ticket.png',
            color: Color(0xFF23C465),
            width: 24,
            height: 24,
          ),
          label: 'Bookings',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_2_outlined),
          label: "Profile",
        ),
      ],
    );
  }
}
