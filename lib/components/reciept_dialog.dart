import 'package:flutter/material.dart';
import 'package:onlineshop/models/product.dart';

class ReceiptDialog extends StatelessWidget {
  final List<Product> cart;
  final double totalAmount;
  final VoidCallback onCancel;
  final VoidCallback onProceed;

  const ReceiptDialog({
    super.key,
    required this.cart,
    required this.totalAmount,
    required this.onCancel,
    required this.onProceed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Receipt"),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...cart.map((item) => ListTile(
                  title: Text(item.name),
                  subtitle: Text("\$${item.price.toStringAsFixed(2)}"),
                )),

            const SizedBox(height: 20),

            // Total amount
            Text(
              "Total: \$${totalAmount.toStringAsFixed(2)}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      actions: [
        // Cancel button
        TextButton(
          onPressed: onCancel,
          style: TextButton.styleFrom(
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          ),
          child: const Text("Cancel"),
        ),
        // Proceed button
        TextButton(
          onPressed: onProceed,
          style: TextButton.styleFrom(
            foregroundColor: Colors.green,
          ),
          child: const Text("Proceed"),
        ),
      ],
    );
  }
}
