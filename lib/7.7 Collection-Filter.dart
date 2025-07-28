import 'package:flutter/material.dart';

class FilterBottomSheet2 extends StatefulWidget {
  @override
  State<FilterBottomSheet2> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet2> {
  int selectedRating = 4;
  double minPrice = 20;
  double maxPrice = 150;
  List<String> facilities = [
    "Free Wifi",
    "Swimming Pool",
    "Breakfast",
    "Near Beach",
    "Refundable",
    "Garden",
    "Cafe",
    "Television",
  ];
  List<String> selectedFacilities = ["Free Wifi", "Breakfast", "Refundable"];
  bool showAllFacilities = true;
  String sortBy = "A - Z";

  @override
  Widget build(BuildContext context) {
    final visibleFacilities = showAllFacilities
        ? facilities
        : facilities.take(4).toList();

    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Stack(
              alignment: Alignment.center,
              children: [
                Center(
                  child: Text(
                    'Filter',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                Positioned(
                  right: 0,
                  child: IconButton(
                    icon: Icon(Icons.close, size: 24),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),

            // Rating Section
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Rating',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(5, (i) {
                int star = 5 - i;
                return GestureDetector(
                  onTap: () => setState(() => selectedRating = star),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: selectedRating == star
                          ? Colors.green.shade50
                          : Colors.transparent,
                      border: Border.all(
                        color: selectedRating == star
                            ? Colors.green
                            : Colors.grey.shade300,
                        width: selectedRating == star ? 2 : 1,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 22),
                        SizedBox(width: 2),
                        Text(
                          '$star',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height: 18),

            // Price Section
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Price',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            RangeSlider(
              values: RangeValues(minPrice, maxPrice),
              min: 0,
              max: 300,
              divisions: 30,
              activeColor: Colors.green,
              inactiveColor: Colors.grey.shade300,
              onChanged: (values) {
                setState(() {
                  minPrice = values.start;
                  maxPrice = values.end;
                });
              },
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Minimum',
                    style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Text(
                    'Maximum',
                    style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Text(
                      '\$${minPrice.toInt()}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Text(
                      '\$${maxPrice.toInt()}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 18),

            // Facilities Section
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Facilities',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              childAspectRatio: 4.5,
              mainAxisSpacing: 0,
              crossAxisSpacing: 0,
              children: visibleFacilities.map((facility) {
                return CheckboxListTile(
                  value: selectedFacilities.contains(facility),
                  onChanged: (val) {
                    setState(() {
                      if (val == true) {
                        selectedFacilities.add(facility);
                      } else {
                        selectedFacilities.remove(facility);
                      }
                    });
                  },
                  title: Text(facility, style: TextStyle(fontSize: 14)),
                  controlAffinity: ListTileControlAffinity.leading,
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  activeColor: Colors.green,
                );
              }).toList(),
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'See more',
                    style: TextStyle(color: Colors.green),
                  ),
                ),
                Image.asset('assets/icons/CaretDown.png'),
              ],
            ),
            SizedBox(height: 7),

            // Sort By Section
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Sort by',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildSortChip("A - Z"),
                  SizedBox(width: 7),
                  _buildSortChip("Z - A"),
                  SizedBox(width: 7),
                  _buildSortChip("Low - High"),
                  SizedBox(width: 7),
                  _buildSortChip("High - Low"),
                ],
              ),
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
                  padding: EdgeInsets.symmetric(vertical: 10),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Apply',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSortChip(String label) {
    final selected = sortBy == label;
    return ChoiceChip(
      showCheckmark: false,
      label: Text(label, style: TextStyle(color: Colors.black)),
      selected: selected,
      selectedColor: Colors.white,
      backgroundColor: Colors.white,
      shape: StadiumBorder(side: BorderSide(color: Colors.grey)),
      onSelected: (_) => setState(() => sortBy = label),
    );
  }
}
