import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:myeventlyapp/core/res/colors_manager.dart';
import 'package:myeventlyapp/featuers/main_layout/widgets/map_tap/Provider/Map_Provaider.dart';
import 'package:myeventlyapp/featuers/main_layout/widgets/map_tap/Widgets/event_card.dart';
import 'package:provider/provider.dart';

class MapScreenBody extends StatelessWidget {
  const MapScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    MapProvaider provider = Provider.of<MapProvaider>(context);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        onPressed: () {
          provider.getuserlocation();
        },
        child: Icon(Icons.gps_fixed),
        backgroundColor: ColorsManager.blue,
      ),
      body: Stack(
        alignment: AlignmentGeometry.bottomEnd,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: GoogleMap(
                  markers: provider.markers,
                  mapType: MapType.normal,
                  initialCameraPosition: provider.cameraPosition,
                  onMapCreated: (Controller) {
                    provider.mapController = Controller;
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 100.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    provider.navigatetoeventlocation(
                      LatLng(
                        provider.events[index].latitude ?? 0,
                        provider.events[index].longitude ?? 0,
                      ),
                    );
                  },
                  child: EventCard(event: provider.events[index]),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 8),
              itemCount: provider.events.length,
            ),
          ),
        ],
      ),
    );
  }
}
