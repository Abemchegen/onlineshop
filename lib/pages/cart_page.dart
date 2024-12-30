import 'package:flutter/material.dart';
import 'package:onlineshop/components/my_button.dart';
import 'package:onlineshop/components/my_drawer.dart';
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
              context.read<Shop>().addToCart(product);
            },
            child: Text("Confirm"),
          ),
        ],
      ),
    );
  }

  // pressed pay button
  void payButtonPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        content: Text("Payment Succesful"),
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
          title: const Text("Cart Page"),
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
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: MyButton(
                  onTap: () => payButtonPressed(context),
                  child: Text("Pay Now")),
            )
          ],
        ));
  }
}
