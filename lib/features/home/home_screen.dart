import 'package:dark_light/app/assets_links.dart';
import 'package:dark_light/features/home/widgets/item_selection_chip_widget.dart';
import 'package:dark_light/features/home/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? selectedCategoryIndex; // which chip is selected (or null)

  final List<String> categoryNames = ["Coffee", "Soda", "Red Wine", "Tea"];
  final List<String> categoryImageLinks = [
    AssetsLinks.coffeeCup,
    AssetsLinks.soda,
    AssetsLinks.redWine,
    AssetsLinks.teaCup,
  ];

  final SearchController controller = SearchController();
  String? selectedItem;
  int currentCategory = 0;

  late List<CategoryChoiceChipWidget> categoryChoiceChipWidgetList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              ClipRect(
                child: Align(
                  heightFactor: .32,
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    AssetsLinks.mainCoffeeImage,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.white,
                        Colors.white30,
                        Colors.white24,
                        Colors.white12,
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(AssetsLinks.profilePictureImage),
                    Spacer(),
                    Icon(Icons.menu, color: Color(0xff603F26), size: 35),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text('Hi,', style: TextStyle(fontSize: 30)),
                    Text(
                      'William',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff3E2919),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                SearchBarWidget(
                  controller: controller,
                  onSearchTextChanged: (String item) {
                    selectedItem = item;
                  },
                ),
                SizedBox(height: 14),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(categoryNames.length, (index) {
                      return CategoryChoiceChipWidget(
                        itemImageLink: categoryImageLinks[index],
                        itemName: categoryNames[index],
                        isSelected: (selectedCategoryIndex == index),
                        // <-- you pass selection state
                        onSelect: () {
                          setState(() {
                            selectedCategoryIndex = index;
                          });
                          // do extra behavior for this category
                          print("Category tapped: ${categoryNames[index]}");
                        },
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onItemCategorySelect(CategoryChoiceChipWidget currentItem) {
    //currentItem.
  }
}

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
