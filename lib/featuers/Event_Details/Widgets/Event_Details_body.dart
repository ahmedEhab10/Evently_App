import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myeventlyapp/Models/Event_item_model.dart';
import 'package:myeventlyapp/core/res/colors_manager.dart';
import 'package:myeventlyapp/core/widgets/Event_Detials_appbar.dart';
import 'package:myeventlyapp/featuers/Event_Details/Widgets/Location_continar.dart';
import 'package:myeventlyapp/featuers/Event_Details/Widgets/date_continr.dart';

class EventDetailsBody extends StatelessWidget {
  const EventDetailsBody({super.key, required this.Eevent});
  final EventModel Eevent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EventDetialsAppbar(event: Eevent),
          SizedBox(height: 16.h),
          Column(children: [Image.asset(Eevent.category.imagePath)]),
          Text(
            Eevent.title,
            style: GoogleFonts.inter(
              fontSize: 24.sp,
              fontWeight: FontWeight.w700,
              color: ColorsManager.blue,
            ),
          ),
          SizedBox(height: 16.h),
          DateContinr(event: Eevent),
          SizedBox(height: 16.h),
          LocationContinar(),
          SizedBox(height: 16.h),
          Text('Description', style: Theme.of(context).textTheme.titleSmall),
          Text(
            Eevent.description,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}
