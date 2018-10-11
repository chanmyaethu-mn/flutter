import 'package:meta/meta.dart';

class Unit {
  final String name;
  final double conversion;

  Unit({@required this.name, @required this.conversion})
      : assert(name != null),
        assert(conversion != null);
}
