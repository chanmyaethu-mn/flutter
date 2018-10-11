import 'package:flutter/material.dart';
import 'package:flutter_app_test_one/category.dart';
import 'package:flutter_app_test_one/unit.dart';

final _backgroundColor = Colors.green[100];

class CategoryRoute extends StatelessWidget {
  const CategoryRoute();

  static const _categoryName = <String>[
    'Length',
    'Area',
    'Volume',
    'Mass',
    'Time',
    'Digital Storage',
    'Energy',
    'Currency',
  ];

  static const _baseColors = <Color>[
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
    List<Category> _categories = getCategoryList();

    Orientation currentOrientation = MediaQuery.of(context).orientation;
    final listView = Container(
      color: _backgroundColor,
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: _buildCategoryWidget(_categories,
          currentOrientation == Orientation.portrait ? true : false),
    );

    final appBar = AppBar(
      title: Text(
        'Unit Converter',
        style: TextStyle(
          color: Colors.black,
          fontSize: 30.0,
        ),
      ),
      backgroundColor: Colors.green[100],
      elevation: 0.0,
      centerTitle: true,
    );

    return Scaffold(appBar: appBar, body: listView);
  }

  Widget _buildCategoryWidget(List<Category> _categories, bool isPortrait) {
    if (isPortrait) {
      return ListView.builder(
        itemBuilder: (BuildContext context, int index) => _categories[index],
        itemCount: _categories.length,
      );
    } else {
      return GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 3.0,
        children: _categories,
      );
    }
  }

  List<Category> getCategoryList() {
    List<Category> categoryList = new List<Category>();

    for (var i = 0; i < _categoryName.length; i++) {
      categoryList.add(Category(
        name: _categoryName[i],
        color: _baseColors[i],
        iconLocation: Icons.cake,
        units: _retrieveUnitList(_categoryName[i]),
      ));
    }

    return categoryList;
  }

  List<Unit> _retrieveUnitList(String categoryName) {
    return List.generate(10, (int i) {
      i += 1;
      return Unit(
        name: '$categoryName Unit $i',
        conversion: i.toDouble(),
      );
    });
  }
}
