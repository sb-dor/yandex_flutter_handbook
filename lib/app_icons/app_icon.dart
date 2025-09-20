import 'package:flutter/material.dart';
import 'package:yandex_flutter_handbook/app_icons/my_flutter_app_icons.dart';
import 'package:yandex_flutter_handbook/app_icons/some_another_icons.dart';

void main() => runApp(MaterialRoot());

class MaterialRoot extends StatefulWidget {
  const MaterialRoot({super.key});

  @override
  State<MaterialRoot> createState() => _MaterialRootState();
}

class _MaterialRootState extends State<MaterialRoot> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: AppIconFirstScreen());
  }
}

class AppIconFirstScreen extends StatefulWidget {
  const AppIconFirstScreen({super.key});

  @override
  State<AppIconFirstScreen> createState() => _AppIconFirstScreenState();
}

class _AppIconFirstScreenState extends State<AppIconFirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => AppIcon()));
          },
          child: Text("Navigate"),
        ),
      ),
    );
  }
}

class AppIcon extends StatefulWidget {
  const AppIcon({super.key});

  @override
  State<AppIcon> createState() => _AppIconState();
}

class _AppIconState extends State<AppIcon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          IconButton(onPressed: () {}, icon: Icon(MyFlutterAppIcons.style_bulk)),
          IconButton(onPressed: () {}, icon: Icon(MyFlutterAppIcons.style_linear)),
          IconButton(onPressed: () {}, icon: Icon(MyFlutterAppIcons.style_linear_1_)),
          IconButton(
            onPressed: () {},
            icon: Icon(SomeAnother.heart, color: Colors.red),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(SomeAnother.package, color: Colors.green),
          ),
        ],
      ),
    );
  }
}
