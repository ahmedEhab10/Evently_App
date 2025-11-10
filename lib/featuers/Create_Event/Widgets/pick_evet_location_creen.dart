import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:myeventlyapp/core/res/colors_manager.dart';
import 'package:myeventlyapp/featuers/Create_Event/Provider/Create_Event_Provider.dart';
import 'package:provider/provider.dart';

class PickEvetLocationCreen extends StatelessWidget {
  const PickEvetLocationCreen({super.key, required this.provider});
  final CreateEventProvider provider;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: provider,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: GoogleMap(
                initialCameraPosition: provider.cameraPosition,
                onMapCreated: (Controller) {
                  provider.mapController = Controller;
                },
                markers: provider.markers,
                onTap: (location) async {
                  provider.PickEventLocation(location);
                  await provider.convertlatlangforevent();
                  Navigator.pop(context);
                },
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(color: ColorsManager.blue),
              child: Text(
                'Tap on Location To Select',
                style: TextStyle(color: ColorsManager.white, fontSize: 20.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
