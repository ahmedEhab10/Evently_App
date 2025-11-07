import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:myeventlyapp/featuers/main_layout/widgets/map_tap/Provider/Map_Provaider.dart';
import 'package:provider/provider.dart';

class MapScreenBody extends StatelessWidget {
  const MapScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    MapProvaider provider = Provider.of<MapProvaider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: GoogleMap(
            mapType: MapType.satellite,
            initialCameraPosition: provider.cameraPosition,
            onMapCreated: (Controller) {
              provider.mapController = Controller;
            },
            markers: provider.markers,
          ),
        ),
      ],
    );
  }
}
