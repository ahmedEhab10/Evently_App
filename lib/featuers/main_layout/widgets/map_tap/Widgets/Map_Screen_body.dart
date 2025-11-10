import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:myeventlyapp/core/res/colors_manager.dart';
import 'package:myeventlyapp/featuers/main_layout/widgets/map_tap/Provider/Map_Provaider.dart';
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: GoogleMap(
              markers: provider.markers,
              mapType: MapType.satellite,
              initialCameraPosition: provider.cameraPosition,
              onMapCreated: (Controller) {
                provider.mapController = Controller;
              },
            ),
          ),
        ],
      ),
    );
  }
}
