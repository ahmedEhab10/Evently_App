import 'package:flutter/material.dart';
import 'package:myeventlyapp/featuers/main_layout/widgets/map_tap/Provider/Map_Provaider.dart';
import 'package:myeventlyapp/featuers/main_layout/widgets/map_tap/Widgets/Map_Screen_body.dart';
import 'package:provider/provider.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (BuildContext context) => MapProvaider(),
        child: MapScreenBody(),
      ),
    );
  }
}
