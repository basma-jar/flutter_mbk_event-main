import 'package:flutter/material.dart';
import 'package:flutter_mbk_event/user/AddEventPage.dart';
import 'package:flutter_mbk_event/user/event.dart';
import 'package:flutter_mbk_event/user/ticket_purchase_page.dart';

class EventCard extends StatelessWidget {
  final Event event;

  EventCard({required this.event});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(event.imagePath),
          ListTile(
            title: Text(event.price),
            subtitle: Text(event.date),
            trailing: ElevatedButton(
              onPressed: () {
                 Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TicketPurchasePage()),
          );
                // Action for 'See details' button
              },
              child: Text('See details'),
            ),
          ),
        ],
      ),
    );
  }
}
