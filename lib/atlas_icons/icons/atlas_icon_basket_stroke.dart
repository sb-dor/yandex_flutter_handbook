import 'package:flutter/material.dart';
import 'package:yandex_flutter_handbook/atlas_icons/atlas_icon.dart';
import 'package:yandex_flutter_handbook/atlas_icons/atlas_icons_app.dart';

class AtlasIconBasketStroke extends StatelessWidget {
  const AtlasIconBasketStroke({super.key});

  @override
  Widget build(BuildContext context) {
    return AtlasIcon(atlas: atlas2, x: 64, y: 112, width: 24, height: 24, size: 25);
  }
}
