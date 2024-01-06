import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf0f0f0), // Set the background color of the Scaffold
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black), // Change icon color to black
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent, // AppBar is transparent
        elevation: 0, // No shadow
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // Align the content to the start of the column
          children: <Widget>[
            CircleAvatar(
              radius: 40, // Adjust the radius of the CircleAvatar
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
            SizedBox(height: 10),
            Text(
              'Jude',
              style: TextStyle(
                fontSize: 22,
                color: Colors.black, // Text color is black
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            CustomTextField(label: 'Your Name', placeholder: 'Jonathan'),
            CustomTextField(label: 'Email', placeholder: 'Jonathan123@gmail.com'),
            CustomTextField(label: 'Mobile Number', placeholder: '+1 123 3698 789'),
            CustomTextField(label: 'Password', placeholder: '********', isPassword: true),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save profile information
              },
              child: Text('Save'),
              style: ElevatedButton.styleFrom(
                primary: Colors.yellow[700], // Change the color to match the 'Save' button color
                minimumSize: Size(double.infinity, 50), // Match the width and height of the 'Save' button
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final String placeholder;
  final bool isPassword;

  CustomTextField({
    required this.label,
    required this.placeholder,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0), // Adjust padding between fields
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(fontSize: 16, color: Colors.grey[800]), // Label style
          hintText: placeholder,
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 20), // Padding inside the text field
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0), // Rounded corners
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
