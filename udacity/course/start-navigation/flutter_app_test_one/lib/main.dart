import 'package:flutter/material.dart';
import 'package:flutter_app_test_one/category_route.dart';

void main() {
  runApp(UnitConverterApp());
}

class UnitConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Unit Coverter',
      home: CategoryRoute(),
    );
  }
}
