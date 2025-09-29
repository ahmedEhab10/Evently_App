import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myeventlyapp/Models/Event_item_model.dart';
import 'package:myeventlyapp/core/res/colors_manager.dart';

class Event_item extends StatefulWidget {
  const Event_item({super.key, required this.eventModel});
  final EventModel eventModel;

  @override
  State<Event_item> createState() => _Event_itemState();
}

class _Event_itemState extends State<Event_item> {
  bool isfav = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      width: double.infinity,
      height: 203.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        image: DecorationImage(
          image: AssetImage(widget.eventModel.category.imagePath),
          fit: BoxFit.fill,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 2,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '21',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: ColorsManager.blue,
                      ),
                    ),
                    Text(
                      'Nov',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: ColorsManager.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 12,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.eventModel.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isfav = !isfav;
                        });
                      },
                      child: Icon(
                        isfav ? Icons.favorite : Icons.favorite_border_outlined,
                        color: ColorsManager.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
