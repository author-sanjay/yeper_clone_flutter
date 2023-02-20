import 'package:flutter/material.dart';

import 'home_screens_new.dart';
import 'new_orderlist.dart';

class NavbarNewScreen extends StatefulWidget {
  const NavbarNewScreen({super.key});

  @override
  State<NavbarNewScreen> createState() => _NavbarNewScreenState();
}

class _NavbarNewScreenState extends State<NavbarNewScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    HomeScreenNew(),
    OrderListPage(),
    Icon(
      Icons.chat,
      size: 150,
    ),
    Icon(
      Icons.chat,
      size: 150,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: Colors.amber,
      bottomNavigationBar: Material(
        color: Colors.white,
        elevation: 10,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          child: BottomNavigationBar(
            elevation: 10,
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: Color(0xff1C203980).withOpacity(.40),
            selectedItemColor: Color(0xff1C2039),
            selectedFontSize: 16,
            unselectedFontSize: 16,
            showUnselectedLabels: true,
            iconSize: 24,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 6),
                  child: Icon(Icons.home),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 6),
                  child: Icon(Icons.assignment),
                ),
                label: 'Order',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 6),
                  child: Icon(Icons.account_balance_wallet),
                ),
                label: 'Wallet',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 6),
                  child: Icon(
                    Icons.group_add_rounded,
                  ),
                ),
                label: 'Refreal',
              ),
            ],
            currentIndex: _selectedIndex, //New
            onTap: _onItemTapped,
          ),
        ),
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex), //New
      ),
    );
  }
}
