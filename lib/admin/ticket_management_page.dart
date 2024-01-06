import 'package:flutter/material.dart';


class TicketManagementPage extends StatefulWidget {
  @override
  _TicketManagementPageState createState() => _TicketManagementPageState();
}

class _TicketManagementPageState extends State<TicketManagementPage> {
  String? _selectedCategory;
  TextEditingController _priceController = TextEditingController();
  TextEditingController _numberOfTicketsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TICKETS MANAGEMENT'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.blue, // Adjust the color to match your theme
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            DropdownButtonFormField<String>(
              value: _selectedCategory,
              decoration: InputDecoration(
                labelText: 'Type',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
              ),
              items: <String>['Category 1', 'Category 2', 'Category 3']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedCategory = newValue;
                });
              },
            ),
            SizedBox(height: 16),
            _buildTextField(_priceController, 'Price'),
            SizedBox(height: 16),
            _buildTextField(_numberOfTicketsController, 'Number of tickets'),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Implement save functionality
              },
              child: Text('Save'),
              style: ElevatedButton.styleFrom(
                primary: Colors.yellow[700], // Button color
                minimumSize: Size(double.infinity, 50), // Button size
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
      ),
      keyboardType: label == 'Price' || label == 'Number of tickets' 
          ? TextInputType.number 
          : TextInputType.text,
    );
  }
}
