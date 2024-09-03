import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pikaaya_customer_seller/Customer/CustomerBasket.dart';
import 'package:pikaaya_customer_seller/Customer/CustomerMenus.dart';
import 'package:pikaaya_customer_seller/Customer/CustomerProfilePage.dart';



import 'CustomerHomePage.dart';

class MainScreenOfCustomer extends StatefulWidget {
  const MainScreenOfCustomer({Key? key}) : super(key: key);

  @override
  State<MainScreenOfCustomer> createState() => _MainScreenOfCustomerState();
}

class _MainScreenOfCustomerState extends State<MainScreenOfCustomer> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home),
              label: 'Home'
          ),
          BottomNavigationBarItem(icon: Icon(Icons.menu),
              label: 'Menu'
          ),
          BottomNavigationBarItem(icon: Icon(Icons.local_grocery_store),
              label: 'Basket'
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person),
              label: 'Profile'
          ),

        ]),


        tabBuilder: (context, index) {
          switch (index) {
            case 0:
              return CupertinoTabView(
                builder: (context) {
                  return CupertinoPageScaffold(child:
                  Customerhomepage());

                },
              );
            case 1:
              return CupertinoTabView(
                builder: (context) {
                  return CupertinoPageScaffold(child:

                  Customermenus());
                },
              );
            case 2:
              return CupertinoTabView(
                builder: (context) {
                  return CupertinoPageScaffold(child:

                  Customerbasket());
                },
              );
            case 3:
              return CupertinoTabView(
                builder: (context) {
                  return CupertinoPageScaffold(child:

                  Customerprofilepage());
                },
              );
          }

          return Container();
        });
  }
}
