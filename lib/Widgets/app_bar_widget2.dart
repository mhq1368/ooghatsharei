import 'package:flutter/material.dart';
import 'package:ooghatsharei/Widgets/top_screen_widget_2.dart';

AppBar myAppBar2(Size appsize, GlobalKey<ScaffoldState> drwerkey) {
  return AppBar(
    automaticallyImplyLeading: false,
    // elevation: 0.3,
    shadowColor: const Color.fromARGB(221, 196, 194, 194),
    // backgroundColor: Color(0xFFC1DBD4),
    title: TopScreenWidget2(
        appsizeheight: appsize.height,
        appsizewidth: appsize.width,
        menudrawer: drwerkey),
    toolbarHeight: appsize.height / 14,
  );
}
