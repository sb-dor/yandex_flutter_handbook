import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:yandex_flutter_handbook/atlas_icons/icons/atlas_icon_basket_bold.dart';
import 'package:yandex_flutter_handbook/atlas_icons/icons/atlas_icon_basket_stroke.dart';
import 'package:yandex_flutter_handbook/atlas_icons/icons/atlas_icon_cart_stroke.dart';
import 'package:yandex_flutter_handbook/atlas_icons/icons/atlas_icon_phone_bold.dart';
import 'package:yandex_flutter_handbook/atlas_icons/icons/atlas_icon_phone_stroke.dart';

import 'atlas_icon.dart';
import 'icons/atlas_icon_cart_broken.dart';

late final ui.Image atlas;
late final ui.Image atlas2;

Future<void> _initiateAtlas() async {
  atlas = await loadAtlas("assets/atlas_icons/icons.png");
  atlas2 = await loadAtlas("assets/atlas_icons/icons_2.png");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initiateAtlas();
  runApp(MainMaterialApp());
}

class MainMaterialApp extends StatefulWidget {
  const MainMaterialApp({super.key});

  @override
  State<MainMaterialApp> createState() => _MainMaterialAppState();
}

class _MainMaterialAppState extends State<MainMaterialApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: AtlasIconsApp());
  }
}

class AtlasIconsApp extends StatefulWidget {
  const AtlasIconsApp({super.key});

  @override
  State<AtlasIconsApp> createState() => _AtlasIconsAppState();
}

class _AtlasIconsAppState extends State<AtlasIconsApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Loading data from atlas icons"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                IconButton(onPressed: () {}, icon: AtlasIconPhoneStroke()),
                IconButton(onPressed: () {}, icon: AtlasIconPhoneBold()),
                IconButton(onPressed: () {}, icon: AtlasIconBasketStroke()),
                IconButton(onPressed: () {}, icon: AtlasIconBasketBold()),
                IconButton(onPressed: () {}, icon: AtlasIconCartStroke()),
                IconButton(onPressed: () {}, icon: AtlasIconCartBroken()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
