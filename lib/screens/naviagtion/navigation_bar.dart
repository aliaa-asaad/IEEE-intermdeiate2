import 'package:flutter/material.dart';
import '../../constants.dart';
import '/../screens/cart/cart_screen.dart';
import '/../screens/home/home_screen.dart';
import '/../screens/profile/profile_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  List<Map<String, dynamic>> _pages = [
    {'page': HomeScreen(), 'title': 'Home'},
    {'page': CartScreen(), 'title': 'Cart'},
    {'page': ProfileScreen(), 'title': 'Profile'},
  ];
  int _selectedPageIndex = 0;
  Index(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 150,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        backgroundColor: Colors.white,
        selectedItemColor: Constants.primaryColor,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedPageIndex,
        onTap: Index,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
