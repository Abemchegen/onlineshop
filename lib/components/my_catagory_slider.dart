import 'package:flutter/material.dart';
import 'package:onlineshop/components/my_catagory_tile.dart';
import 'package:provider/provider.dart';
import 'package:onlineshop/models/catagory.dart';

class CategorySlider extends StatelessWidget {
  const CategorySlider({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedCategory = context.watch<CategoryProvider>().selectedCategory;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          MyCategoryTile(
            category: "All",
            isSelected: selectedCategory == "All",
            onTap: () => context.read<CategoryProvider>().selectCategory("All"),
          ),
          MyCategoryTile(
            category: "Shoes",
            isSelected: selectedCategory == "Shoes",
            onTap: () =>
                context.read<CategoryProvider>().selectCategory("Shoes"),
          ),
          MyCategoryTile(
            category: "Clothes",
            isSelected: selectedCategory == "Clothes",
            onTap: () =>
                context.read<CategoryProvider>().selectCategory("Clothes"),
          ),
          MyCategoryTile(
            category: "Electronics",
            isSelected: selectedCategory == "Electronics",
            onTap: () =>
                context.read<CategoryProvider>().selectCategory("Electronics"),
          ),
        ],
      ),
    );
  }
}
