import 'package:flutter/material.dart';
import 'package:flutter_app_less_ful/category_route_ful.dart';

void main() {
  runApp(UnitConverter());
}

class UnitConverter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Unit Converter',
      home: CategoryRouteFul(),
    );
  }
}
