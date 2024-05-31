import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_collection/HomePage.dart';
import 'package:shoe_collection/cartProvider.dart';

void main() {
  runApp(
    const ShoeCollection(),
  );
}

class ShoeCollection extends StatelessWidget {
  const ShoeCollection({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.yellow, primary: Colors.yellow),
          ),
          debugShowCheckedModeBanner: false,
          home: const ShoeCollectionFirstpage()),
    );
  }
}
