import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myeventlyapp/Models/category_model.dart';
import 'package:myeventlyapp/core/res/colors_manager.dart';

class Custom_tab_item extends StatelessWidget {
  const Custom_tab_item({
    super.key,
    required this.category,
    required this.selectedBgColor,
    required this.selectedFgColor,
    required this.unSelectedBgColor,
    required this.unSelectedFgColor,
    required this.isSelected,
  });
  final CategoryModel category;
  final Color selectedBgColor;
  final Color selectedFgColor;
  final Color unSelectedBgColor;
  final Color unSelectedFgColor;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: selectedBgColor),
        color: isSelected ? selectedBgColor : unSelectedBgColor,
        borderRadius: BorderRadius.circular(46.r),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              category.icon,
              color: isSelected ? selectedFgColor : unSelectedFgColor,
            ),
            SizedBox(width: 6.w),
            Text(
              category.name,
              style: TextStyle(
                color: isSelected ? selectedFgColor : unSelectedFgColor,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
