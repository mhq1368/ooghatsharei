import 'package:flutter/material.dart';
import 'package:ooghatsharei/Widgets/top_screen_widget.dart';

AppBar myAppBar(Size appsize) {
  return AppBar(
    automaticallyImplyLeading: false,
    // elevation: 0.3,
    shadowColor: const Color.fromARGB(221, 196, 194, 194),
    // backgroundColor: Color(0xFFC1DBD4),
    title: TopScreenWidget(
      appsizeheight: appsize.height,
      appsizewidth: appsize.width,
    ),
    toolbarHeight: appsize.height / 14,
  );
}
