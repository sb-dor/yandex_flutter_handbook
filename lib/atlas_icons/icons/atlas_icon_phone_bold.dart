import 'package:flutter/material.dart';
import 'package:yandex_flutter_handbook/atlas_icons/atlas_icon.dart';
import 'package:yandex_flutter_handbook/atlas_icons/atlas_icons_app.dart';

class AtlasIconPhoneBold extends StatelessWidget {
  const AtlasIconPhoneBold({super.key});

  @override
  Widget build(BuildContext context) {
    return AtlasIcon(atlas: atlas, x: 64, y: 64, width: 24, height: 24, size: 25);
  }
}
