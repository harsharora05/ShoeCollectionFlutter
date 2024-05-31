import 'package:flutter/material.dart';
import 'package:shoe_collection/cartPage.dart';
import 'package:shoe_collection/product_list.dart';

class ShoeCollectionFirstpage extends StatefulWidget {
  const ShoeCollectionFirstpage({super.key});

  @override
  State<ShoeCollectionFirstpage> createState() =>
      _ShoeCollectionFirstpageState();
}

class _ShoeCollectionFirstpageState extends State<ShoeCollectionFirstpage> {
  List<Widget> pages = const [ProductList(), CartPage()];
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 0,
        unselectedFontSize: 0,
        iconSize: 35,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        currentIndex: currentPage,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
              ),
              label: '')
        ],
      ),
    );
  }
}
