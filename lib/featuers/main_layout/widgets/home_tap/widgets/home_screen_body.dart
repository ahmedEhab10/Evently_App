import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myeventlyapp/Models/Event_item_model.dart';
import 'package:myeventlyapp/Models/category_model.dart';
import 'package:myeventlyapp/core/res/colors_manager.dart';
import 'package:myeventlyapp/core/widgets/Custom_tab_item.dart';
import 'package:myeventlyapp/core/widgets/Event_item.dart';
import 'package:myeventlyapp/featuers/main_layout/widgets/home_tap/widgets/information_widget.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        information_containat(),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => Event_item(
              eventModel: EventModel(
                category: CategoryModel.categories[2],
                title: 'Meeting for Updating The Development Method ',
                description: 'Meeting for Updating The Development Method ',
                date: DateTime.now(),
              ),
            ),
            itemCount: 15,
          ),
        ),
      ],
    );
  }
}

class information_containat extends StatefulWidget {
  const information_containat({super.key});

  @override
  State<information_containat> createState() => _information_containatState();
}

class _information_containatState extends State<information_containat> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      decoration: BoxDecoration(
        color: ColorsManager.blue,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24.r),
          bottomRight: Radius.circular(24.r),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: information_widget(),
            ),
            SizedBox(height: 10.h),
            DefaultTabController(
              length: CategoryModel.categoriesWithAll.length,

              child: TabBar(
                onTap: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                indicatorColor: Colors.transparent,
                padding: EdgeInsets.zero,
                isScrollable: true,
                tabs: CategoryModel.categoriesWithAll
                    .map(
                      (category) => Custom_tab_item(
                        category: category,
                        selectedBgColor: ColorsManager.white,
                        selectedFgColor: ColorsManager.blue,
                        unSelectedBgColor: Colors.transparent,
                        unSelectedFgColor: ColorsManager.white,
                        isSelected:
                            currentIndex ==
                            CategoryModel.categoriesWithAll.indexOf(category),
                      ),
                    )
                    .toList(),
              ),
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
