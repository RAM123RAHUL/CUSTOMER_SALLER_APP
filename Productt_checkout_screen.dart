import 'package:flutter/material.dart';
import 'package:pikaaya_customer_seller/Customer/bikko_tissu_roll.dart';

import 'Succesfull_order_Screen.dart';

class ProductCheckoutScreen extends StatefulWidget {
  const ProductCheckoutScreen({Key? key}) : super(key: key);

  @override
  State<ProductCheckoutScreen> createState() => _ProductCheckoutScreenState();
}

class _ProductCheckoutScreenState extends State<ProductCheckoutScreen> {

  void _showCheckoutPopup() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true, // This is important to prevent overflow
      builder: (context) {
        return SafeArea( // Wrap the container with SafeArea
          child: Padding(
            padding: MediaQuery.of(context).viewInsets, // Adjusts for the keyboard
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Delivery address',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Go back',
                          style: TextStyle(
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      hintText: '10th avenue, Lekki, Lagos State',
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Number we can call',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: '09090XXXXXX',
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Handle pay on delivery
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: BorderSide(color: Colors.purple),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        ),
                        child: Text(
                          'Pay on delivery',
                          style: TextStyle(color: Colors.purple),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SuccessScreen()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        ),
                        child: Text('Checkout',style: TextStyle(color: Colors.white),),
                      ),
                    ],              ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetailScreen()));
          },
        ),
        title: Text("Back"),
      ),
      body: SafeArea( // Wrap the entire body with SafeArea
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 16.0), // Adjust padding if needed
          child: Column(
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Container(
                      height: 110, // Adjusted height
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF9C27B0),
                            Color(0xFFCF0A2C),
                          ],
                        ),
                        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(17.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'My Basket',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              SizedBox(
                height: 430, // Adjust height as needed
                child: ListView(
                  padding: const EdgeInsets.all(8.0),
                  children: [
                    BasketItem(
                      image: 'assets/Images/masala_maggie.png',
                      title: 'Masala Noodles',
                      quantity: '2 packs',
                      price: '₹28.00',
                    ),
                    SizedBox(height: 10),
                    BasketItem(
                      image: 'assets/Images/aata_maggie.png',
                      title: 'Aata Noodles',
                      quantity: '2 packs',
                      price: '₹34.00',
                    ),
                    SizedBox(height: 10),
                    BasketItem(
                      image: 'assets/Images/masala_maggie.png',
                      title: 'Masala Noodles',
                      quantity: '1 packs',
                      price: '₹120.00',
                    ),
                    SizedBox(height: 10),
                    BasketItem(
                      image: 'assets/Images/tissue_roll.png',
                      title: 'Beco Tissue Roll',
                      quantity: '2 packs',
                      price: '₹100.00',
                    ),
                    SizedBox(height: 10),
                    BasketItem(
                      image: 'assets/Images/tissue_roll.png',
                      title: 'Beco Tissue Roll',
                      quantity: '2 packs',
                      price: '₹100.00',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Total",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Text(
                          "₹158.00",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 110),
                    ElevatedButton(
                      onPressed: () {
                        _showCheckoutPopup();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        padding: EdgeInsets.symmetric(horizontal: 45, vertical: 13),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Checkout",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BasketItem extends StatelessWidget {
  final String image;
  final String title;
  final String quantity;
  final String price;

  BasketItem({
    required this.image,
    required this.title,
    required this.quantity,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Image.asset(
            image,
            width: 60, // Increased width
            height: 60, // Increased height
            fit: BoxFit.cover,
          ),
          SizedBox(width: 24), // Increased space between image and text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20, // Increased font size
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  quantity,
                  style: TextStyle(
                    fontSize: 16, // Increased font size
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 24), // Increased space between text and price
          Text(
            price,
            style: TextStyle(
              fontSize: 20, // Increased font size
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
