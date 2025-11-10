import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:myeventlyapp/Models/category_model.dart';
import 'package:myeventlyapp/core/res/colors_manager.dart';

import 'package:myeventlyapp/core/widgets/CustomTextButton.dart';
import 'package:myeventlyapp/core/widgets/Custom_elvetbuttom.dart';

import 'package:myeventlyapp/core/widgets/Custom_tapbar.dart';
import 'package:myeventlyapp/core/widgets/custom_text_form_faild.dart';
import 'package:myeventlyapp/featuers/Create_Event/Provider/Create_Event_Provider.dart';
import 'package:myeventlyapp/featuers/Create_Event/Widgets/add_location_button.dart';

import 'package:provider/provider.dart';

class CreateEventBody extends StatelessWidget {
  const CreateEventBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CreateEventProvider>(
      builder:
          (BuildContext context, CreateEventProvider provider, Widget? child) {
            return Padding(
              padding: EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: provider.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16.r),
                          child: Image.asset(
                            provider.selectedCategory.imagePath,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        CustomTabBar(
                          onCategoryItemClicked: provider.onCategoryItemClicked,
                          categories: CategoryModel.categories,
                          selectedBgColor: ColorsManager.blue,
                          selectedFgColor: ColorsManager.white,
                          unSelectedBgColor: ColorsManager.white,
                          unSelectedFgColor: ColorsManager.blue,
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          'Title',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        SizedBox(height: 8.h),
                        custom_text_form_faild(
                          title: 'Event Title',
                          icon: Icons.title,
                          validator: (String? p1) =>
                              provider.titlevalidation(p1),
                          controller: provider.titleController,
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          'Description',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        SizedBox(height: 8.h),
                        custom_text_form_faild(
                          title: 'Event Description',
                          icon: Icons.density_small_rounded,
                          validator: (String? p1) =>
                              provider.descriptionvalidation(p1),
                          controller: provider.descriptionController,
                          maxLines: 5,
                        ),

                        Row(
                          children: [
                            Icon(Icons.date_range_outlined),
                            SizedBox(width: 4.w),
                            Text(
                              'Date',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Spacer(),
                            CustomTextButton(
                              text: 'Select Date',
                              onTap: () async {
                                await provider.selectEventDate(context);
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        Row(
                          children: [
                            Icon(Icons.access_time),
                            SizedBox(width: 4.w),
                            Text(
                              'Time',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Spacer(),
                            CustomTextButton(
                              text: 'Select Time',
                              onTap: () async {
                                await provider.selectEventTime(context);
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          'Location',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        SizedBox(height: 16.h),
                        AddLocationButton(provider: provider),

                        SizedBox(height: 12.h),
                        Custom_ElevatedButton(
                          title: '      Create Event    ',
                          onPressed: () {
                            if (provider.formKey.currentState?.validate() ==
                                false)
                              return;
                            provider.createEvent(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
    );
  }
}
