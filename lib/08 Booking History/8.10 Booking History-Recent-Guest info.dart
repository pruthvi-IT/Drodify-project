import 'package:flutter/material.dart';

class BookingHistoryRescheduleScreenGuestInfo extends StatefulWidget {
  const BookingHistoryRescheduleScreenGuestInfo({super.key});

  @override
  State<BookingHistoryRescheduleScreenGuestInfo> createState() =>
      _BookingHistoryRescheduleScreenGuestInfoState();
}

class _BookingHistoryRescheduleScreenGuestInfoState
    extends State<BookingHistoryRescheduleScreenGuestInfo> {
  bool bookForOthers = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFF19BF6E),
        elevation: 0,
        leading: IconButton(
          padding: EdgeInsets.only(left: 6),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white,size: 18,),
          style: IconButton.styleFrom(backgroundColor: Colors.green[600],shape: CircleBorder()),

          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Reschedule Booking',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            // Stepper
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  _StepCircle(isActive: false, label: '1'),
                  const SizedBox(width: 8),
                  const Text('Booking', style: TextStyle(color: Colors.grey)),
                  const SizedBox(width: 8),
                  _StepperLine(),
                  const SizedBox(width: 8),
                  _StepCircle(isActive: true, label: '2'),
                  const SizedBox(width: 8),
                  const Text(
                    'Guest info',
                    style: TextStyle(color: Colors.green),
                  ),
                  const SizedBox(width: 8),
                  _StepperLine(),
                  const SizedBox(width: 8),
                  _StepCircle(isActive: false, label: '3'),
                  const SizedBox(width: 8),
                  const Text('Payment', style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            _buildLabel('Name'),
            _buildTextField('Bruno Fernandes', Icons.person_outline),
            _buildLabel('Email'),
            _buildTextField('bruno.fernandes@gmail.com', Icons.email_outlined),
            _buildLabel('Phone Number'),
            _buildPhoneField(),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Book for others",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                Switch(
                  value: bookForOthers,
                  activeColor: Colors.green,
                  onChanged: (value) {
                    setState(() {
                      bookForOthers = value;
                    });
                  },
                ),
              ],
            ),

            if (bookForOthers) ...[
              _buildLabel("Name"),
              _buildTextField("Luna Loveheart", Icons.person_outline),
              _buildLabel("Email"),
              _buildTextField("lunaloveheart@gmail.com", Icons.email_outlined),
              _buildLabel("Phone Number"),
              _buildPhoneField(),
            ],
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: SizedBox(
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {},
            child: const Text(
              "Proceed to Payment",
              style: TextStyle(fontSize: 16, color: Colors.white),
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

Widget _buildTextField(String hint, IconData icon) {
  return TextField(
    decoration: InputDecoration(
      hintText: hint,
      prefixIcon: Icon(icon),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12),
    ),
  );
}

Widget _buildLabel(String label) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 6, top: 16),
    child: Text(
      label,
      style: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: Colors.black87,
      ),
    ),
  );
}

Widget _buildPhoneField() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey.shade400),
      borderRadius: BorderRadius.circular(8),
      color: Colors.white,
    ),
    child: Row(
      children: [
        Row(
          children: [
            Image.asset('assets/icons/Indonesia.png'),
            const SizedBox(width: 6),
            const Text("+62"),
            const Icon(Icons.keyboard_arrow_down, size: 18),
          ],
        ),
        const SizedBox(width: 8),
        Container(width: 1, height: 50, color: Colors.grey.shade400),
        const SizedBox(width: 8),
        const Expanded(
          child: TextField(
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Phone Number",
            ),
          ),
        ),
      ],
    ),
  );
}
