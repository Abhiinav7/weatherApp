import 'package:flutter/material.dart';
class MyAppbar extends StatelessWidget {
  Color bg;
  String title;
  List<Widget>? actions;
  TextStyle textStyle;
   MyAppbar({
     super.key,
     required this.bg,
     required this.title,
     required this.actions,
     required this.textStyle,



   });

  @override
  Widget build(BuildContext context) {
    return  AppBar(
      backgroundColor: bg,
      title: Text(title),
      titleTextStyle: textStyle,
      actions: actions


    );
  }
}
