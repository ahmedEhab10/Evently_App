import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myeventlyapp/Models/category_model.dart';
import 'package:myeventlyapp/core/res/colors_manager.dart';
import 'package:myeventlyapp/core/widgets/CustomTextButton.dart';
import 'package:myeventlyapp/core/widgets/Custom_elvetbuttom.dart';
import 'package:myeventlyapp/core/widgets/Custom_tab_item.dart';
import 'package:myeventlyapp/core/widgets/Custom_tapbar.dart';
import 'package:myeventlyapp/core/widgets/custom_text_form_faild.dart';

class CreateEventBody extends StatefulWidget {
  const CreateEventBody({super.key});

  @override
  State<CreateEventBody> createState() => _CreateEventBodyState();
}

class _CreateEventBodyState extends State<CreateEventBody> {
  late CategoryModel selectedCategory = CategoryModel.categories[5];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Image.asset(selectedCategory.imagePath),
            ),
            SizedBox(height: 8.h),
            CustomTabBar(
              categories: CategoryModel.categories,
              selectedBgColor: ColorsManager.blue,
              selectedFgColor: ColorsManager.white,
              unSelectedBgColor: ColorsManager.white,
              unSelectedFgColor: ColorsManager.blue,
            ),
            SizedBox(height: 8.h),
            Text('Title', style: Theme.of(context).textTheme.titleSmall),
            SizedBox(height: 8.h),
            custom_text_form_faild(
              title: 'Event Title',
              icon: Icons.title,
              validator: (String? p1) {},
              controller: null,
            ),
            SizedBox(height: 8.h),
            Text('Description', style: Theme.of(context).textTheme.titleSmall),
            SizedBox(height: 8.h),
            custom_text_form_faild(
              title: 'Event Description',
              icon: Icons.density_small_rounded,
              validator: (String? p1) {},
              controller: null,
              maxLines: 5,
            ),
            Spacer(),
            Row(
              children: [
                Icon(Icons.date_range_outlined),
                SizedBox(width: 4.w),
                Text('Date', style: Theme.of(context).textTheme.titleMedium),
                Spacer(),
                CustomTextButton(
                  text: 'Select Date',
                  onTap: () {
                    showDatePicker(
                      context: context,
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(Duration(days: 365)),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Icon(Icons.access_time),
                SizedBox(width: 4.w),
                Text('Time', style: Theme.of(context).textTheme.titleMedium),
                Spacer(),
                CustomTextButton(
                  text: 'Select Time',
                  onTap: () {
                    showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 24),
            Custom_ElevatedButton(
              title: '      Create Event    ',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
