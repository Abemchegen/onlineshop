import 'package:flutter/material.dart';
import 'package:onlineshop/components/my_list_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Theme.of(context).colorScheme.surface,
        child: Column(
          children: [
            DrawerHeader(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, "/profile_page");
                },
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Icon(
                        Icons.person_outline,
                        size: 40,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),

                    const SizedBox(width: 10),

                    // Profile text
                    const Text(
                      "View Profile",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
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
