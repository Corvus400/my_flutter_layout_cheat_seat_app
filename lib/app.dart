import 'package:flutter/material.dart';
import 'package:flutter_layout_cheat_sheet/routes.dart';

import 'home.dart';

class FlutterLayoutCheatSheetApp extends StatefulWidget {
  const FlutterLayoutCheatSheetApp({Key? key}) : super(key: key);

  @override
  _FlutterLayoutCheatSheetAppState createState() => _FlutterLayoutCheatSheetAppState();
}

class _FlutterLayoutCheatSheetAppState extends State<FlutterLayoutCheatSheetApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterLayoutCheatSheetApp',
      home: Home(),
      routes: kRoutes,
    );
  }
}
