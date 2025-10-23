import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
    required this.controller,
    required this.onSearchTextChanged,
  });

  final SearchController controller;
  final Function(String) onSearchTextChanged;

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      viewBackgroundColor: Colors.white,
      isFullScreen: false,
      searchController: controller,
      builder: (context, controller) {
        return SearchBar(
          hintText: controller.text.isNotEmpty ? controller.text : "Coffee, Soda, Tea, Snakes",
          trailing: [
            IconButton(
              onPressed: () {
                controller.clear();
              },
              icon: CircleAvatar(
                backgroundColor: Color(0xff603F26),
                radius: 20,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(1.5),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                          ),
                          SizedBox(width: 3),
                          Container(
                            height: 2,
                            width: 14,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 2,
                            width: 14,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          SizedBox(width: 3),
                          Container(
                            padding: EdgeInsets.all(1.5),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
          backgroundColor: WidgetStatePropertyAll(Colors.white),
          elevation: WidgetStatePropertyAll(0),
          side: WidgetStatePropertyAll(
            BorderSide(width: 0, color: Color(0xff603F26)),
          ),
          padding: WidgetStatePropertyAll(
            EdgeInsets.only(left: 10),
          ),
          leading: Icon(Icons.search, size: 30, color: Colors.black54,),
          onTap: () {
            controller.openView();
          },
          onChanged: (_) {
            controller.openView();
          },
          onSubmitted: (_) {
            onSearchTextChanged(controller.text.toString());
          },
        );
      },
      suggestionsBuilder: (context, controller) {
        final input = controller.text.toLowerCase();
        List beverageType = [
          "Cappuccino",
          "Americano",
          "Espresso",
          "Latte",
          "Mocha",
          "Cortado",
          "Caffè macchiato",
        ];

        final filtered = beverageType
            .where((type) => type.toLowerCase().contains(input))
            .toList();

        return filtered.map((type) {
          return ListTile(
            title: Text(type),
            onTap: () {
              controller.text = type.toString();
              controller.closeView(type.toString());
            },
          );
        }).toList();
      },
    );
  }
}
