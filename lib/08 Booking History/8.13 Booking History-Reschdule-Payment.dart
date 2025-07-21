import 'package:flutter/material.dart';

class BookingHistoryPayment extends StatelessWidget {
  const BookingHistoryPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFF19BF6E),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Reschedule Booking',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
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
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Total Refund'),
                    const SizedBox(height: 4),
                    Text(
                      '\$80.80',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,

                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
              ),
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
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: const Size(200, 50),
                ),
                child: const Text(
                  'Book Now',
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
            Row(
              children: [
                _StepCircle(isActive: false, label: '1'),
                const SizedBox(width: 8),
                const Text('Booking', style: TextStyle(color: Colors.grey)),
                const SizedBox(width: 8),
                _StepperLine(),
                const SizedBox(width: 8),
                _StepCircle(isActive: false, label: '2'),
                const SizedBox(width: 8),
                const Text('Guest info', style: TextStyle(color: Colors.grey)),
                const SizedBox(width: 8),
                _StepperLine(),
                const SizedBox(width: 8),
                _StepCircle(isActive: true, label: '3'),
                const SizedBox(width: 8),
                const Text('Payment', style: TextStyle(color: Colors.green)),
              ],
            ),
            const SizedBox(height: 16),
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
                          'assets/images/image Payment.png',
                          width: 80,
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
                            Text('Kuta, Badung, Bali'),
                            Text('Superior Double Room'),
                            SizedBox(height: 4),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 14,
                                  color: Colors.orange,
                                ),
                                SizedBox(width: 4),
                                Text('4.5'),
                                SizedBox(width: 160),
                                Text(
                                  '\$100/night',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.credit_card, size: 20, color: Colors.blue),
                SizedBox(width: 8),
                Text('**** **** **** 8562'),
                SizedBox(width: 220),
                Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.percent, size: 20, color: Colors.green),
                //Image.asset('assets/frames/SealPercent.png'),
                const SizedBox(width: 8),
                const Text('Lucky Sale 20% Discount'),
                const SizedBox(width: 180),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.grey,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Divider(height: 20, color: Colors.grey.shade300),

            //const SizedBox(height: 20),

            // Price Summary
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

                  _PriceRow(
                    label: 'Refund Percentage',
                    value: '100%',
                    isBold: false,
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
