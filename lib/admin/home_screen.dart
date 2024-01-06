import 'package:flutter/material.dart';
import 'package:flutter_mbk_event/user/AddEventPage.dart';
import 'package:flutter_mbk_event/user/CustomBottomAppBar.dart';
import 'package:flutter_mbk_event/user/event.dart';
import 'package:flutter_mbk_event/user/event_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // Dummy list of events
  final List<Event> events = [
    Event(imagePath: 'assets/images/hh.png', price: '30 MAD', date: '08/12/2023 3PM'),
    Event(imagePath: 'assets/images/hh.png', price: '350 MAD', date: 'Event Date'),
    // Add more events as needed
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MY Events'),
        // Add other AppBar properties as needed
      ),
      body: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          return EventCard(event: events[index]);
        },
      ),
      bottomNavigationBar: CustomBottomAppBar(
        selectedIndex: _selectedIndex,
        onItemSelected: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // Navigate to the AddEventPage when the FAB is tapped
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddEventPage()),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
