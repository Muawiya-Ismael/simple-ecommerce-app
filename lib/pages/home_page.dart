import 'package:flutter/material.dart';
import 'package:simple_ecommerce_app/components/drawer_icon.dart';
import 'package:simple_ecommerce_app/pages/shop_page.dart';

import '../components/bottom_nav_bar.dart';
import 'cart_page.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;

  void navigateBottomBar(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const ShopPage(),
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: BottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          }
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        elevation: 0,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Image.asset(
                "lib/images/logo.png",
                color: Colors.white,
              ),
            ),

            const DrawerIcon(
              text:"Home",
              icon: Icons.home,
            ),

            const DrawerIcon(
              text:"About",
              icon: Icons.info,
            ),

            const DrawerIcon(
              text:"Logout",
              icon: Icons.logout,
            ),

          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
