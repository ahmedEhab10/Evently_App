import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myeventlyapp/Models/Event_item_model.dart';
import 'package:myeventlyapp/Models/User_Model.dart';
import 'package:myeventlyapp/core/res/colors_manager.dart';
import 'package:myeventlyapp/firebase/firebase_service.dart';

class EventDetialsAppbar extends StatelessWidget {
  const EventDetialsAppbar({super.key, required this.event});
  final EventModel event;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          color: ColorsManager.blue,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.keyboard_backspace_rounded),
        ),
        Text(
          'Event Details',
          style: TextStyle(
            color: ColorsManager.blue,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        Visibility(
          visible: UserModel.currentUser!.id == event.userid,
          child: Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: Icon(Icons.edit, color: ColorsManager.blue),
              ),
              SizedBox(width: 8.w),
              GestureDetector(
                onTap: () {
                  FirebaseService.removeEventfromfirebase(event.id!);
                  Navigator.pop(context);
                },
                child: Icon(Icons.delete, color: Colors.red),
              ),
              // IconButton(
              //   onPressed: () {},
              //   icon: const Icon(Icons.edit, color: ColorsManager.blue),
              // ),
              // IconButton(
              //   onPressed: () {},
              //   icon: const Icon(Icons.delete, color: Colors.red),
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
