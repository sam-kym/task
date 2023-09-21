import 'package:action/features/apple_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/product.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppleProvider(),
      child: MaterialApp(
        title: 'Product Inventory App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}