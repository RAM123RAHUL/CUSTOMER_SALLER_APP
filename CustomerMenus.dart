import 'package:flutter/material.dart';

class Customermenus extends StatefulWidget {
  const Customermenus({Key? key}) : super(key: key);

  @override
  State<Customermenus> createState() => _CustomermenusState();
}

class _CustomermenusState extends State<Customermenus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Customer Menus'),
        centerTitle: true,
      ),
    );
  }
}
