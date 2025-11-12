import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myeventlyapp/Models/Event_item_model.dart';
import 'package:myeventlyapp/core/res/colors_manager.dart';

class EventCard extends StatelessWidget {
  const EventCard({super.key, required this.event});
  final EventModel event;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320.w,
      decoration: BoxDecoration(
        color: ColorsManager.white,
        borderRadius: BorderRadius.circular(16.r),

        border: Border.all(color: ColorsManager.blue, width: 1.w),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 6),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Image.asset(event.category.imagePath),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Column(
                children: [
                  Text(
                    event.title,
                    style: GoogleFonts.inter(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: ColorsManager.blue,
                    ),
                    maxLines: 2,
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: ColorsManager.black1C,
                      ),
                      Text(
                        'Cairo , Egypt',
                        style: GoogleFonts.inter(
                          color: ColorsManager.black1C,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
