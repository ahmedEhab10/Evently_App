import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myeventlyapp/Models/Event_item_model.dart';
import 'package:myeventlyapp/Models/User_Model.dart';
import 'package:myeventlyapp/Models/category_model.dart';
import 'package:myeventlyapp/core/res/colors_manager.dart';
import 'package:myeventlyapp/core/widgets/Event_item.dart';
import 'package:myeventlyapp/firebase/firebase_service.dart';

class FavSreenBody extends StatelessWidget {
  const FavSreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: ColorsManager.blue),
                hintText: "Search for Event",
                hintStyle: GoogleFonts.inter(
                  fontSize: 14.sp,
                  color: ColorsManager.blue,
                  fontWeight: FontWeight.bold,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14.r),
                  borderSide: BorderSide(color: ColorsManager.blue, width: 1.w),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14.r),
                  borderSide: BorderSide(color: ColorsManager.blue, width: 1.w),
                ),
              ),
            ),
          ),
          FutureBuilder(
            future: FirebaseService.getFavoriteEvents(),

            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              }

              List<EventModel> favouriteEvents = snapshot.data ?? [];
              return Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: favouriteEvents.length,
                  itemBuilder: (context, index) => Event_item(
                    eventModel: favouriteEvents[index],
                    MarkAsFavorit: true,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
