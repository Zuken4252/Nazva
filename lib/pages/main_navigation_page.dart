import 'package:flutter/material.dart';

import 'profile_page.dart';
import 'city_selection_page.dart';
import 'cart_page.dart';

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {

  int currentIndex = 1;

  final pages = const [
    ProfilePage(),
    CitySelectionPage(),
    CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: pages[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,

        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Профиль",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.hiking),
            label: "Экскурсии",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: "Корзина",
          ),

        ],
      ),
    );
  }
}