import 'package:flutter/material.dart';

class TicketPurchasePage extends StatefulWidget {
  @override
  _TicketPurchasePageState createState() => _TicketPurchasePageState();
}

class _TicketPurchasePageState extends State<TicketPurchasePage> {
  String? _selectedType;
  int _selectedNumberOfParticipants = 1; // Default to 1 participant

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('KACM vs DHJ'),
        // AppBar customization
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              'assets/images/hh.png', // Replace with your asset image
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'For the 14th day of the Botola Pro 2 Inwi 2023-2024, Kawkab Athletic Club Marrakech hosts Difaâ Hassani El Jadidi on Friday 8 December 2023 at 15:00 at the Grand Stade de Marrakech.',
                // Text customization
              ),
            ),
            // ... Rest of the event details
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: DropdownButtonFormField<String>(
                value: _selectedType,
                decoration: InputDecoration(labelText: 'Type'),
                items: ['CURVA - 30DH', 'TRIBUNA - 60DH', 'VIP - 100DH']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedType = newValue;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: DropdownButtonFormField<int>(
                value: _selectedNumberOfParticipants,
                decoration: InputDecoration(labelText: 'Number of participants'),
                items: List.generate(10, (index) => index + 1).map((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text('$value'),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedNumberOfParticipants = newValue ?? 1;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity, // Make button take the full width
                child: ElevatedButton(
                  onPressed: () {
                    // Add purchase logic
                  },
                  child: Text('BUY'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange, // Button background color
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // BottomNavigationBar if necessary
    );
  }
}