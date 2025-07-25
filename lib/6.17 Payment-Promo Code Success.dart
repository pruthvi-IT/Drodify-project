import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PaymentPromoDefault extends StatelessWidget {
  const PaymentPromoDefault({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Color(0xFF04682C),
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: const Color(0xFFF7F7F7),
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Color(0xFF04682C),
              statusBarIconBrightness: Brightness.light,
              statusBarBrightness: Brightness.dark,
              systemNavigationBarColor: Colors.white,
              systemNavigationBarIconBrightness: Brightness.dark,
            ),
          ),
        ),
        body: Column(
          children: [
            // Custom Header
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF04682C), Color(0xFF13BE57)],
                ),
              ),
              child: SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                      const Expanded(
                        child: Text(
                          'Booking & Payment',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Inter',
                            height: 1.375,
                            letterSpacing: 0,
                          ),
                        ),
                      ),
                      const SizedBox(width: 32),
                    ],
                  ),
                ),
              ),
            ),
            // Progress Steps
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
              child: Row(
                children: [
                  // Step 1 - Booking
                  _buildStep(1, 'Booking', false),
                  Expanded(child: _buildStepConnector(false)),
                  // Step 2 - Guest info
                  _buildStep(2, 'Guest info', false),
                  Expanded(child: _buildStepConnector(false)),
                  // Step 3 - Payment (Active)
                  _buildStep(3, 'Payment', true),
                ],
              ),
            ),
            // Content - Now fits content only
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(18, 14, 18, 0),
                child: Column(
                  children: [
                    // Main Container with All Information - Content sized
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: const Color(0xFFEEEEEE),
                          width: 1,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Hotel Section - More space for image
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Hotel Image - Increased height and width for full image display
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Container(
                                    width: 95,
                                    height: 110,
                                    child: Image.network(
                                      'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/7af741fee53843867cfa449e86b23dba80e5e051.png-8FQcXPU0WHsBDDFJ00NUTuRDTvGHE4.jpeg',
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                            return Container(
                                              color: Colors.grey[300],
                                              child: const Icon(
                                                Icons.hotel,
                                                size: 45,
                                                color: Colors.grey,
                                              ),
                                            );
                                          },
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                // Hotel Details - Expanded to fill remaining space
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Hotel Name
                                      const Text(
                                        'Emerald Beach Hotel',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Inter',
                                          height: 1.4,
                                          letterSpacing: 0,
                                          color: Color(0xFF1E1E1E),
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      // Location and Room Type
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.location_on_outlined,
                                            size: 15,
                                            color: Color(0xFF6E6E6E),
                                          ),
                                          const SizedBox(width: 3),
                                          Text(
                                            'Kuta, Badung, Bali',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Inter',
                                              height: 1.4,
                                              letterSpacing: 0,
                                              color: Color(0xFF6E6E6E),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 4),
                                      // Superior Double Room with custom bed icon
                                      Row(
                                        children: [
                                          Image.network(
                                            'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/Vector%20%282%29-xm24EuGlqvz28K4THjvmoafG52b5j8.png',
                                            width: 15,
                                            height: 15,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                                  return Icon(
                                                    Icons.bed,
                                                    size: 15,
                                                    color: Color(0xFF6E6E6E),
                                                  );
                                                },
                                          ),
                                          const SizedBox(width: 3),
                                          Text(
                                            'Superior Double Room',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Inter',
                                              height: 1.4,
                                              letterSpacing: 0,
                                              color: Color(0xFF6E6E6E),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 6),
                                      // Rating and Price Row
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.star,
                                                size: 15,
                                                color: Colors.amber,
                                              ),
                                              const SizedBox(width: 3),
                                              const Text(
                                                '4.5',
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: 'Inter',
                                                  height: 1.4,
                                                  letterSpacing: 0,
                                                  color: Colors.black87,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text.rich(
                                            TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: '\$100',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w700,
                                                    fontFamily: 'Inter',
                                                    height: 1.4,
                                                    letterSpacing: 0,
                                                    color: Colors.black87,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: ' /night',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Inter',
                                                    height: 1.4,
                                                    letterSpacing: 0,
                                                    color: Color(0xFF6E6E6E),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 16),

                            // Check-in/Check-out Section - Compact
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Check In Section
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Check In',
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Inter Tight',
                                          height: 1.4,
                                          letterSpacing: 0,
                                          color: Color(0xFF6E6E6E),
                                        ),
                                      ),
                                      const Text(
                                        'Tue, 11 Mar 2025',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Inter Tight',
                                          height: 1.4,
                                          letterSpacing: 0,
                                          color: Color(0xFF1E1E1E),
                                        ),
                                      ),
                                      const Text(
                                        '14:00',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Inter Tight',
                                          height: 1.4,
                                          letterSpacing: 0,
                                          color: Color(0xFF6E6E6E),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // Center Section with Icon and Nights
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    children: [
                                      // Moon/Stars Icon
                                      Image.network(
                                        'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/MoonStars-124eMAYOOAzv2OIsOEdMEhkHFCbaca.png',
                                        width: 18,
                                        height: 18,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                              return Container(
                                                width: 18,
                                                height: 18,
                                                decoration: BoxDecoration(
                                                  color: const Color(
                                                    0xFFEEEEEE,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                ),
                                                child: const Icon(
                                                  Icons.nights_stay,
                                                  size: 12,
                                                  color: Color(0xFF6E6E6E),
                                                ),
                                              );
                                            },
                                      ),
                                      const SizedBox(height: 3),
                                      // 3 Nights Text
                                      const Text(
                                        '3 Nights',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Inter Tight',
                                          height: 1.4,
                                          letterSpacing: 0,
                                          color: Color(0xFF6E6E6E),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // Check Out Section
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      const Text(
                                        'Check Out',
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Inter Tight',
                                          height: 1.4,
                                          letterSpacing: 0,
                                          color: Color(0xFF6E6E6E),
                                        ),
                                      ),
                                      const Text(
                                        'Fri, 14 Mar 2025',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Inter Tight',
                                          height: 1.4,
                                          letterSpacing: 0,
                                          color: Color(0xFF1E1E1E),
                                        ),
                                      ),
                                      const Text(
                                        '12:00',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Inter Tight',
                                          height: 1.4,
                                          letterSpacing: 0,
                                          color: Color(0xFF6E6E6E),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 10),
                            const Divider(color: Color(0xFFEEEEEE), height: 1),
                            const SizedBox(height: 10),

                            // Compact Info Sections
                            _buildInfoRow('Room & Guest', '1 Room | 2 Adults'),
                            const SizedBox(height: 8),
                            _buildInfoRow(
                              'Guest Info',
                              'Bruno Fernandes\nLuna Loveheart',
                            ),
                            const SizedBox(height: 8),
                            _buildInfoRow(
                              'Additional Request',
                              'Higher floor room\nBalcony with a view',
                            ),

                            const SizedBox(height: 10),
                            const Divider(color: Color(0xFFEEEEEE), height: 1),
                            const SizedBox(height: 10),

                            // Payment Options - Compact
                            _buildPaymentOption(
                              'Choose payment method',
                              'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/Vector-cjvJGj23v26VeQFCOdkGRQiguCZuZ0.png',
                            ),
                            const SizedBox(height: 8),
                            _buildPaymentOption(
                              'Add Voucher',
                              'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/Vector%20%281%29-IQDmppHMzCEcAxF755Z529BDhNCyNl.png',
                            ),

                            const SizedBox(height: 10),
                            const Divider(color: Color(0xFFEEEEEE), height: 1),
                            const SizedBox(height: 10),

                            // Amount Breakdown - Compact (without Total)
                            _buildAmountRow('Amount', '\$300.00'),
                            const SizedBox(height: 6),
                            _buildAmountRow('Tax', '\$3.00'),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            // Bottom Container with Total and Book Now Button
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x14949494),
                    offset: const Offset(0, -2),
                    blurRadius: 16,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: SafeArea(
                top: false,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    20,
                    18,
                    20,
                    MediaQuery.of(context).padding.bottom > 0 ? 10 : 18,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Total Section on the left
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'Total',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Inter Tight',
                              height: 1.4,
                              letterSpacing: 0,
                              color: Color(0xFF6E6E6E),
                            ),
                          ),
                          const Text(
                            '\$303.00',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Inter Tight',
                              height: 1.4,
                              letterSpacing: 0,
                              color: Color(0xFF1E1E1E),
                            ),
                          ),
                        ],
                      ),
                      // Book Now Button with exact specifications
                      Container(
                        width: 180.5,
                        height: 44,
                        child: ElevatedButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor:
                                  Colors.transparent, // transparent outside
                              builder: (_) => const promooverlaysheet(),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF13BE57),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.fromLTRB(32, 12, 32, 12),
                          ),
                          child: const Text(
                            'Book Now',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Inter',
                              height: 1.375,
                              letterSpacing: 0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStep(int stepNumber, String title, bool isActive) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: isActive ? const Color(0xFF13BE57) : const Color(0xFFB0B0B0),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              stepNumber.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(width: 6),
        Text(
          title,
          style: TextStyle(
            color: isActive ? const Color(0xFF13BE57) : const Color(0xFFB0B0B0),
            fontSize: 12,
            fontWeight: FontWeight.w400,
            fontFamily: 'Inter',
            height: 1.5,
            letterSpacing: 0,
          ),
        ),
      ],
    );
  }

  Widget _buildStepConnector(bool isCompleted) {
    return Container(
      height: 1,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFB0B0B0),
        borderRadius: BorderRadius.circular(0.5),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontFamily: 'Inter Tight',
            height: 1.4,
            letterSpacing: 0,
            color: Color(0xFF6E6E6E),
          ),
        ),
        Flexible(
          child: Text(
            value,
            textAlign: TextAlign.right,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: 'Inter Tight',
              height: 1.4,
              letterSpacing: 0,
              color: Color(0xFF1E1E1E),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentOption(String title, String iconUrl) {
    return Row(
      children: [
        Image.network(
          iconUrl,
          width: 22,
          height: 22,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                color: const Color(0xFF13BE57),
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Icon(
                Icons.credit_card,
                color: Colors.white,
                size: 14,
              ),
            );
          },
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontFamily: 'Inter Tight',
              height: 1.4,
              letterSpacing: 0,
              color: Color(0xFF6E6E6E),
            ),
          ),
        ),
        const Icon(Icons.arrow_forward_ios, size: 14, color: Color(0xFFB0B0B0)),
      ],
    );
  }

  Widget _buildAmountRow(String label, String amount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontFamily: 'Inter Tight',
            height: 1.4,
            letterSpacing: 0,
            color: Color(0xFF6E6E6E),
          ),
        ),
        Text(
          amount,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontFamily: 'Inter Tight',
            height: 1.4,
            letterSpacing: 0,
            color: Color(0xFF1E1E1E),
          ),
        ),
      ],
    );
  }
}

class promooverlaysheet extends StatelessWidget {
  const promooverlaysheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 376,
      width: 396,
      margin: EdgeInsets.only(bottom: 200),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(22),
            child: Image.asset(
              'assets/frames/Notification Illustration Light.png',
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Promo Code Applied',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          SizedBox(height: 8),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: TextStyle(fontSize: 14),
              children: [
                TextSpan(
                  text: 'your ',
                  style: TextStyle(color: Colors.grey),
                ),
                TextSpan(
                  text: 'Lucky Sale',
                  style: TextStyle(color: Colors.black),
                ),
                TextSpan(
                  text: ' promo code has been successfully applied.',

                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),

          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: TextStyle(fontSize: 14, color: Colors.grey),
              children: [
                TextSpan(text: 'Enjoy '),
                TextSpan(
                  text: '20% discount',
                  style: TextStyle(color: Colors.black),
                ),
                TextSpan(text: ' on your purchase!'),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  // Add filter logic here
                },
                child: Text(
                  'Continue',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
