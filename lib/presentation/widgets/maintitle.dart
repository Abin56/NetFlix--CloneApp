import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MainTextTitlewidget extends StatelessWidget {
  const MainTextTitlewidget({Key? key, required this.title}) : super(key: key);
final String title;
  @override
  Widget build(BuildContext context) {
    return  Text(title,
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),);
  }
}