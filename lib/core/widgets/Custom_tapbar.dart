import 'package:flutter/material.dart';
import 'package:myeventlyapp/Models/category_model.dart';
import 'package:myeventlyapp/core/widgets/Custom_tab_item.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({
    super.key,
    required this.categories,
    required this.selectedBgColor,
    required this.selectedFgColor,
    required this.unSelectedBgColor,
    required this.unSelectedFgColor,
    this.onCategoryItemClicked,
  });

  final List<CategoryModel> categories;
  final Color selectedBgColor;
  final Color selectedFgColor;
  final Color unSelectedBgColor;
  final Color unSelectedFgColor;
  final void Function(CategoryModel category)? onCategoryItemClicked;

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.categories.length,
      child: TabBar(
        padding: EdgeInsets.zero,
        indicatorColor: Colors.transparent,
        onTap: (index) {
          widget.onCategoryItemClicked?.call(widget.categories[index]);
          setState(() {
            selectedIndex = index;
          });
        },
        isScrollable: true,
        tabs: widget.categories
            .map(
              (category) => Custom_tab_item(
                category: category,
                selectedBgColor: widget.selectedBgColor,
                selectedFgColor: widget.selectedFgColor,
                unSelectedBgColor: widget.unSelectedBgColor,
                unSelectedFgColor: widget.unSelectedFgColor,
                isSelected:
                    selectedIndex == widget.categories.indexOf(category),
              ),
            )
            .toList(),
      ),
    );
  }
}
