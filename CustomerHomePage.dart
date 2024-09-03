import 'package:flutter/material.dart';
import 'package:pikaaya_customer_seller/Customer/Grocery.dart';
import 'package:pikaaya_customer_seller/Customer/panvadi.dart';
import 'package:pikaaya_customer_seller/Customer/pooja.dart';
import 'package:pikaaya_customer_seller/Saller/xyz_mart.dart';

import 'XYZMart.dart';

class Customerhomepage extends StatefulWidget {
  @override
  _CustomHomepageState createState() => _CustomHomepageState();
}

class _CustomHomepageState extends State<Customerhomepage> {
  String _selectedTab = 'Hottest';

  // Products for each tab
  final Map<String, List<Map<String, dynamic>>> _products = {
    'Hottest': [
      {'title': 'Beco Tissue Roll', 'price': 'Rs 100', 'imageUrl': 'assets/Images/tissue_roll.png', 'rating': 4.2},
      {'title': 'Maggie Noodles', 'price': 'Rs 25', 'imageUrl': 'assets/Images/masala_maggie.png', 'rating': 4.5},
      {'title': 'Aata Packet', 'price': 'Rs 50', 'imageUrl': 'assets/Images/aata_maggie.png', 'rating': 4.0},
    ],
    'Popular': [
      {'title': 'Popular Product 1', 'price': 'Rs 200', 'imageUrl': 'assets/Images/popular1.png', 'rating': 4.8},
      {'title': 'Popular Product 2', 'price': 'Rs 150', 'imageUrl': 'assets/Images/popular2.png', 'rating': 4.6},
    ],
    'New combo': [
      {'title': 'Combo 1', 'price': 'Rs 300', 'imageUrl': 'assets/Images/combo1.png', 'rating': 4.7},
      {'title': 'Combo 2', 'price': 'Rs 350', 'imageUrl': 'assets/Images/combo2.png', 'rating': 4.9},
    ],
    'Top': [
      {'title': 'Top Product 1', 'price': 'Rs 250', 'imageUrl': 'assets/Images/top1.png', 'rating': 4.9},
      {'title': 'Top Product 2', 'price': 'Rs 100', 'imageUrl': 'assets/Images/top2.png', 'rating': 4.4},
    ],
  };




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
        backgroundColor:



