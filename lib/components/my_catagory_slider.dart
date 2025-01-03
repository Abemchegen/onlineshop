import 'package:flutter/material.dart';
import 'package:onlineshop/components/my_catagory_tile.dart';
import 'package:provider/provider.dart';
import 'package:onlineshop/models/catagory.dart';

class CategorySlider extends StatelessWidget {
  const CategorySlider({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedCategory = context.watch<Category>().selectedCategory;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          MyCategoryTile(
            category: "All",
            isSelected: selectedCategory == "All",
            onTap: () => context.read<Category>().selectCategory("All"),
          ),
          MyCategoryTile(
            category: "Shoes",
            isSelected: selectedCategory == "Shoes",
            onTap: () => context.read<Category>().selectCategory("Shoes"),
          ),
          MyCategoryTile(
            category: "Clothes",
            isSelected: selectedCategory == "Clothes",
            onTap: () => context.read<Category>().selectCategory("Clothes"),
          ),
          MyCategoryTile(
            category: "Electronics",
            isSelected: selectedCategory == "Electronics",
            onTap: () => context.read<Category>().selectCategory("Electronics"),
          ),
        ],
      ),
    );
  }
}
