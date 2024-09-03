import 'package:flutter/material.dart';
import 'package:pikaaya_customer_seller/Customer/CustomerHomePage.dart';
import 'package:pikaaya_customer_seller/Customer/Productt_checkout_screen.dart';

import 'Order_Status.dart';


class SuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.purple,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductCheckoutScreen()));
          },
        ),
        title: Text("Back"),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Success Icon
              Container(
                decoration: BoxDecoration(
                  color: Colors.green[100],
                  shape: BoxShape.circle,
                ),
                padding: EdgeInsets.all(
                    30.0),
                child: Icon(
                  Icons.check_circle,
                  size: 120.0,
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 30.0),

              // Congratulations Text
              Text(
                'Congratulations!!!',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 10.0),

              // Subtext
              Text(
                'Your order has been \ntaken and is being \nattended to',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 40.0),

              // Track Order Button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>TrackOrderScreen()));
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                  backgroundColor: Color(0xFFB53D6C), // Use your specific color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Text(
                  'Track order',
                  style: TextStyle(fontSize: 16.0,color: Colors.white),
                ),
              ),
              SizedBox(height: 20.0),

              // Continue Shopping Button
              OutlinedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Customerhomepage()));
                },
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                  backgroundColor: Color(0xFFFFFF), // Use your specific color
                  side: BorderSide(color: Color(0xFFB53D6C)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Text(
                  'Continue shopping',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
