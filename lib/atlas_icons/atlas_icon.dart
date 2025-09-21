import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AtlasIcon extends StatelessWidget {
  final ui.Image atlas;
  final double x;      // смещение по X в атласе
  final double y;      // смещение по Y в атласе
  final double width;  // ширина иконки
  final double height; // высота иконки
  final double size;   // во сколько отрисовать на экране

  const AtlasIcon({
    super.key,
    required this.atlas,
    required this.x,
    required this.y,
    required this.width,
    required this.height,
    this.size = 32,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _AtlasPainter(
          atlas: atlas,
          x: x,
          y: y,
          width: width,
          height: height,
        ),
      ),
    );
  }
}

class _AtlasPainter extends CustomPainter {
  final ui.Image atlas;
  final double x, y, width, height;

  _AtlasPainter({
    required this.atlas,
    required this.x,
    required this.y,
    required this.width,
    required this.height,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final src = Rect.fromLTWH(x, y, width, height);   // нужный кусок атласа
    final dst = Rect.fromLTWH(0, 0, size.width, size.height); // куда рисовать
    final paint = Paint();

    canvas.drawImageRect(atlas, src, dst, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

Future<ui.Image> loadAtlas(String path) async {
  final data = await rootBundle.load(path);
  final bytes = data.buffer.asUint8List();
  final codec = await ui.instantiateImageCodec(bytes);
  final frame = await codec.getNextFrame();
  return frame.image;
}