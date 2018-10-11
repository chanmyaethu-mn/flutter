import 'package:flutter/material.dart';
import 'package:flutter_app_less_ful/Unit.dart';

class ConverterRouteFul extends StatefulWidget {
  final List<Unit> units;
  final ColorSwatch color;

  const ConverterRouteFul({Key key, this.units, this.color})
      : assert(units != null),
        super(key: key);

  @override
  createState() => _ConverterRouteFulState(units, color);
}

class _ConverterRouteFulState extends State<ConverterRouteFul> {

  final List<Unit> units;
  final ColorSwatch color;

  _ConverterRouteFulState(this.units, this.color);

  @override
  Widget build(BuildContext context) {
    final unitWidgets = units.map((Unit unit) {
      return Container(
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(8.0),
        color: color,
        child: Column(
          children: <Widget>[
            Text(
              unit.name,
              style: Theme.of(context).textTheme.headline,
            ),
            Text(
              'Conversion : ${unit.conversion}',
              style: Theme.of(context).textTheme.subhead,
            )
          ],
        ),
      );
    }).toList();

    return ListView(
      children: unitWidgets,
    );
  }
}
