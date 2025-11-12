import 'package:flutter/material.dart';
import 'package:myeventlyapp/featuers/main_layout/widgets/fav_tap/Provider/favorite_provider.dart';
import 'package:myeventlyapp/featuers/main_layout/widgets/fav_tap/Widgets/fav_sreen_body.dart';
import 'package:provider/provider.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => FavoriteProvider(),
      child: const Scaffold(body: FavSreenBody()),
    );
  }
}
