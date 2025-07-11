import 'package:flutter/material.dart';
import '4.3search  location-typing.dart';

class SearchLocationScreen extends StatelessWidget {
  const SearchLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        "Search Location",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.close, size: 26),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20.0),
                      ),
                    ),
                    isScrollControlled: true,
                    builder: (context) => Container(
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: LocationSearchScreen(),
                    ),
                  );
                },
                child: AbsorbPointer(
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: "Where do you want to stay?",
                      filled: true,
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 0),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Icon(Icons.my_location, color: Colors.green),
                  SizedBox(width: 8),
                  Text(
                    "Near Me",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(child: Divider(height: 6)),
          SliverToBoxAdapter(
            child: _SectionHeader(title: "Recently Searched", onClear: () {}),
          ),
          SliverToBoxAdapter(child: _RecentlySearchedList()),
          SliverToBoxAdapter(child: Divider(height: 6)),
          SliverToBoxAdapter(
            child: _SectionHeader(title: "Recently Viewed", onClear: () {}),
          ),
          SliverToBoxAdapter(child: _RecentlyViewedList()),
          SliverToBoxAdapter(child: Divider(height: 6)),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Popular Destination",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(child: _PopularDestinations()),
          SliverToBoxAdapter(child: SizedBox(height: 24)),
        ],
      ),
    );
  }
}

// Helper widgets for sections

class _SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback onClear;
  const _SectionHeader({required this.title, required this.onClear});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          Spacer(),
          GestureDetector(
            onTap: onClear,
            child: Text("Clear all", style: TextStyle(color: Colors.green)),
          ),
        ],
      ),
    );
  }
}

class _RecentlySearchedList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _RecentlySearchedItem(
          title: "Bali",
          subtitle: "Indonesia",
          tag: "Region",
          hotels: "1929 Hotels",
        ),
        _RecentlySearchedItem(
          title: "Badung",
          subtitle: "Bali, Indonesia",
          tag: "City",
          hotels: "2452 Hotels",
        ),
        _RecentlySearchedItem(
          title: "Kuta",
          subtitle: "Badung, Bali, Indonesia",
          tag: "Area",
          hotels: "255 Hotels",
        ),
        _RecentlySearchedItem(
          title: "Zamzam Hotel",
          subtitle: "Kuta, Badung, Bali, Indonesia",
          tag: "Hotel",
          hotels: "",
        ),
      ],
    );
  }
}

class _RecentlySearchedItem extends StatelessWidget {
  final String title, subtitle, tag, hotels;
  const _RecentlySearchedItem({
    required this.title,
    required this.subtitle,
    required this.tag,
    required this.hotels,
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true, // Makes the tile more compact
      contentPadding: EdgeInsets.symmetric(
        horizontal: 0,
        vertical: 0,
      ), // Reduce vertical space
      leading: Icon(Icons.location_on, color: Colors.black54, size: 22),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.w500)),
      subtitle: Text(subtitle, style: TextStyle(fontSize: 12)),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (tag.isNotEmpty)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(tag, style: TextStyle(fontSize: 11)),
            ),
          if (hotels.isNotEmpty)
            Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text(
                hotels,
                style: TextStyle(fontSize: 11, color: Colors.grey[700]),
              ),
            ),
          IconButton(icon: Icon(Icons.close, size: 18), onPressed: () {}),
        ],
      ),
    );
  }
}

class _RecentlyViewedList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _RecentlyViewedItem(
            image: 'assets/images/image.png',
            title: "Homingo Hotel",
            subtitle: "Kuta, Badung, Bali",
            rating: 4.5,
            price: "\$150",
          ),
          // Add more items if needed
        ],
      ),
    );
  }
}

class _RecentlyViewedItem extends StatelessWidget {
  final String image, title, subtitle, price;
  final double rating;
  const _RecentlyViewedItem({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.rating,
    required this.price,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Row(
        mainAxisSize:
            MainAxisSize.min, // <-- This allows the row to size to its content
        children: [
          ClipRRect(
            borderRadius: BorderRadius.horizontal(left: Radius.circular(12)),
            child: Image.asset(image, fit: BoxFit.cover),
          ),
          Container(
            width: 140, // Set a fixed width for the text area
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    Icon(Icons.location_on, size: 12, color: Colors.grey),
                    SizedBox(width: 2),
                    Expanded(
                      child: Text(
                        subtitle,
                        style: TextStyle(fontSize: 11),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 14),
                    Text(rating.toString(), style: TextStyle(fontSize: 12)),
                    Spacer(),
                    Text(price, style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(
                      " /night",
                      style: TextStyle(fontSize: 11, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            padding: EdgeInsets.only(bottom: 38),
            icon: Icon(Icons.close, size: 18),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class _PopularDestinations extends StatelessWidget {
  final List<String> destinations = [
    "Bali",
    "Moscow",
    "Tokyo",
    "Dubai",
    "Paris",
    "Manila",
    "Yogyakarta",
    "Berlin",
    "Surakarta",
    "New York",
    "Bogor",
    "West Java",
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: destinations
            .map((d) => Chip(label: Text(d), backgroundColor: Colors.grey[100]))
            .toList(),
      ),
    );
  }
}
