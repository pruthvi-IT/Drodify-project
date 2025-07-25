import 'package:flutter/material.dart';

void showFilterBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) {
      int selectedTimeIndex = 1;
      int selectedRating = 4;

      return StatefulBuilder(
        builder: (context, setState) {
          List<String> timeOptions = [
            'Today',
            'Last 7 days',
            'This month',
            'Older',
          ];

          return Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Spacer(),
                    Text(
                      'Filter',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(Icons.close),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                // Time Section
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Time',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(timeOptions.length, (index) {
                    return ChoiceChip(
                      label: Text(timeOptions[index]),
                      showCheckmark: false,
                      selected: selectedTimeIndex == index,
                      selectedColor: Colors.green.withOpacity(0.2),
                      shape: StadiumBorder(
                        side: BorderSide(
                          color: selectedTimeIndex == index
                              ? Colors.green
                              : Colors.grey.shade300,
                        ),
                      ),
                      onSelected: (val) {
                        setState(() {
                          selectedTimeIndex = index;
                        });
                      },
                      labelStyle: TextStyle(color: Colors.black),
                    );
                  }),
                ),

                SizedBox(height: 20),

                // Rating Section
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Rating',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(5, (index) {
                    int ratingValue = 5 - index;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedRating = ratingValue;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: selectedRating == ratingValue
                                ? Colors.green
                                : Colors.grey.shade300,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 20),
                            SizedBox(width: 4),
                            Text('$ratingValue'),
                          ],
                        ),
                      ),
                    );
                  }),
                ),

                SizedBox(height: 24),

                // Apply Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      // Add filter logic here
                    },
                    child: Text(
                      'Apply',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
          );
        },
      );
    },
  );
}
