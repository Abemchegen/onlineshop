import 'package:flutter/material.dart';
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
          CategoryTile(
            category: "All",
            isSelected: selectedCategory == "All",
            onTap: () => context.read<CategoryProvider>().selectCategory("All"),
          ),
          CategoryTile(
            category: "Shoes",
            isSelected: selectedCategory == "Shoes",
            onTap: () =>
                context.read<CategoryProvider>().selectCategory("Shoes"),
          ),
          CategoryTile(
            category: "Clothes",
            isSelected: selectedCategory == "Clothes",
            onTap: () =>
                context.read<CategoryProvider>().selectCategory("Clothes"),
          ),
          CategoryTile(
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

class CategoryTile extends StatelessWidget {
  final String category;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryTile({
    required this.category,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        child: Text(
          category,
          style: TextStyle(
            color: isSelected
                ? Theme.of(context).colorScheme.onPrimary
                : Theme.of(context).colorScheme.inversePrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
