import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myeventlyapp/core/res/colors_manager.dart';
import 'package:myeventlyapp/core/routes_manager/routes.dart';
import 'package:myeventlyapp/featuers/Create_Event/Provider/Create_Event_Provider.dart';

class AddLocationButton extends StatelessWidget {
  const AddLocationButton({super.key, required this.provider});
  final CreateEventProvider provider;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        Navigator.pushNamed(
          context,
          AppRoutes.pick_event_location_screen,
          arguments: provider,
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            SvgPicture.asset('assets/Svg/location.svg'),
            SizedBox(width: 8.w),
            Expanded(
              child: Text(
                provider.eventlocation == null
                    ? 'Choose Event Location'
                    : ' ${provider.eventCity},${provider.eventCountry}',
                style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: ColorsManager.blue,
                ),
                softWrap: true,
              ),
            ),
            Spacer(),
            Icon(Icons.keyboard_arrow_right, color: ColorsManager.blue),
          ],
        ),
      ),
    );
  }
}
