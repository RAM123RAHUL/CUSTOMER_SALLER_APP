import 'package:flutter/material.dart';

import 'Productt_checkout_screen.dart';


class TrackOrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,

      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with Back Button and Gradient
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF9C27B0),
                  Color(0xFFCF0A2C),],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Row(
                children: [

                  SizedBox(width: 8.0),
                 Padding(
                   padding: const EdgeInsets.only(left: 100.0),
                   child: Center(
                     child: Text(
                       "Track Order",
                       style: TextStyle(
                         color: Colors.white,
                         fontSize: 24.0,
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                   ),
                 ) ,
                ],
              ),
            ),
            SizedBox(height: 16.0),

            // Order Status List
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    OrderStatusItem(
                      icon: Icons.receipt_long,
                      color: Colors.yellow[700]!,
                      title: "Order Taken",
                      subtitle: "",
                      isCompleted: true,
                    ),
                    SizedBox(height: 30),
                    OrderStatusItem(
                      icon: Icons.kitchen,
                      color: Colors.blueAccent,
                      title: "Order Is Being Prepared",
                      subtitle: "",
                      isCompleted: true,
                    ),
                    SizedBox(height: 30),
                    OrderStatusItem(
                      icon: Icons.delivery_dining,
                      color: Colors.red,
                      title: "Order Is Being Delivered",
                      subtitle: "Your delivery agent is coming",
                      isCompleted: false,
                      trailingIcon: Icons.call,
                      trailingColor: Colors.purple,
                    ),
                    // Map Placeholder
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Container(
                        height: 150.0,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: AssetImage('assets/Images/map_pic.png'), // Replace with your map image asset
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    OrderStatusItem(
                      icon: Icons.check_circle,
                      color: Colors.green,
                      title: "Order Received",
                      subtitle: "",
                      isCompleted: false,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderStatusItem extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String subtitle;
  final bool isCompleted;
  final IconData? trailingIcon;
  final Color? trailingColor;

  const OrderStatusItem({
    required this.icon,
    required this.color,
    required this.title,
    this.subtitle = "",
    this.isCompleted = false,
    this.trailingIcon,
    this.trailingColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Container(
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 30.0),
          ),
          title: Text(
            title,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          subtitle: subtitle.isNotEmpty ? Text(subtitle) : null,
          trailing: isCompleted
              ? Icon(Icons.check_circle, color: Colors.green, size: 30.0)
              : trailingIcon != null
              ? Icon(trailingIcon, color: trailingColor, size: 30.0)
              : null,
        ),
        // Dotted line separator
        if (!isCompleted)
          Padding(
            padding: const EdgeInsets.only(left: 42.0, top: 4.0, bottom: 4.0),
            child: Column(
              children: [
                Container(
                  height: 1.0,
                  color: Colors.orange[200],
                ),
                for (int i = 0; i < 10; i++)
                  Container(
                    width: 1.0,
                    height: 6.0,
                    color: Colors.orange[200],
                  ),
              ],
            ),
          ),
      ],
    );
  }
}
