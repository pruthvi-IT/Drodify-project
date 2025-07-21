import 'package:flutter/material.dart';

class AdditionalRequestsSheet extends StatefulWidget {
  const AdditionalRequestsSheet({super.key});

  @override
  State<AdditionalRequestsSheet> createState() =>
      _AdditionalRequestsSheetState();
}

class _AdditionalRequestsSheetState extends State<AdditionalRequestsSheet> {
  final Map<String, bool> _requests = {
    'Higher floor room ': false,
    'Lower floor room': false,
    'in-room Dining setup': false,
    'Early breakfast service': false,
    'Early check-in': false,

    'Late check-out': false,

    'Balcony with a view': true,

    'Other request': false,
  };

  @override
  Widget build(BuildContext context) {
    final leftItems = _requests.entries.take(4).toList();
    final rightItems = _requests.entries.skip(4).take(4).toList();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: const Text(
                  'Additional Request',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Positioned(
                right: 0,

                child: IconButton(
                  icon: const Icon(Icons.close, size: 20),
                  onPressed: () => Navigator.pop(context),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Two-column compact layout
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left column
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: leftItems.map((entry) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 24,
                            height: 24,
                            child: Checkbox(
                              value: entry.value,
                              onChanged: (bool? value) {
                                setState(() {
                                  _requests[entry.key] = value ?? false;
                                });
                              },
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              side: BorderSide(
                                color: Colors.grey.withOpacity(0.5),
                              ),
                            ),
                          ),
                          const SizedBox(width: 2),
                          Expanded(
                            child: Text(
                              entry.key,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),

              const SizedBox(width: 20),

              // Right column
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: rightItems.map((entry) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SizedBox(
                            width: 24,
                            height: 24,

                            child: Checkbox(
                              activeColor: Colors.green,
                              focusColor: Colors.grey,
                              value: entry.value,
                              onChanged: (bool? value) {
                                setState(() {
                                  _requests[entry.key] = value ?? false;
                                });
                              },
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              side: BorderSide(
                                color: Colors.grey.withOpacity(0.5),
                              ),
                            ),
                          ),
                          const SizedBox(width: 2),
                          Expanded(
                            child: Text(
                              entry.key,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),
          const Divider(height: 1),
          const SizedBox(height: 12),

          // Confirm button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context, _requests),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                backgroundColor: Colors.green,
              ),
              child: const Text(
                'Confirm',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
