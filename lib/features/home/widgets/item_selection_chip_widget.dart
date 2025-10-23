import 'package:flutter/material.dart';

class CategoryChoiceChipWidget extends StatefulWidget {
  const CategoryChoiceChipWidget({
    super.key,
    required this.itemName,
    required this.itemImageLink,
    required this.onSelect,
  });

  final String itemName;
  final String itemImageLink;
  final Function(CategoryChoiceChipWidget) onSelect;


  @override
  State<CategoryChoiceChipWidget> createState() => _CategoryChoiceChipWidgetState();
}

class _CategoryChoiceChipWidgetState extends State<CategoryChoiceChipWidget> {

  bool isSelected = false;
  bool get status => isSelected;


  set onSelectToggle(bool selected) {
    isSelected = selected;
  }

  @override
  Widget build(BuildContext context) {
    final selectedColor = const Color(0xff55433C);
    final backgroundColor = const Color(0xffF5F5F5);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: widget.onSelect(this as CategoryChoiceChipWidget),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
          decoration: BoxDecoration(
            color: isSelected ? selectedColor : backgroundColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipOval(
                child: Image.asset(
                  widget.itemImageLink,
                  height: 20,
                  width: 20,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                widget.itemName,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.grey,
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
