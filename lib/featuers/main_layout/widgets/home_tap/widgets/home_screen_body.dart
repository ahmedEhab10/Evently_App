import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myeventlyapp/Models/Event_item_model.dart';
import 'package:myeventlyapp/Models/category_model.dart';
import 'package:myeventlyapp/core/res/colors_manager.dart';
import 'package:myeventlyapp/core/widgets/Custom_tab_item.dart';
import 'package:myeventlyapp/core/widgets/Event_item.dart';
import 'package:myeventlyapp/featuers/main_layout/widgets/home_tap/widgets/information_widget.dart';
import 'package:myeventlyapp/firebase/firebase_service.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  int selectedIndex = 0;
  List<EventModel> events = [];
  late CategoryModel selectedCategory = CategoryModel.categoriesWithAll[0];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        information_containat(
          onCategoryItemClicked: (category) {
            setState(() {
              selectedCategory = category;
            });
          },
        ),
        StreamBuilder(
          stream: FirebaseService.getEventFromFirestorerealtime(
            category: selectedCategory,
          ),

          builder: (context, snapshot) {
            if (snapshot.hasError) {
              log('Error: ${snapshot.error}');
              return Text(snapshot.error.toString());
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              log('Loading...');
              return Center(child: CircularProgressIndicator());
            }
            log('Data: ${snapshot.data!.length}');
            return Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) =>
                    Event_item(eventModel: snapshot.data![index]),
                itemCount: snapshot.data!.length,
              ),
            );
          },
        ),
      ],
    );
  }
}

class information_containat extends StatefulWidget {
  const information_containat({super.key, required this.onCategoryItemClicked});
  final void Function(CategoryModel category)? onCategoryItemClicked;
  @override
  @override
  State<information_containat> createState() => _information_containatState();
}

class _information_containatState extends State<information_containat> {
  int currentIndex = 0;

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
                    widget.onCategoryItemClicked?.call(
                      CategoryModel.categoriesWithAll[index],
                    );
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
