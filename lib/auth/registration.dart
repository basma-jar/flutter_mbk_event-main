import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_mbk_event/auth/login.dart';
import 'package:image_picker/image_picker.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  // Variables to store user input
  String name = '';
  String email = '';
  String password = '';
  String firstName = '';
  String lastName = '';
  String dateOfBirth = '';
  String profileImage = '';

  Future<void> _pickProfileImage() async {
    final ImagePicker _picker = ImagePicker();

    try {
      final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        setState(() {
          profileImage = pickedFile.path;
        });
      } else {
        print('No image selected');
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

Future<void> registerUser() async {
  
  if (_formKey.currentState!.validate()) {
    final url = Uri.parse('https://mbk-ba-tpz6w.ondigitalocean.app/users/');
    print('Register user button clicked');
    try {
      final formattedDateOfBirth = dateOfBirth.isNotEmpty ? dateOfBirth : null;

      final response = await http.post(
        url,
        body: jsonEncode({
          'username': name,
          'profile_image': profileImage,
          'email': email,
          'password_hash': password,
          'first_name': firstName,
          'last_name': lastName,
          'date_of_birth': formattedDateOfBirth,
          'created_at': DateTime.now().toUtc().toIso8601String(),
        }),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 201) {
        print('User registered successfully');
        print('Response body: ${response.body}');
      } else {
        print('Failed to register user. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        showErrorMessage(context, 'Failed to register user. Please try again.');
      }
    } catch (e) {
      print('Error during registration: $e');
      showErrorMessage(context, 'An error occurred during registration. Please try again.');
    }
  }
}


  void showErrorMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  Future<void> _selectDateOfBirth(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        dateOfBirth = picked.toUtc().toIso8601String();
      });
    } else {
      showErrorMessage(context, 'You did not select a date');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Account'),
      ),
      body: Center(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 5.0,
          margin: EdgeInsets.all(20.0),
          color:const Color(0xffd9e7e5),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Your Name'),
                      onChanged: (value) {
                        setState(() {
                          name = value;
                        });
                      },
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Email'),
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Password'),
                      obscureText: true,
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'First Name'),
                      onChanged: (value) {
                        setState(() {
                          firstName = value;
                        });
                      },
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Last Name'),
                      onChanged: (value) {
                        setState(() {
                          lastName = value;
                        });
                      },
                    ),
                    SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () async {
                        await _pickProfileImage();
                      },
                      child: Text('Pick Profile Image'),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Date of Birth'),
                      readOnly: true,
                      onTap: () async {
                        await _selectDateOfBirth(context);
                      },
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: registerUser,
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xffffc727),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Text(
                          'Save',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      child: Text(
                        'Already have an account? Login here.',
                        style: TextStyle(
                          color: const Color(0xFF81B2CA),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
