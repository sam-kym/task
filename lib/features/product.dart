import 'package:action/features/products_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'apple_state.dart';
import 'product_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductProvider(),
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

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Inventory'),
      ),
      body: AppleList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Show a dialog to add a new product.
          showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: Text('Add Product'),
              content: AddProductForm(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return ListView.builder(
      itemCount: productProvider.products.length,
      itemBuilder: (context, index) {
        final product = productProvider.products[index];
        return ListTile(
          title: Text(product.name),
          subtitle: Text('Quantity: ${product.quantity}'),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              productProvider.removeProduct(index);
            },
          ),
        );
      },
    );
  }
}

class AddProductForm extends StatefulWidget {
  @override
  _AddProductFormState createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: _nameController,
          decoration: InputDecoration(labelText: 'Product Name'),
        ),
        TextField(
          controller: _quantityController,
          decoration: InputDecoration(labelText: 'Quantity'),
          keyboardType: TextInputType.number,
        ),
        ElevatedButton(
          onPressed: () {
            final name = _nameController.text;
            final quantity = int.tryParse(_quantityController.text) ?? 0;
            if (name.isNotEmpty && quantity > 0) {
              productProvider.addProduct(Product(name, quantity));
              Navigator.pop(context); // Close the dialog
            }
          },
          child: Text('Add'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _quantityController.dispose();
    super.dispose();
  }
}
