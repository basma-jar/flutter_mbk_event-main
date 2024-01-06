import 'package:flutter/material.dart';


class MatchDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('KACM vs DHJ'),
        backgroundColor: Colors.black, // Change the color as needed
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.network(
              'https://via.placeholder.com/400', // Replace with your actual image URL
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Time and date:', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextField(), // Replace with proper TextFormField and controllers
                  SizedBox(height: 8),
                  Text('Location:', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextField(), // Replace with proper TextFormField and controllers
                  SizedBox(height: 8),
                  Text('Number of participants:', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextField(), // Replace with proper TextFormField and controllers
                  SizedBox(height: 8),
                  Text('Rules:', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextField(), // Replace with proper TextFormField and controllers
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Delete logic
                      },
                      child: Text('DELETE'),
                      style: ElevatedButton.styleFrom(primary: Colors.red),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Tickets logic
                      },
                      child: Text('TICKETS'),
                      style: ElevatedButton.styleFrom(primary: Colors.blue),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Save logic
                      },
                      child: Text('SAVE'),
                      style: ElevatedButton.styleFrom(primary: Colors.green),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        // Add logic for bottom navigation bar if needed
      ),
    );
  }
}
