import 'package:flutter/material.dart';

class EmptyNotification extends StatelessWidget {
  const EmptyNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                    icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        "Notification",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: CircleAvatar(
                      backgroundColor: Colors.white.withOpacity(0.2),
                      radius: 20,
                      backgroundImage:
                          AssetImage('assets/icons/Icon Button Light.png'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Placeholder for SVG or image
                  Image.asset(
                    'assets/icons/Group 1.png',
                    width: 140,
                    height: 140,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: 32),
                  Text(
                    "No Notifications Yet",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Text(
                      "You're all caught up! Check back later for updates,\n deals and import alerts.",
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24), // Space for bottom navigation bar
          ],
        ),
      ),
    );
  }
}
