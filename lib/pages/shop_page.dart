import "package:flutter/material.dart";
import "package:onlineshop/components/my_category_tile.dart";
import "package:onlineshop/components/my_drawer.dart";
import "package:onlineshop/components/my_product_tile.dart";
import "package:onlineshop/models/catagory.dart";
// import "package:onlineshop/models/product.dart";
import "package:provider/provider.dart";
import 'package:onlineshop/models/shop.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    // access products in shop

    final products = context.watch<Shop>().shop;
    final selectedCategory = context.watch<CategoryProvider>().selectedCategory;
    final filteredProducts = selectedCategory == "All"
        ? products
        : products
            .where((product) => product.category == selectedCategory)
            .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          // cart
          IconButton(
              onPressed: () => Navigator.pushNamed(context, "/cart_page"),
              icon: const Icon(Icons.shopping_cart_outlined))
        ],
      ),
      drawer: const MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: ListView(
        children: [
          const SizedBox(height: 25),

          // Category slider
          const CategorySlider(),

          const SizedBox(height: 25),
          // shop subtitle
          Center(
            child: Text(
              "pick from a selected list of premium products",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
          ),

          // items
          SizedBox(
            height: 550,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  // get individual product from shop
                  final product = filteredProducts[index];

                  // return as a product tile
                  return MyProductTile(product: product);
                }),
          )
        ],
      ),
    );
  }
}
