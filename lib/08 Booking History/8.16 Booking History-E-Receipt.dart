import 'package:flutter/material.dart';

class BookingHistoryEReceipt extends StatelessWidget {
  BookingHistoryEReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          backgroundColor: const Color.fromARGB(255, 7, 199, 106),
          elevation: 0,
          leading: IconButton(
            padding: const EdgeInsets.only(left: 6),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 18,
            ),
            style: IconButton.styleFrom(
              backgroundColor: Colors.black.withOpacity(0.2),
              shape: const CircleBorder(),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text(
            'E-Receipt',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: const Icon(Icons.share, color: Colors.white, size: 18),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.black.withOpacity(0.2),
                  shape: const CircleBorder(),
                ),
                onPressed: () {},
              ),
            ),
          ],
          centerTitle: true,
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Colors.grey, width: 0.2)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  // Navigate to My Booking
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    // side: const BorderSide(color: Colors.black),
                  ),
                  minimumSize: const Size(170, 50),
                ),
                child: const Text(
                  "My Booking",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(width: 18),
              ElevatedButton(
                onPressed: () {
                  // Handle book now
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  minimumSize: const Size(170, 50),
                ),
                child: const Text(
                  'Download',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Stepper
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Hotel Image + Info
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/images/himage.png',
                          width: 100,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Emerald Beach Hotel',
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
                                  size: 16,
                                  color: Colors.grey,
                                ),
                                Text('Kuta, Badung, Bali'),
                              ],
                            ),
                            SizedBox(height: 4),
                            Row(
                              children: [
                                Icon(
                                  Icons.meeting_room_outlined,
                                  size: 16,
                                  color: Colors.grey,
                                ),
                                Text('Superior Double Room'),
                              ],
                            ),
                            SizedBox(height: 4),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Dates
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const _DateColumn(
                            title: 'Check in',
                            date: 'Wed, 12 Mar 2025',
                          ),
                          const SizedBox(height: 4),
                          Text('14:00'),
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset('assets/icons/night icon.png'),
                          const Text('2 Nights'),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const _DateColumn(
                            title: 'Check out',
                            date: 'Fri, 14 Mar 2025',
                          ),
                          const SizedBox(height: 4),
                          Text('12:00'),
                        ],
                      ),
                    ],
                  ),

                  const Divider(height: 24),

                  _DetailRow('Room & Guest', '1 Room | 2 Adults, 1 Child'),
                  _DetailRow('Guest info', 'Bruno Fernandes'),
                  _DetailRow('Additional Request', 'Balcony with a view'),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Payment Info
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Column(
                children: [
                  _PriceRow(label: 'Current Amount', value: '\$200.00'),
                  _PriceRow(label: 'Tax', value: '\$2.00'),
                  _PriceRow(label: 'Discount 20%', value: '-\$40.40'),
                  _PriceRow(label: 'Previously Paid', value: '-\$242.40'),

                  _PriceRow(label: 'Refund Percentage', value: '100%'),
                  _PriceRow(label: 'Refund Amount', value: '\$80.80'),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              child: Center(child: Image.asset('assets/images/QrCode.png')),
            ),
          ],
        ),
      ),
    );
  }
}

class _DateColumn extends StatelessWidget {
  final String title;
  final String date;

  const _DateColumn({required this.title, required this.date});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 12, color: Colors.black54),
        ),
        const SizedBox(height: 4),
        Text(date, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const _DetailRow(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(color: Colors.black54, fontSize: 13),
            ),
          ),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}

class _PriceRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isBold;

  const _PriceRow({
    required this.label,
    required this.value,
    this.isBold = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(child: Text(label)),
          Text(
            value,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
