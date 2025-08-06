import 'package:device_preview/device_preview.dart';
import 'package:first/controller/animation_controller.dart';
import 'package:first/view/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) => AnimationControllerP() ,child: DevicePreview(builder: (context) =>const MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}