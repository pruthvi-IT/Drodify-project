import 'package:flutter/material.dart';

class RescheduleConfirmationSheet extends StatelessWidget {
  const RescheduleConfirmationSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Image or illustration
          Image.asset(
            'assets/icons/Group 4.png', // Replace with your image path
            width: 100,
            height: 100,
          ),

          const SizedBox(height: 24),

          const Text(
            "Reschedule Confirmation",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 12),

          const Text(
            "You are about to reschedule your booking. Any price differences will be recalculated. Do you want to proceed?",
            //textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.black54),
          ),

          const SizedBox(height: 24),

          Row(
            children: [
              // Left button
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    // Handle reschedule logic
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.grey.shade400),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "Yes, Reschedule It",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),

              const SizedBox(width: 12),

              // Right button
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    // Handle simple confirmation logic
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text("Yes"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
