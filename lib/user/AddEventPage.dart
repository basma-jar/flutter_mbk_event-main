import 'package:flutter/material.dart';

class AddEventPage extends StatefulWidget {
  @override
  _AddEventPageState createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  final _formKey = GlobalKey<FormState>();
  String? _categoryValue;
  // Add other form field state variables as needed

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Name:'),
                // Add validation, saving, and other logic as needed
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(labelText: 'Time and date:'),
                // Add validation, saving, and other logic as needed
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(labelText: 'Location:'),
                // Add validation, saving, and other logic as needed
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: _categoryValue,
                decoration: InputDecoration(labelText: 'Type:'),
                items: <String>['Category 1', 'Category 2', 'Category 3']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _categoryValue = newValue;
                  });
                },
                // Add validation, saving, and other logic as needed
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(labelText: 'Number of participants:'),
                keyboardType: TextInputType.number,
                // Add validation, saving, and other logic as needed
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(labelText: 'Rules:'),
                maxLines: 4,
                // Add validation, saving, and other logic as needed
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Process data
                    }
                  },
                  child: Text('Save'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange, // Background color
                    onPrimary: Colors.white, // Text Color (Foreground color)
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: AddEventPage()));
