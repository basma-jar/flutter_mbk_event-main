//import 'dart:convert';
// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_mbk_event/user/home_screen.dart';
import 'package:flutter_mbk_event/auth/registration.dart';
import 'package:shared_preferences/shared_preferences.dart';
class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);




  void showErrorMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

   @override
  Widget build(BuildContext context) {
    String email = '';
    String password = '';

    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 255, 255, 255),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // App Logo
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: Image.asset(
                'assets/mobile/images/MBK_logo.png',
                height: 300,
              ),
            ),
            // Username and Password Fields
            TextField(
              onChanged: (value) {
                email = value;
              },
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              onChanged: (value) {
                password = value;
              },
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),
            const SizedBox(height: 32),
            // Login Button
            ElevatedButton(
              onPressed: () {

              },
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFFFFC727), // Change this to your desired color
              ),
              child: const Text('Login'),
            ),
            InkWell(
  onTap: () {
    // Navigate to the login page here
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => RegisterPage()),
    );
  },
  child: const Text(
    'create an accounte.',
    style: TextStyle(
      color: Color(0xFF81B2CA), // You can customize the color
    ),
  ),
),

          ],
        ),
      ),
    );
  }
}
