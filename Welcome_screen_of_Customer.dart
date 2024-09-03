import 'package:flutter/material.dart';
import 'package:pikaaya_customer_seller/Customer/CustomerAuthentication.dart';
import 'package:pikaaya_customer_seller/Saller/customer_saller.dart';

import '../Saller/seller1.dart';


class WelcomeScreenOfCustomer extends StatefulWidget {
  @override
  _WelcomeScreenOfCustomer createState() => _WelcomeScreenOfCustomer();
}

class _WelcomeScreenOfCustomer extends State<WelcomeScreenOfCustomer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        elevation: 40,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(context,MaterialPageRoute(builder: (context)=>CustomerSaller()));// Pops the current route off the navigator stack
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
                Image.asset('assets/Images/basket.png'), // Replace with the actual image path
                 SizedBox(height: 40,),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(
                    'Get your groceries from your regular \nlocal vendor',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 80),
                  child: Text(
                    'We deliver the order from the ease of\nyour fingertips right at your  door step\nfrom your trusted local vendor!!!',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(height: 50),

                // Button 1 with the same width and rectangular shape
                SizedBox(
                  width: 300,
                  height: 50,// Set the desired width for the buttons
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Customerauthentication()));
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 12),
                      textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Rectangular shape
                      ),
                    ),
                    child: Text(
                      "Let's Continue",
                      style: TextStyle(color: Colors.white),
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
