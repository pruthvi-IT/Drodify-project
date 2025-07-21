import 'package:flutter/material.dart';

class AddGuestSectionH extends StatefulWidget {
  @override
  _AddGuestSectionState createState() => _AddGuestSectionState();
}

class _AddGuestSectionState extends State<AddGuestSectionH> {
  int adults = 2;
  int children = 0;
  int infants = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      //margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // MODIFIED SECTION START
            Stack(
              alignment: Alignment.center, // Aligns children in the center
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Add Guest',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      // Handle close button
                      print('Close button pressed'); // For demonstration
                    },
                  ),
                ),
              ],
            ),
            // MODIFIED SECTION END
            SizedBox(height: 16.0),
            _buildGuestCounter('Adults', 'Age 13 or above', adults, (value) {
              setState(() {
                adults = value;
              });
            }),
            Divider(),
            _buildGuestCounter('Children', 'Age 2 - 12', children, (value) {
              setState(() {
                children = value;
              });
            }),
            Divider(),
            _buildGuestCounter('Infants', 'Age under 2', infants, (value) {
              setState(() {
                infants = value;
              });
            }),
            SizedBox(height: 24.0),
            SizedBox(
              width: double.infinity,
              height: 44,
              child: ElevatedButton(
                onPressed: () {  },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Example color
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  
                ),
                child: Text(
                  'Confirm',
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGuestCounter(
    String title,
    String subtitle,
    int count,
    Function(int) onChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
              ),
              Text(
                subtitle,
                style: TextStyle(fontSize: 12.0, color: Colors.grey[600]),
              ),
            ],
          ),
          Row(
            children: [
              _buildRoundIconButton(
                icon: Icons.remove,
                onPressed: () {
                  if (count > 0) {
                    onChanged(count - 1);
                  }
                },
                isAdd: false,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  '$count',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ),
              _buildRoundIconButton(
                icon: Icons.add,
                onPressed: () {
                  onChanged(count + 1);
                },
                isAdd: true,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRoundIconButton({
    required IconData icon,
    required VoidCallback onPressed,
    required bool isAdd,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: isAdd ? Colors.green : Colors.grey),
          color: isAdd ? Colors.green : Colors.transparent,
        ),
        child: Icon(
          icon,
          size: 30.0,
          color: isAdd ? Colors.white : Colors.grey,
        ),
      ),
    );
  }
}
