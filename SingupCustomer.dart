import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pikaaya_customer_seller/Customer/CustomerHomePage.dart';
import 'package:pikaaya_customer_seller/Customer/Main_Screen.dart';

import 'CustomerAuthentication.dart';

class SignupCustomer extends StatefulWidget {
  @override
  _SignupCustomerState createState() => _SignupCustomerState();
}

class _SignupCustomerState extends State<SignupCustomer> {
  final _formKey = GlobalKey<FormState>();
  bool _isPhotoSelected = false;
  File? _selectedImage;
  String? _name;
  String? _password;
  String? _confirmPassword;
  String? _otp;
  String? _email;

  final ImagePicker _picker = ImagePicker();

  // Function to pick image from gallery
  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
        _isPhotoSelected = true;
      });
    }
  }

  // Validate and submit the form
  void _submitForm() {
    if (_formKey.currentState!.validate() && _isPhotoSelected) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Account created successfully!'),
      ));
    } else if (!_isPhotoSelected) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Please select a profile photo'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Create Account'),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Pops the current route off the navigator stack
          },
        ),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Photo Section
              Center(
                child: GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    width: 380,
                    height: 180,
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    child: _selectedImage != null
                        ? ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.file(
                        _selectedImage!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    )
                        : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Profile Photo Upload',
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(height: 15),
                        Icon(
                          Icons.camera_alt,
                          size: 60,
                          color: Colors.green,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Take a photo",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Title Section
              Text(
                "Create an account",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Please fill in the information below",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 16),

              // Name Field
              Container(
                color: Colors.blue[50],
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      width: 350,
                      height: 50,
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.person, color: Colors.blue),
                          SizedBox(width: 8),
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Rahul Singh",
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your name';
                                }
                                return null;
                              },
                              onSaved: (value) => _name = value,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    // Password Field
                    Container(
                      width: 350,
                      height: 50,
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.lock, color: Colors.blue),
                          SizedBox(width: 8),
                          Expanded(
                            child: TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Password",
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                return null;
                              },
                              onSaved: (value) => _password = value,
                            ),
                          ),
                          Icon(Icons.visibility_off, color: Colors.grey),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              // Confirm Password Field
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Confirm Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  }
                  if (value != _password) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
                onSaved: (value) => _confirmPassword = value,
              ),
              SizedBox(height: 16),
              // OTP Section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Phone Number',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(height: 5),
                  TextField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: '+91 98765 43210',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 2.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Color(0xFF3E4095),
                          width: 2.0,
                        ),
                      ),
                      prefixIcon: Icon(Icons.phone),
                      suffixIcon: SizedBox(
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {
                            // Handle Get OTP button press
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF3E4095),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                          child: Text('Get OTP', style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: '123 321',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 2.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Color(0xFFAF3D78),
                          width: 2.0,
                        ),
                      ),
                      prefixIcon: Icon(Icons.sms),
                      suffixIcon: SizedBox(
                        height: 30,
                        child: ElevatedButton(
                          onPressed: () {
                            // Handle Submit OTP button press
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFAF3D78),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                          child: Text('Submit OTP', style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              // Email Field
              TextFormField(
                decoration: InputDecoration(
                  hintText: "xyz@abc.com",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
                onSaved: (value) => _email = value,
              ),
              SizedBox(height: 26),
              // Next Button
              Center(
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MainScreenOfCustomer()));
                  },

                  // _submitForm,
                  child: Text("NEXT", style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    padding: EdgeInsets.symmetric(horizontal: 160, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
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
