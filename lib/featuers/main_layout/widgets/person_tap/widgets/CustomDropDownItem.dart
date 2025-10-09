import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myeventlyapp/core/res/colors_manager.dart';

class Customdropdownitem extends StatelessWidget {
  const Customdropdownitem({
    super.key,
    required this.label,
    required this.selectedLabel,
    required this.menuItems,
    required this.onChange,
  });
  final String label;
  final String selectedLabel;
  final List<String> menuItems;
  final void Function(String?)? onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: REdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: Theme.of(context).textTheme.labelMedium),
          SizedBox(height: 16.h),
          Container(
            padding: REdgeInsets.symmetric(horizontal: 16, vertical: 12),

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.r),
              border: Border.all(color: ColorsManager.blue, width: 1),
            ),
            width: double.infinity,
            child: Row(
              children: [
                Text(
                  selectedLabel,
                  style: GoogleFonts.inter(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: ColorsManager.blue,
                  ),
                ),
                Spacer(),

                DropdownButton(
                  dropdownColor: ColorsManager.white,

                  underline: Container(),
                  items: menuItems
                      .map(
                        (item) => DropdownMenuItem(
                          value: item,
                          child: Text(
                            item,
                            style: GoogleFonts.inter(
                              color: ColorsManager.black1C,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: onChange,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
