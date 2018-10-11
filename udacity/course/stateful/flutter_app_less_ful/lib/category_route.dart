import 'package:flutter/material.dart';
import 'package:flutter_app_less_ful/Unit.dart';
import 'package:flutter_app_less_ful/category.dart';

final _backgroundColor = Colors.green[100];

class CategoryRoute extends StatelessWidget {
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

    final appBar = AppBar(
      title: Text(
        'Unit Converter',
        style: TextStyle(color: Colors.black, fontSize: 30.0),
      ),
      centerTitle: true,
      backgroundColor: Colors.green[100],
      elevation: 0.0,
    );

    Orientation currentOrientation = MediaQuery.of(context).orientation;

    bool isPortrait =
        (currentOrientation == Orientation.portrait ? true : false);

    final categoryListWidget = _buildCategoryWidget(_categories, isPortrait);

    return Scaffold(
      appBar: appBar,
      body: categoryListWidget,
      backgroundColor: _backgroundColor,
    );
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
    List<Category> resultList = new List<Category>();

    for (var i = 0; i < _categoryName.length; i++) {
      resultList.add(Category(
        name: _categoryName[i],
        color: _baseColors[i],
        iconLocation: Icons.cake,
        units: getUnitList(_categoryName[i]),
      ));
    }

    return resultList;
  }

  List<Unit> getUnitList(String categoryName) {
    return List.generate(10, (int i) {
      i += 1;
      return Unit(name: '$categoryName Unit $i', conversion: i.toDouble());
    });
  }
}
