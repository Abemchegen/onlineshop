import 'package:flutter/material.dart';
import 'package:onlineshop/models/product.dart';
import 'package:onlineshop/models/shop.dart';
import 'package:provider/provider.dart';

class MyProductTile extends StatelessWidget {
  final Product product;
  const MyProductTile({super.key, required this.product});

  // add to cart button pressed
  void addToCart(BuildContext context) {
    // ask for conformation

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text("add this item to your cart? "),
        actions: [
          // cancel
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: Text("cancel"),
          ),

          // confirm
          MaterialButton(
            onPressed: () {
              // pop dialog box
              Navigator.pop(context);

              //add to cart
              context.read<Shop>().addToCart(product);
            },
            child: Text("Confirm"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(15),
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              // product image
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  child: Image.network(
                    product.imagePath,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.broken_image, size: 50), // Fallback
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // product name
              Text(product.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),

              const SizedBox(height: 25),
              //product description
              Text(product.description,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  )),

              // product price + add to cart button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("\$${product.price.toStringAsFixed(2)}"),
                  Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: IconButton(
                        onPressed: () => addToCart(context),
                        icon: const Icon(Icons.add),
                      ))
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
