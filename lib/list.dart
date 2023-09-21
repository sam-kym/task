import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  List<String> products = ["Apple", "Mango", "Avocado", "Juice"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Available Products'),
        centerTitle: true,
      ),
      body: Column(
        children: products
            .map((product) => Center(
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.75,
                    height: MediaQuery.sizeOf(context).height * 0.10,
                    color: Colors.transparent,
                    child: Card(
                      elevation: 23,
                      shadowColor: Colors.pink,
                      color: Colors.blue,
                      child: Center(
                        child: Text(product),
                      ),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
