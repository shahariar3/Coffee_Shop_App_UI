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
                    spacing: 4,
                    children: [
                      CategoryChoiceChipWidget(
                        itemImageLink: AssetsLinks.coffeeCup,
                        itemName: "Coffee",
                        onSelect: onItemCategorySelect,
                      ),
                      CategoryChoiceChipWidget(
                        itemImageLink: AssetsLinks.soda,
                        itemName: "Soda",
                        onSelect: onItemCategorySelect,
                      ),
                      CategoryChoiceChipWidget(
                        itemImageLink: AssetsLinks.redWine,
                        itemName: "Red Wine",
                        onSelect: onItemCategorySelect,
                      ),
                      CategoryChoiceChipWidget(
                        itemImageLink: AssetsLinks.teaCup,
                        itemName: "Tea",
                        onSelect: onItemCategorySelect,
                      ),
                    ],
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
