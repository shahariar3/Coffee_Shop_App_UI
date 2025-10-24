import 'package:flutter/material.dart';

class CategoryChoiceChipWidget extends StatelessWidget {
  const CategoryChoiceChipWidget({
    super.key,
    required this.itemName,
    required this.itemImageLink,
    required this.isSelected,
    required this.onSelect,
  });

  final String itemName;
  final String itemImageLink;
  final bool isSelected;
  final VoidCallback onSelect;

  @override
  Widget build(BuildContext context) {
    final selectedColor = const Color(0xff55433C);
    final backgroundColor = const Color(0xffF5F5F5);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: onSelect,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? selectedColor : backgroundColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipOval(
                child: Image.asset(
                  itemImageLink,
                  height: 33,
                  width: 33,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                itemName,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
