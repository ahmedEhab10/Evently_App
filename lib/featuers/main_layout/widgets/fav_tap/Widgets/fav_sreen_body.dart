import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myeventlyapp/Models/Event_item_model.dart';

import 'package:myeventlyapp/core/res/colors_manager.dart';
import 'package:myeventlyapp/core/widgets/Event_item.dart';
import 'package:myeventlyapp/featuers/main_layout/widgets/fav_tap/Provider/favorite_provider.dart';
import 'package:myeventlyapp/firebase/firebase_service.dart';
import 'package:provider/provider.dart';

class FavSreenBody extends StatefulWidget {
  const FavSreenBody({super.key});

  @override
  State<FavSreenBody> createState() => _FavSreenBodyState();
}

class _FavSreenBodyState extends State<FavSreenBody> {
  late TextEditingController searchController;
  late List<EventModel> allfavouriteEvents;
  List<EventModel> serachEventlist = [];
  @override
  void initState() {
    getallevents();
    searchController = TextEditingController();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FavoriteProvider provider = Provider.of<FavoriteProvider>(context);
    log(provider.allfavoriteEvents.length.toString());

    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                log(value);
                handlesearch(value);
              },
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

              List<EventModel> favouriteEvents = serachEventlist.isEmpty
                  ? snapshot.data!
                  : serachEventlist;

              //  List<EventModel> serchEvents = favouriteEvents.where((event) => event.title.toLowerCase().contains(searchController.text.toLowerCase())).toList();

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

  dispose() {
    log(searchController.text.toString());
    searchController.dispose();
    super.dispose();
  }

  getallevents() async {
    allfavouriteEvents = await FirebaseService.getFavoriteEvents();
    setState(() {});
  }

  handlesearch(String? value) {
    setState(() {
      if (value!.isEmpty) {
        serachEventlist = List.from(
          allfavouriteEvents,
        ); // Show all if query is empty
      } else {
        serachEventlist = allfavouriteEvents
            .where(
              (item) => item.title.toLowerCase().contains(value.toLowerCase()),
            )
            .toList();
      }
    });
  }
}
