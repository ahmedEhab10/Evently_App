import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:myeventlyapp/Models/Event_item_model.dart';
import 'package:myeventlyapp/Models/category_model.dart';
import 'package:myeventlyapp/core/res/colors_manager.dart';
import 'package:myeventlyapp/core/utils/UI_Utils.dart';
import 'package:myeventlyapp/core/widgets/CustomTextButton.dart';
import 'package:myeventlyapp/core/widgets/Custom_elvetbuttom.dart';
import 'package:myeventlyapp/core/widgets/Custom_tab_item.dart';
import 'package:myeventlyapp/core/widgets/Custom_tapbar.dart';
import 'package:myeventlyapp/core/widgets/custom_text_form_faild.dart';
import 'package:myeventlyapp/firebase/firebase_service.dart';

class CreateEventBody extends StatefulWidget {
  const CreateEventBody({super.key});

  @override
  State<CreateEventBody> createState() => _CreateEventBodyState();
}

class _CreateEventBodyState extends State<CreateEventBody> {
  late CategoryModel selectedCategory = CategoryModel.categories[0];
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  DateTime selectedDateTime = DateTime.now();
  TimeOfDay pickedTimeTemp = TimeOfDay.now();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    super.initState();
  }

  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: Image.asset(selectedCategory.imagePath),
                ),
                SizedBox(height: 8.h),
                CustomTabBar(
                  onCategoryItemClicked: (category) {
                    setState(() {
                      selectedCategory = category;
                    });
                  },
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
                  validator: (String? p1) {
                    if (p1 == null || p1.trim().isEmpty) {
                      return 'Please enter your title';
                    }
                    if (p1.length < 3) {
                      return 'Title must be at least 4 characters';
                    }
                    return null;
                  },
                  controller: _titleController,
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
                  validator: (String? p1) {
                    if (p1 == null || p1.trim().isEmpty) {
                      return 'Please enter your title';
                    }
                    if (p1.length < 3) {
                      return 'Title must be at least 4 characters';
                    }
                    return null;
                  },
                  controller: _descriptionController,
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
                      onTap: selectEventDate,
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
                      onTap: _selectEventTime,
                    ),
                  ],
                ),
                SizedBox(height: 60.h),
                SizedBox(height: 24),
                Custom_ElevatedButton(
                  title: '      Create Event    ',
                  onPressed: () {
                    if (_formKey.currentState?.validate() == false) return;
                    createEvent();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void selectEventDate() async {
    selectedDateTime =
        await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(Duration(days: 365)),
        ) ??
        selectedDateTime;
    selectedDateTime = selectedDateTime.copyWith(
      hour: pickedTimeTemp.hour,
      minute: pickedTimeTemp.minute,
    );
    print(selectedDateTime);
    setState(() {});
  }

  void _selectEventTime() async {
    pickedTimeTemp =
        await showTimePicker(context: context, initialTime: TimeOfDay.now()) ??
        pickedTimeTemp;

    selectedDateTime = selectedDateTime.copyWith(
      hour: pickedTimeTemp.hour,
      minute: pickedTimeTemp.minute,
    );
    setState(() {});
  }

  String viewMonthName(DateTime date) {
    return DateFormat('MMM').format(date);
  }

  void createEvent() async {
    EventModel event = EventModel(
      category: selectedCategory,
      title: _titleController.text,
      description: _descriptionController.text,
      date: selectedDateTime,
    );
    UiUtils.showloading(context);
    await FirebaseService.addEventToFirestore(event);
    UiUtils.hideloading(context);
    Navigator.pop(context);
  }
}
