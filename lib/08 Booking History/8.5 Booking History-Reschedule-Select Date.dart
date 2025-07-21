import 'package:flutter/material.dart';

class CustomDatePickerDialog2 extends StatefulWidget {
  const CustomDatePickerDialog2({Key? key}) : super(key: key);

  @override
  _CustomDatePickerDialogState createState() => _CustomDatePickerDialogState();
}

class _CustomDatePickerDialogState extends State<CustomDatePickerDialog2> {
  DateTime currentMonth = DateTime(2025, 3, 1);
  DateTime? checkInDate;
  DateTime? checkOutDate;
  bool isSelectingCheckIn = true;

  final List<String> weekDays = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
  final List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  @override
  void initState() {
    super.initState();
    checkInDate = DateTime(2025, 3, 11);
    checkOutDate = DateTime(2025, 3, 14);
  }

  void _selectDate(DateTime date) {
    setState(() {
      if (isSelectingCheckIn) {
        checkInDate = date;
        if (checkOutDate != null && checkOutDate!.isBefore(date)) {
          checkOutDate = null;
        }
        isSelectingCheckIn = false;
      } else {
        if (checkInDate != null && date.isAfter(checkInDate!)) {
          checkOutDate = date;
        } else {
          checkInDate = date;
          checkOutDate = null;
          isSelectingCheckIn = false;
        }
      }
    });
  }

  void _previousMonth() {
    setState(() {
      currentMonth = DateTime(currentMonth.year, currentMonth.month - 1);
    });
  }

  void _nextMonth() {
    setState(() {
      currentMonth = DateTime(currentMonth.year, currentMonth.month + 1);
    });
  }

  List<DateTime> _getDaysInMonth() {
    final firstDay = DateTime(currentMonth.year, currentMonth.month, 1);
    final lastDay = DateTime(currentMonth.year, currentMonth.month + 1, 0);

    List<DateTime> days = [];

    // Add previous month's trailing days
    final firstWeekday = firstDay.weekday % 7;
    for (int i = firstWeekday - 1; i >= 0; i--) {
      days.add(firstDay.subtract(Duration(days: i + 1)));
    }

    // Add current month's days
    for (int day = 1; day <= lastDay.day; day++) {
      days.add(DateTime(currentMonth.year, currentMonth.month, day));
    }

    // Add next month's leading days
    while (days.length < 42) {
      days.add(lastDay.add(Duration(days: days.length - lastDay.day)));
    }

    return days;
  }

  bool _isInRange(DateTime date) {
    if (checkInDate != null && checkOutDate != null) {
      return date.isAfter(checkInDate!) && date.isBefore(checkOutDate!);
    }
    return false;
  }

  bool _isSelectedDate(DateTime date) {
    return (checkInDate != null && _isSameDay(date, checkInDate!)) ||
        (checkOutDate != null && _isSameDay(date, checkOutDate!));
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  bool _isCurrentMonth(DateTime date) {
    return date.month == currentMonth.month && date.year == currentMonth.year;
  }

  String _formatDate(DateTime? date) {
    if (date == null) return '';
    return '${date.day} ${months[date.month - 1]} ${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey.shade100)),
              ),
              child: Container(
                width: double.infinity,
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          'Select Date',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade800,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        Icons.close,
                        color: Colors.grey.shade400,
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Divider(thickness: 1, color: Colors.white), // Month navigation
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: _previousMonth,
                  child: const Icon(Icons.chevron_left, size: 24),
                ),
                Text(
                  '${months[currentMonth.month - 1]} ${currentMonth.year}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                GestureDetector(
                  onTap: _nextMonth,
                  child: const Icon(Icons.chevron_right, size: 24),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Week days header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: weekDays
                  .map(
                    (day) => Container(
                      width: 32,
                      height: 32,
                      alignment: Alignment.center,
                      child: Text(
                        day,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 8),

            // Calendar grid
            Container(
              height: 320,
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                  childAspectRatio: 1,
                ),
                itemCount: 42,
                itemBuilder: (context, index) {
                  final days = _getDaysInMonth();
                  final date = days[index];
                  final isCurrentMonth = _isCurrentMonth(date);
                  final isCheckIn =
                      checkInDate != null && _isSameDay(date, checkInDate!);
                  final isCheckOut =
                      checkOutDate != null && _isSameDay(date, checkOutDate!);
                  final isInRange = _isInRange(date);

                  // For continuous border effect
                  BorderRadius? borderRadius;
                  if (isCheckIn && isCheckOut) {
                    borderRadius = BorderRadius.circular(8);
                  } else if (isCheckIn) {
                    borderRadius = const BorderRadius.horizontal(
                      left: Radius.circular(8),
                    );
                  } else if (isCheckOut) {
                    borderRadius = const BorderRadius.horizontal(
                      right: Radius.circular(8),
                    );
                  } else {
                    borderRadius = BorderRadius.zero;
                  }

                  Color greenColor = const Color(0xFF00C853);

                  Color? bgColor;
                  if (isCheckIn || isCheckOut) {
                    bgColor = greenColor;
                  } else {
                    bgColor = Colors.transparent;
                  }

                  // Build border for continuous effect
                  BorderSide green = BorderSide(color: greenColor, width: 2);
                  BorderSide none = BorderSide.none;
                  BoxBorder? border;

                  if (isCheckIn &&
                      checkOutDate != null &&
                      checkInDate != checkOutDate) {
                    // Check-in: green border on right, top, bottom
                    border = Border(
                      left: none,
                      right: green,
                      top: green,
                      bottom: green,
                    );
                  } else if (isCheckOut &&
                      checkInDate != null &&
                      checkInDate != checkOutDate) {
                    // Check-out: green border on left, top, bottom
                    border = Border(
                      left: green,
                      right: none,
                      top: green,
                      bottom: green,
                    );
                  } else if (isInRange) {
                    // In-range: green border top/bottom only, no left/right
                    border = Border(
                      left: none,
                      right: none,
                      top: green,
                      bottom: green,
                    );
                  } else {
                    border = null;
                  }

                  Color textColor;
                  if (isCheckIn || isCheckOut) {
                    textColor = Colors.white;
                  } else if (isInRange) {
                    textColor = greenColor;
                  } else if (isCurrentMonth) {
                    textColor = Colors.black;
                  } else {
                    textColor = Colors.grey[400]!;
                  }

                  return GestureDetector(
                    onTap: isCurrentMonth ? () => _selectDate(date) : null,
                    child: Container(
                      margin: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: borderRadius,
                        border: border,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '${date.day}',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: textColor,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Check-in and Check-out display
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Check in',
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[300]!),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.calendar_today,
                              size: 16,
                              color: Colors.grey[600],
                            ),
                            const SizedBox(width: 8),
                            Text(
                              _formatDate(checkInDate),
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12, height: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Check out',
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[300]!),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.calendar_today,
                              size: 16,
                              color: Colors.grey[600],
                            ),
                            const SizedBox(width: 8),
                            Text(
                              _formatDate(checkOutDate),
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Confirm button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle confirm action
                  Navigator.of(
                    context,
                  ).pop({'checkIn': checkInDate, 'checkOut': checkOutDate});
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Confirm',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
