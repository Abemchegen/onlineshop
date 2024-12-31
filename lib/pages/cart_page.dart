import 'package:flutter/material.dart';
import 'package:onlineshop/components/my_button.dart';
import 'package:onlineshop/components/my_drawer.dart';
import 'package:onlineshop/components/reciept_dialog.dart';
import 'package:onlineshop/models/product.dart';
import 'package:onlineshop/models/shop.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void removeItemFromCart(BuildContext context, Product product) {
    // remove from cart
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text("Remove this item from your cart? "),
        actions: [
          // cancel
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("cancel"),
          ),

          // confirm
          MaterialButton(
            onPressed: () {
              // pop dialog box
              Navigator.pop(context);

              //add to cart
              context.read<Shop>().removeFromCart(product);
            },
            child: Text("Confirm"),
          ),
        ],
      ),
    );
  }

  // Pressed pay button
  void payButtonPressed(BuildContext context) {
    final cart = context.read<Shop>().cart;

    double totalAmount = 0.0;
    for (var item in cart) {
      totalAmount += item.price;
    }

    // Show the receipt dialog
    showDialog(
      context: context,
      builder: (context) => ReceiptDialog(
        cart: cart,
        totalAmount: totalAmount,
        onCancel: () {
          Navigator.pop(context);
        },
        onProceed: () {
          context.read<Shop>().clearCart();
          Navigator.pop(context);

          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text("Thank You!"),
              content: const Text("Thank you for shopping with AASTU Shop!"),
              actions: [
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor:
                        Theme.of(context).colorScheme.inversePrimary,
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/shop_page');
                  },
                  child: const Text("Go to Shop"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Your Cart"),
        ),
        drawer: const MyDrawer(),
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Column(
          children: [
            // cart list
            Expanded(
              child: cart.isEmpty
                  ? Center(child: Text("Your cart is empty"))
                  : ListView.builder(
                      itemCount: cart.length,
                      itemBuilder: (context, index) {
                        // get individual cart items
                        final item = cart[index];

                        // return as a cart ui
                        return ListTile(
                            title: Text(item.name),
                            subtitle: Text(item.price.toStringAsFixed(2)),
                            trailing: IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () =>
                                  removeItemFromCart(context, item),
                            ));
                      }),
            ),

            // pay button
            if (cart.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: MyButton(
                    onTap: () => payButtonPressed(context),
                    child: Text("Pay Now")),
              ),
          ],
        ));
  }
}
