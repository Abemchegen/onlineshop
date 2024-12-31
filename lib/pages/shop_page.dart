import "package:flutter/material.dart";
import "package:onlineshop/components/my_catagory_slider.dart";
import "package:onlineshop/components/my_drawer.dart";
import "package:onlineshop/components/my_product_tile.dart";
import "package:onlineshop/models/catagory.dart";
import "package:provider/provider.dart";
import 'package:onlineshop/models/shop.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedCategory = context.watch<Category>().selectedCategory;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          // Navigate to the cart page
          IconButton(
            onPressed: () => Navigator.pushNamed(context, "/cart_page"),
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      drawer: const MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: FutureBuilder(
        // Fetch products from the backend
        future: context.read<Shop>().loadProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show loading indicator
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Show error message
            return Center(
              child: Text(
                "Failed to load products: ${snapshot.error}",
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else {
            // Access loaded products and filter by category
            final products = context.watch<Shop>().shop;
            final filteredProducts = selectedCategory == "All"
                ? products
                : products
                    .where((product) => product.category == selectedCategory)
                    .toList();

            // Display products
            return ListView(
              children: [
                const SizedBox(height: 25),

                // Category slider
                const CategorySlider(),

                const SizedBox(height: 25),

                // Shop subtitle
                Center(
                  child: Text(
                    "Pick from a selected list of premium products",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary),
                  ),
                ),

                const SizedBox(height: 15),

                // Products list
                SizedBox(
                  height: 550,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: filteredProducts.length,
                    itemBuilder: (context, index) {
                      // Get individual product from the filtered list
                      final product = filteredProducts[index];

                      // Return the product tile
                      return MyProductTile(product: product);
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
