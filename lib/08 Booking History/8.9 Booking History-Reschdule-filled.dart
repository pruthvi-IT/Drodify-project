import 'package:flutter/material.dart';

class BookingHistoryRescheduleScreenFilled extends StatelessWidget {
  const BookingHistoryRescheduleScreenFilled({super.key});

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
                  SizedBox(height: 16),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLabel('Date'),
                      SizedBox(height: 8),
                      _buildField(
                        icon: Icons.calendar_today,
                        title: '12 March 2025 - 14 March 2025',
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Room and Guest Info
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildLabel('Room'),
                            SizedBox(height: 8),
                            _buildField(
                              icon: Icons.meeting_room_outlined,
                              title: '1 Room',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildLabel('Guest'),
                            SizedBox(height: 8),
                            _buildField(
                              icon: Icons.person_outline,

                              title: '2 Adult, 1 Child',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Additional Request
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLabel('Additional Request'),
                      SizedBox(height: 8),

                      _buildField(
                        CustomLeading: Image.asset(
                          'assets/icons/ListChecks.png',
                        ),
                        title: 'Balcony with a view',
                        trailing: const Icon(Icons.add, size: 20),
                      ),
                    ],
                  ),
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

Widget _buildField({
  IconData? icon,
  required String title,
  Widget? CustomLeading,
  Widget? trailing,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey.shade300),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Row(
      children: [
        if (icon != null) Icon(icon, size: 24, color: Colors.grey),
        CustomLeading ?? const SizedBox.shrink(),
        if (CustomLeading != null) const SizedBox(width: 10),

        const SizedBox(width: 10),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(fontSize: 15, color: Colors.black87),
          ),
        ),
        if (trailing != null) trailing,
      ],
    ),
  );
}

Widget _buildLabel(String text) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 6),
    child: Text(
      text,
      style: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: Colors.black87,
      ),
    ),
  );
}
