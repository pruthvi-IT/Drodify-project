import 'package:drodify_project/04HomeScreen/4.1%20Home.dart';
import 'package:flutter/material.dart';

class SearchResultEmpty extends StatelessWidget {
  const SearchResultEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    // Estimate the width taken by the actions (filter icon + spacing)
    const double actionsWidth = 24 + 8 + 16; // icon width + SizedBox + padding

    return Scaffold(
      // Leave bottomNavigationBar: ... for you to add
      bottomNavigationBar: CustomBottomNavBar(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        //elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,
              color: Colors.black, size: 20), // Adjust size if needed
          onPressed: () {
            // Handle back button
          },
        ),

        titleSpacing:
            0, // Remove default title spacing to maximize horizontal space for title
        title: ConstrainedBox(
          // Use ConstrainedBox to limit the width of the title
          constraints:
              BoxConstraints(maxWidth: screenWidth - actionsWidth - 16.0 * 2),
          child: Container(
            height: 60,
            width: 500, // Ensure it takes full width available
            //padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisSize: MainAxisSize
                  .min, // Essential to allow the row to size itself to children
              children: [
                Padding(padding: EdgeInsets.only(left: 8)), // Reduced padding
                Icon(Icons.search,
                    color: Colors.grey, size: 20), // Adjust size if needed
                SizedBox(width: 3), // Reduced spacing
                Text(
                  'Bali, Indonesia',
                  style: TextStyle(
                      color: Colors.black, fontSize: 14), // Smaller font size
                  overflow: TextOverflow.ellipsis, // Handle overflow
                  maxLines: 1,
                ),
                SizedBox(width: 8), // Reduced spacing
                // Separator
                Container(
                  height: 20,
                  width: 1,
                  color: Colors.grey[400],
                ),
                SizedBox(width: 8), // Reduced spacing
                Expanded(
                  // Allow date/guest text to expand
                  child: Text(
                    '11-14 Mar • 2 Guests',
                    style: TextStyle(
                        color: Colors.black, fontSize: 14), // Smaller font size
                    overflow: TextOverflow.ellipsis, // Handle overflow
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          IconButton(
            // Use a custom filter icon if needed, ensure it's in your assets folder
            icon: Image.asset(
              'assets/icons/filter_icon.png',
              height: 24,
              width: 24, // Explicitly set width/height for better control
              errorBuilder: (context, error, stackTrace) =>
                  Icon(Icons.filter_list, color: Colors.black), // Fallback
            ),
            onPressed: () {
              // Handle filter button
            },
          ),
          SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Placeholder for SVG or image
                  Image.asset(
                    'assets/icons/Group 2.png',
                    width: 140,
                    height: 140,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: 32),
                  Text(
                    "No Results Found",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Text(
                      "We couldn't find any matches for your search. Try using different keywords or adjusting your filters.",
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24), // Space for bottom navigation bar
          ],
        ),
      ),
    );
  }
}
