import 'package:drodify_project/08%20Booking%20History/8.5%20Booking%20History-Reschedule-Select%20Date.dart';
import 'package:drodify_project/08%20Booking%20History/8.6%20Booking%20History-Reschdule-AddRoom.dart';
import 'package:drodify_project/08%20Booking%20History/8.7%20Booking%20History-Reschedule-Add%20guest.dart';
import 'package:drodify_project/08%20Booking%20History/8.8%20Booking%20History%20-Reschdule-Additional%20Request.dart';
import 'package:flutter/material.dart';

class BookingHistoryRescheduleScreen extends StatelessWidget {
  const BookingHistoryRescheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFF19BF6E),
        elevation: 0,
        leading: IconButton(
          padding: EdgeInsets.only(left: 6),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 18),
          style: IconButton.styleFrom(
            backgroundColor: Colors.black.withOpacity(0.2),
            shape: CircleBorder(),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Reschedule Booking',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Stepper
          Container(
            // color: const Color(0xFF19BF6E),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Row(
              children: [
                _StepCircle(isActive: true, label: '1'),
                const SizedBox(width: 8),
                const Text('Booking', style: TextStyle(color: Colors.green)),
                const SizedBox(width: 8),
                _StepperLine(),
                const SizedBox(width: 8),
                _StepCircle(isActive: false, label: '2'),
                const SizedBox(width: 8),
                const Text('Guest info', style: TextStyle(color: Colors.grey)),
                const SizedBox(width: 8),
                _StepperLine(),
                const SizedBox(width: 8),
                _StepCircle(isActive: false, label: '3'),
                const SizedBox(width: 8),
                const Text('Payment', style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  // Hotel Card
                  Container(
                    //  margin: EdgeInsets.all(8.0),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey.shade200),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(14.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                'assets/images/himage.png',
                                width: 100,
                                height: 64,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Emerald Beach Hotel",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        size: 14,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(width: 4),
                                      Expanded(
                                        child: Text(
                                          "Kuta, Badung, Bali",
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
                                        "Superior Double Room",
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Check in',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                Text(
                                  'Tue, 11 Mar 2025',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '14:00',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset('assets/icons/night icon.png'),
                                Text(
                                  '3 Nights',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[600],
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
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                Text(
                                  'Fri, 14 Mar 2025',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '12:00',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey[700],
                              ),
                            ),
                            Text(
                              '\$242.40',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Text(
                          "This hotel offers a 100% refund for cancelation and rescheduling.",
                          style: TextStyle(color: Colors.green, fontSize: 12),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Date Field
                  _Label('Date'),
                  _InputField(
                    hint: 'Select date',
                    icon: Icons.calendar_today,
                    onTap: () {
                      // Show date picker
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
                          child: CustomDatePickerDialog2(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  // Room & Guest Fields
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _Label('Room'),
                            _InputField(
                              hint: 'Add room',
                              icon: Icons.meeting_room,
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  builder: (context) => const AddRoomSheet(),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _Label('Guest'),
                            _InputField(
                              hint: 'Add guest',
                              icon: Icons.person_outline,
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  builder: (context) => AddGuestSectionH(),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Additional Request
                  _Label('Additional Request'),
                  _InputField(
                    hint: 'Add request',
                    icon: Icons.list_alt,
                    image: Image.asset('assets/icons/ListChecks.png'),
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) => const AdditionalRequestsSheet(),
                      );
                    },
                    trailing: Icon(
                      Icons.add,
                      color: Colors.black38,
                    ), // <-- Add icon at right
                  ),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          height: 44,
          margin: EdgeInsets.all(8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF19BF6E),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {},
            child: const Text(
              'Reschedule Booking',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Helper widgets

class _StepCircle extends StatelessWidget {
  final bool isActive;
  final String label;
  const _StepCircle({required this.isActive, required this.label});
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 12,
      backgroundColor: isActive ? Colors.green : Colors.grey.shade400,
      child: Text(
        label,
        style: TextStyle(
          color: isActive ? Colors.white : Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
      ),
    );
  }
}

class _StepperLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(width: 28, height: 2, color: Colors.grey);
  }
}

class _BookingInfoColumn extends StatelessWidget {
  final String label;
  final String value;
  final IconData? icon;
  const _BookingInfoColumn({
    required this.label,
    required this.value,
    this.icon,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (icon != null) Icon(icon, color: Color(0xFF19BF6E), size: 18),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.black)),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _Label extends StatelessWidget {
  final String text;
  const _Label(this.text);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6, left: 0), // Align to start
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          textAlign: TextAlign.start,
        ),
      ),
    );
  }
}

class _InputField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final VoidCallback onTap;
  final Image? image;
  final Widget? trailing; // <-- Add this

  const _InputField({
    required this.hint,
    required this.icon,
    required this.onTap,
    this.image,
    this.trailing, // <-- Add this
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 44,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xFFE0E0E0)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            // Use image if provided, else use icon
            image != null
                ? SizedBox(width: 20, height: 20, child: image)
                : Icon(icon, color: Colors.black38, size: 20),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                hint,
                style: const TextStyle(color: Colors.black38, fontSize: 15),
              ),
            ),
            if (trailing != null) ...[const SizedBox(width: 10), trailing!],
          ],
        ),
      ),
    );
  }
}