            Color(0xFF9C27B0),
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Delivery in 15 Mins',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            Text(
              'A79, Sector 4, Noida, Uttar Pradesh',
              style: TextStyle(
                fontSize: 12,
                color: Colors.white70,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.white),
            onPressed: () {
              // Handle notification action here
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 1.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Image.asset(
                  'assets/Images/banner.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 150,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                '  Hello Anjelina, What would you \n  like to order today?',
                style: TextStyle(fontSize: 15),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(0.3),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  hintText: 'Search...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Product Categories',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCategoryItem('assets/Images/masala.png', 'Grocery', () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>GroceryScreen()));
                }),
                _buildCategoryItem('assets/Images/panvadi.png', 'Panwadi', () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Panvadi()));
                }),
                _buildCategoryItem('assets/Images/pooja.png', 'Pooja & Worship', () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Pooja()));
                }),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 8.0,right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildTabItem('Hottest'),
                  _buildTabItem('Popular'),
                  _buildTabItem('New combo'),
                  _buildTabItem('Top'),
                ],
              ),
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildProductItem(
                      'Beco Tissue Roll', 'Rs 100', 'assets/Images/tissue_roll.png', 4.2),
                  _buildProductItem(
                      'Maggie Noodles', 'Rs 25', 'assets/Images/masala_maggie.png', 4.5),
                  _buildProductItem(
                      'Aata Packet', 'Rs 50', 'assets/Images/aata_maggie.png', 4.0),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Coupons & Discounts',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 10),
            Column(
              children: [
                _buildCouponItem1('Flat 20% OFF on Pooja Goods', Colors.pink, () {
                  // Handle coupon item 1 tap
                }),
              ],
            ),
            SizedBox(height: 10),
            Column(
              children: [
                _buildCouponItem2('Flat 10% OFF on Beverages', Colors.blue, () {
                  // Handle coupon item 2 tap
                }),
              ],
            ),
            SizedBox(height: 10),
            Column(
              children: [
                _buildCouponItem3(
                    'Flat Rs. 20 OFF on orders above 499', Colors.orange, () {
                  // Handle coupon item 3 tap
                }),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Nearest Sellers',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 10),
            Column(
              children: [
                _buildSellerItem1('ABC Store', '0.8 KM away', '\nGrocery Store', 4.0),
              ],
            ),
            Column(
              children: [
                _buildSellerItem2('PAN HUB', '1.9 KM away', '\nGrocery Store', 3.5),
              ],
            ),
            Column(
              children: [
                _buildSellerItem3('XYZ Store', '2.3 KM away', '\nGrocery Store', 4.5),
              ],
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryItem(String imageUrl, String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 45,
            backgroundImage: AssetImage(imageUrl),
          ),
          SizedBox(height: 5),
          Text(title),
        ],
      ),
    );
  }

  Widget _buildTabItem(String title) {
    bool isSelected = _selectedTab == title;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTab = title;
        });
      },
      child: Text(
        title,
        style: TextStyle(
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          color: isSelected ? Colors.black : Colors.grey,
        ),
      ),
    );
  }


  Widget _buildProductItem(String title, String price, String imageUrl, double rating ) {
    return GestureDetector(
      onTap: () {
        // Handle product item tap
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => GroceryScreen(
        //       title: title,
        //       price: price,
        //       imageUrl: imageUrl,
        //       rating: rating,
        //     ),
        //   ),
        // );
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          width: 120,
          margin: EdgeInsets.only(right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(imageUrl, width: 100, height: 100),
              SizedBox(height: 5),
              Text(title),
              Row(
                children: [
                  Text(price),
                  Spacer(),
                  Icon(Icons.star, color: Colors.yellow, size: 14),
                  Text('$rating'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCouponItem1(String title, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          height: 250,
          padding: EdgeInsets.all(10),

          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Image.asset('assets/Images/abcmart1.png'),
              SizedBox(width: 10),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCouponItem2(String title, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          height: 250,

          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Image.asset('assets/Images/actmart2.png'),
              SizedBox(width: 10),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCouponItem3(String title, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
         width: double.infinity,
          height: 250,
          padding: EdgeInsets.all(46),

          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Image.asset('assets/Images/abcmart3.png'),
              SizedBox(width: 10),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSellerItem1(String name, String distance, String type, double rating) {
    return
      GestureDetector(
        onTap: () {
      // Handle seller item tap
      // For example, navigate to a detailed seller page
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Xyzmart(),
        ),
      );
    },

     child:  Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
      ),

      child: Row(
        children: [
          Image.asset('assets/Images/abc.png'),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
              Text('$distance | $type'),
            ],
          ),
          Spacer(),
          Icon(Icons.star, color: Colors.yellow),
          Text('$rating'),
        ],
      ),
    ),
      );
  }

  Widget _buildSellerItem2(String name, String distance, String type, double rating ) {
    return  GestureDetector(
        onTap: () {
      // Handle seller item tap
      // For example, navigate to a detailed seller page
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GroceryScreen(),
        ),
      );
    },

      child: Container(

      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Image.asset('assets/Images/pan_hub.png'),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
              Text('$distance | $type'),
            ],
          ),
          Spacer(),
          Icon(Icons.star, color: Colors.yellow),
          Text('$rating'),
        ],
      ),
      ),
    );
  }

  Widget _buildSellerItem3(String name, String distance, String type, double rating) {
    return  GestureDetector(
      onTap: () {
        // Handle seller item tap
        // For example, navigate to a detailed seller page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Xyzmart(),
          ),
        );
      },

      child: Container(

        padding: EdgeInsets.all(16),
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Image.asset('assets/Images/xyz.png'),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                Text('$distance | $type'),
              ],
            ),
            Spacer(),
            Icon(Icons.star, color: Colors.yellow),
            Text('$rating'),
          ],
        ),
      ),
    );
  }
}
