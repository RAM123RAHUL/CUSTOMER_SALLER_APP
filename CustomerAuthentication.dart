import 'package:flutter/material.dart';
import 'package:pikaaya_customer_seller/Customer/LoginCustomer.dart';
import 'package:pikaaya_customer_seller/Customer/Welcome_screen_of_Customer.dart';


import 'SingupCustomer.dart'; // Ensure this path is correct

class Customerauthentication extends StatefulWidget {
  @override
  _Customerauthentication createState() => _Customerauthentication();
}

class _Customerauthentication extends State<Customerauthentication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        elevation: 40,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>WelcomeScreenOfCustomer()));// Pops the current route off the navigator stack
          },
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.blue,
                  Colors.pink,
                  Colors.white,
                  Colors.white,
                ],
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/Images/cust_saller_ui.png'), // Replace with the actual image path
                Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: Text(
                    'Select an option below to continue',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(right: 170),
                  child: Text(
                    'Let the comfort begin!',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(height: 20),

                // Button 1 with the same width and rectangular shape
                SizedBox(
                  width: 250, // Set the desired width for the buttons
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Logincustomer()),
                        );
                      });

                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                      textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Rectangular shape
                      ),
                    ),
                    child: Text(
                      'Existing Customer Login',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Button 2 with the same width and rectangular shape
                SizedBox(
                  width: 250, // Same width as the first button
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignupCustomer()),
                        );
                      });

                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple, // Button background color
                      padding: EdgeInsets.symmetric(horizontal: 45, vertical: 12), // Button size
                      textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold), // Text style
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Rectangular shape
                      ),
                      elevation: 5, // Set elevation if needed
                    ),
                    child: Text(
                      'New User SignUp!',
                      style: TextStyle(color: Colors.white), // Text color
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
