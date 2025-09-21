import 'package:flutter/material.dart';
import 'package:yandex_flutter_handbook/atlas_icons/atlas_icon.dart';
import 'package:yandex_flutter_handbook/atlas_icons/atlas_icons_app.dart';

class AtlasIconCartBroken extends StatelessWidget {
  const AtlasIconCartBroken({super.key});

  @override
  Widget build(BuildContext context) {
    return AtlasIcon(atlas: atlas2, x: 768, y: 256, width: 24, height: 24, size: 25);
  }
}