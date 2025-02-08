import 'package:flutter/material.dart';
import 'package:ooghatsharei/Components/constcolors.dart';

class MyDivider2 extends StatelessWidget {
  const MyDivider2({
    super.key,
    required this.appWidth,
  });

  final double appWidth;

  @override
  Widget build(BuildContext context) {
    return Divider(
     color: MyColors.dividercolor,
     thickness: 0.5,
     indent: appWidth/25,
     endIndent: appWidth/25,
    );
  }
}