import 'package:flutter/material.dart';
import 'package:onlineshop/components/my_list_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Theme.of(context).colorScheme.surface,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // drawer header: logo

            DrawerHeader(
              child: Center(
                child: Icon(
                  Icons.shopping_bag,
                  size: 72,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ),

            const SizedBox(height: 25),

            // shop tile
            MyListTile(
                text: "shop",
                icon: Icons.home,
                onTap: () => {
                      Navigator.pop(context),
                      Navigator.pushNamed(context, "/shop_page")
                    }),

            // cart tile
            MyListTile(
                text: "cart",
                icon: Icons.shopping_cart,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, "/cart_page");
                }),

            // exit shop tile
            MyListTile(
              text: "exit",
              icon: Icons.logout,
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                  context, "/intro_page", (route) => false),
            ),
          ],
        ));
  }
}
