import 'package:flutter/material.dart';

class FilterBottomSheet extends StatefulWidget {
  @override
  _FilterBottomSheetState createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  String selectedTime = "Last 7 days";
  Map<String, bool> categories = {
    "Booking Updates": true,
    "Promotions & Discounts": true,
    "Payments & Refunds": false,
    "Hotel Recommendations": false,
    "Account & Security": true,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Container(
            padding: EdgeInsets.all(20),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Center(
                  child: Text(
                    "Filter",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.close,
                      size: 24,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Time Section
                Text(
                  "Time",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _buildTimeChip("Today"),
                    SizedBox(width: 4),
                    _buildTimeChip("Last 7 days"),
                    SizedBox(width: 4),
                    _buildTimeChip("This month"),
                    SizedBox(width: 4),
                    _buildTimeChip("Older"),
                  ],
                ),

                SizedBox(height: 24),

                // Category Section
                Text(
                  "Category",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 16),

                // Category Items
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: _buildCategoryItem("Booking Updates"),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: _buildCategoryItem("Promotions & Discounts"),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: _buildCategoryItem("Payments & Refunds"),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: _buildCategoryItem("Hotel Recommendations"),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: _buildCategoryItem("Account & Security"),
                        ),
                        Expanded(
                            child: SizedBox()), // Empty space for alignment
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 32),

                // Apply Button
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle apply filter
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF00C853),
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      "Apply",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeChip(String text) {
    bool isSelected = selectedTime == text;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTime = text;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF00C853) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? Color(0xFF00C853) : Colors.grey.shade300,
            width: 1,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: isSelected ? Colors.white : Colors.black54,
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryItem(String title) {
    bool isChecked = categories[title] ?? false;
    return GestureDetector(
      onTap: () {
        setState(() {
          categories[title] = !isChecked;
        });
      },
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: isChecked ? Color(0xFF00C853) : Colors.transparent,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: isChecked ? Color(0xFF00C853) : Colors.grey.shade400,
                width: 2,
              ),
            ),
            child: isChecked
                ? Icon(
                    Icons.check,
                    size: 14,
                    color: Colors.white,
                  )
                : null,
          ),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Usage example - how to show the modal
void showFilterModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (context) => FilterBottomSheet(),
  );
}
