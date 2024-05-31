import 'package:flutter/material.dart';
import 'package:shoe_collection/global_variable.dart';
import 'package:shoe_collection/shoe_card.dart';
import 'package:shoe_collection/shoe_detail.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ProductList> {
  final List<String> filters = ["All", "Addidas", "Nike", "Bata"];
  late String selectedfilter;
  @override
  void initState() {
    super.initState();
    selectedfilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.horizontal(left: Radius.circular(35)));
    return SafeArea(
      child: Column(
        children: [
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "Shoe\nCollection",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                      border: border,
                      focusedBorder: border,
                      enabledBorder: border),
                ),
              )
            ],
          ),
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filters.length,
              itemBuilder: (context, index) {
                final filter = filters[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedfilter = filter;
                      });
                    },
                    child: Chip(
                      backgroundColor: selectedfilter == filter
                          ? Theme.of(context).primaryColor
                          : const Color.fromARGB(255, 199, 225, 250),
                      side: const BorderSide(
                          width: 2, color: Color.fromRGBO(255, 199, 225, 250)),
                      label: Text(filter),
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 14),
                      labelStyle: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 499,
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return ShoeDetailPage(product: product);
                        },
                      ),
                    );
                  },
                  child: shoeCard(
                      comapny: product['company'] as String,
                      price: product['price'] as double,
                      imageUrl: product['imageUrl'] as String),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
