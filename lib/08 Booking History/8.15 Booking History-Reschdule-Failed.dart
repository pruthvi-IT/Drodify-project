import 'package:flutter/material.dart';

class RescheduleFailedScreen extends StatelessWidget {
  const RescheduleFailedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        leading: IconButton(
          padding: EdgeInsets.only(left: 8),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
          style: IconButton.styleFrom(
            backgroundColor: Colors.black.withOpacity(0.2),
            shape: CircleBorder(),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Reschedule Booking',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),

      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey, width: 0.2)),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to E-Receipt
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "My Booking",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(width: 18),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to E-Receipt
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "Try Again",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 200),
        child: Column(
          children: [
            const SizedBox(height: 30),

            Image.asset(
              'assets/frames/reschdule failed.png',
              width: 120,
              height: 120,
              fit: BoxFit.contain,
            ),

            const SizedBox(height: 40),

            const Text(
              "Reschedule Successful!",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 16),

            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: const TextStyle(fontSize: 14, color: Colors.black87),
                children: const [
                  TextSpan(text: "An error occured while rescheduling. "),
                  TextSpan(
                    text:
                        "No Changes have been made,and your payment remains unaffected.",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: "Please try again  "),
                  TextSpan(text: "or contact support for assistance."),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
