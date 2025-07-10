import 'package:flutter/material.dart';

class LocationSearchScreen extends StatefulWidget {
  @override
  _LocationSearchScreenState createState() => _LocationSearchScreenState();
}

class _LocationSearchScreenState extends State<LocationSearchScreen> {
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.text = 'Bali';
  }

  final List<Map<String, String>> locations = [
    {
      'name': 'Bali',
      'country': 'Indonesia',
      'type': 'Region',
      'subtitle': '10352 Hotels',
      'icon': 'location'
    },
    {
      'name': 'Balikpapan',
      'country': 'East Kalimantan, Indonesia',
      'type': 'City',
      'subtitle': '42 Hotels',
      'icon': 'location'
    },
    {
      'name': 'Balgo',
      'country': 'Jawa, North Sumatera, Indonesia',
      'type': 'Area',
      'subtitle': '153 Hotels',
      'icon': 'location'
    },
    {
      'name': 'Baliuag Hotel',
      'country': 'Kalutara, Yogyakarta, Indonesia',
      'type': 'Hotel',
      'subtitle': '',
      'icon': 'building'
    },
    {
      'name': 'Balinesia Hotel',
      'country': 'Denpasar, Bali, Indonesia',
      'type': 'Hotel',
      'subtitle': '',
      'icon': 'building'
    },
    {
      'name': 'Aahad Hotel',
      'country': 'London, United Kingdom',
      'type': 'Hotel',
      'subtitle': '',
      'icon': 'building'
    },
    {
      'name': 'Empriamatan Hotel',
      'country': 'Marylebone, London, United Kingdom',
      'type': 'Hotel',
      'subtitle': '',
      'icon': 'building'
    },
    {
      'name': 'Nohitica Hotel',
      'country': 'Liverpool, United Kingdom',
      'type': 'Hotel',
      'subtitle': '',
      'icon': 'building'
    },
    {
      'name': 'Yuhaifrah Hotel',
      'country': 'Abu Dhabi, UAE',
      'type': 'Hotel',
      'subtitle': '',
      'icon': 'building'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.1),
      body: Column(
        children: [
          // Search Modal
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: Offset(0, -5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Search Header
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.grey.shade100),
                      ),
                    ),
                    child: Container(
                      width: double.infinity,
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Center(
                              child: Text(
                                'Search Location',
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

                  // Search Bar
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: 'Search location...',
                          prefixIcon:
                              Icon(Icons.search, color: Colors.grey.shade400),
                          suffixIcon: _searchController.text.isNotEmpty
                              ? GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _searchController.clear();
                                    });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.close,
                                      color: Colors.grey.shade500,
                                      size: 16,
                                    ),
                                  ),
                                )
                              : null,
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                        ),
                        onChanged: (value) {
                          setState(() {});
                        },
                      ),
                    ),
                  ),

                  // Location List
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      itemCount: locations.length,
                      itemBuilder: (context, index) {
                        final location = locations[index];
                        return Container(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey.shade100,
                                width: 1,
                              ),
                            ),
                          ),
                          child: Row(
                            children: [
                              // Icon
                              Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  location['icon'] == 'location'
                                      ? Icons.location_on_outlined
                                      : Icons.business_outlined,
                                  color: Colors.grey.shade600,
                                  size: 16,
                                ),
                              ),
                              SizedBox(width: 12),

                              // Location Details
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      location['name']!,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey.shade800,
                                      ),
                                    ),
                                    Text(
                                      location['country']!,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey.shade500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // Type and subtitle
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    location['type']!,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                  if (location['subtitle']!.isNotEmpty)
                                    Text(
                                      location['subtitle']!,
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.grey.shade400,
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
