import 'package:drodify_project/04HomeScreen/4.10%20notification-filter.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

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
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,

                        builder: (context) => FilterBottomSheetN(),
                      );
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.white.withOpacity(0.2),
                      radius: 20,
                      backgroundImage: AssetImage(
                        'assets/icons/SlidersHorizontal.png',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 16),
        children: [
          _SectionHeader("Today"),
          _NotificationTile(
            icon: Icons.mark_email_read_rounded,
            iconColor: Colors.green,
            title: "Your Booking Confirmed",
            subtitle:
                "Your stay at Emerald Beach Hotel is set for 11 - 14 March 2025. Enjoy your trip!",
            time: "09.30",
          ),
          _NotificationTile(
            icon: Icons.local_offer,
            iconColor: Colors.purple,
            title: "Exclusive Deal!",
            subtitle:
                "Enjoy 20% OFF on your next hotel booking! Book now and save big.",
            time: "09.30",
          ),
          _NotificationTile(
            icon: Icons.cancel,
            iconColor: Colors.red,
            title: "Your Booking Cancelled",
            subtitle:
                "Your booking at Imperium Hotel for 15 - 17 April 2025 has been canceled. Refund will be processed soon.",
            time: "09.30",
          ),
          _SectionHeader("Yesterday"),
          _NotificationTile(
            icon: Icons.refresh,
            iconColor: Colors.blue,
            title: "Reschedule Hotel Booking",
            subtitle:
                "Your booking at Imperium Hotel has been updated. Check your email for the latest details.",
            time: "09.30",
          ),
          _NotificationTile(
            icon: Icons.account_circle,
            iconColor: Colors.grey,
            title: "Account Update",
            subtitle:
                "Your account details have been updated successfully. If you didn't make this change, please contact support immediately.",
            time: "09.30",
          ),
          _NotificationTile(
            icon: Icons.check_circle,
            iconColor: Colors.green,
            title: "Your Booking Successful",
            subtitle:
                "Your stay at Imperium Hotel is set for 15 - 17 April 2025. Enjoy your trip!",
            time: "09.30",
          ),
          _SectionHeader("09 March 2025"),
          _NotificationTile(
            icon: Icons.feedback,
            iconColor: Colors.amber,
            title: "Share Your Experience!",
            subtitle:
                "How was your stay at Zamzam Hotel? Your feedback helps us improve and assist other travelers!",
            time: "09.30",
          ),
          _NotificationTile(
            icon: Icons.new_releases,
            iconColor: Colors.green,
            title: "New Member Special Deal!",
            subtitle:
                "Welcome to Hotel Travelio! Enjoy your special deal as a new member.",
            time: "09.30",
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String label;
  const _SectionHeader(this.label);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 18, 0, 8),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.grey[700],
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
    );
  }
}

class _NotificationTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final String time;

  const _NotificationTile({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: iconColor.withOpacity(0.12),
        child: Icon(icon, color: iconColor, size: 22),
      ),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(fontSize: 13, color: Colors.grey[700]),
      ),
      trailing: Text(
        time,
        style: TextStyle(fontSize: 13, color: Colors.grey[500]),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
      minLeadingWidth: 36,
    );
  }
}
