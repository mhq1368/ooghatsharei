import 'package:flutter/material.dart';
import 'package:ooghatsharei/Components/constcolors.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({
    super.key,
    required this.appWidth,
  });

  final double appWidth;

  @override
  Widget build(BuildContext context) {
    return Divider(
     color: MyColors.dividercolor,
     thickness: 1,
     indent: appWidth/25,
     endIndent: appWidth/25,
    );
  }
}