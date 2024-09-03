import 'package:flutter/material.dart';

class Customerbasket extends StatefulWidget {
  const Customerbasket({Key? key}) : super(key: key);

  @override
  State<Customerbasket> createState() => _CustomerbasketState();
}

class _CustomerbasketState extends State<Customerbasket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Customer Basket'),
        centerTitle: true,
      ),
    );
  }
}
