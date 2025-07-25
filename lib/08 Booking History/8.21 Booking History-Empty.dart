import 'package:flutter/material.dart';

class BookingHistoryEmpty extends StatelessWidget {
  const BookingHistoryEmpty({super.key});

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
            SizedBox(height: 120),
            Column(
              children: [
                Image.asset('assets/images/booking empty.png'),
                SizedBox(height: 12),
                Text(
                  'Oops! No Bookings Yet',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'You have no booking records. Book now and\n                    start your journey!',
                ),
              ],
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
          _SingleTab(text: 'Upcoming', selected: true),
          _SingleTab(text: 'Completed', selected: false),
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
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined, color: Colors.grey),
          label: "Home",
        ),
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
