import 'package:flutter/material.dart';
import 'package:flutter_mbk_event/admin/match_detail_page.dart';
import 'package:flutter_mbk_event/admin/ticket_management_page.dart';
import 'package:flutter_mbk_event/user/home_screen.dart';

void main() {
  runApp(MyEventApp());
}

class MyEventApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TicketManagementPage(),
    );
  }
}
