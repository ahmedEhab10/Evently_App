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
          Column(children: [Image.asset('assets/images/sport.png')]),
          Text(
            'We Are Going To Play Football',
            style: GoogleFonts.inter(
              fontSize: 24.sp,
              fontWeight: FontWeight.w700,
              color: ColorsManager.blue,
            ),
          ),
          SizedBox(height: 16.h),
          DateContinr(),
          SizedBox(height: 16.h),
          LocationContinar(),
          SizedBox(height: 16.h),
          Text('Description', style: Theme.of(context).textTheme.titleSmall),
          Text(
            'Lorem ipsum dolor sit amet consectetur. Vulputate eleifend suscipit eget neque senectus a. Nulla at non malesuada odio duis lectus amet nisi sit. Risus hac enim maecenas auctor et. At cras massa diam porta facilisi lacus purus. Iaculis eget quis ut amet. Sit ac malesuada nisi quis  feugiat.',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}
