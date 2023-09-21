import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'apple_provider.dart';

class AppleList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<AppleProvider>(context);

    return ListView.builder(
      itemCount: productProvider.products.length,
      itemBuilder: (context, index) {
        final product = productProvider.products[index];

        return Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Image.asset(
                    product.imageAsset,
                    width: 100, // Adjust the size as needed
                    height: 100,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    product.name,
                    style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    product.description,
                    style: const TextStyle(fontSize: 14.0),
                  ),
                ],
              ),
            ),
            if (product.quantity > 0)
              ElevatedButton(
                onPressed: () {
                  productProvider.removeProduct(index);
                },
                child: const Text('Buy'),
              )
            else
              const Text('Out of Stock'),
          ],
        );
      },
    );
  }
}
