import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import 'atlas_icon.dart';

void main() => runApp(MainMaterialApp());

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
  ui.Image? atlas;
  ui.Image? atlas2;

  @override
  void initState() {
    super.initState();
    loadAtlas("assets/atlas_icons/icons.png").then((img) {
      setState(() => atlas = img);
    });
    loadAtlas("assets/atlas_icons/icons_2.png").then((img) {
      setState(() => atlas2 = img);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: CustomScrollView(
        slivers: [
          if (atlas == null)
            SliverFillRemaining(child: Center(child: const CircularProgressIndicator()))
          else
            SliverToBoxAdapter(
              child: Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: AtlasIcon(atlas: atlas!, x: 64, y: 16, width: 24, height: 24, size: 25),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: AtlasIcon(atlas: atlas!, x: 64, y: 64, width: 24, height: 24, size: 25),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: AtlasIcon(atlas: atlas!, x: 64, y: 112, width: 24, height: 24, size: 25),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: AtlasIcon(atlas: atlas2!, x: 64, y: 112, width: 24, height: 24, size: 25),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
