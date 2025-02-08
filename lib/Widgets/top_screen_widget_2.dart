import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:ooghatsharei/Components/imgconstpasth.dart';
import 'package:ooghatsharei/Controllers/theme_controller.dart';

class TopScreenWidget2 extends StatelessWidget {
  final ThemeController tc = Get.put(ThemeController());
  TopScreenWidget2({
    super.key,
    required this.appsizeheight,
    required this.appsizewidth,
    required this.menudrawer,
  });
  final double appsizewidth;
  final double appsizeheight;
  final GlobalKey<ScaffoldState> menudrawer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              menudrawer.currentState!.openDrawer();
            },
            child: Image.asset(
              ImgAdrPathConst.menuimg,
              height: appsizeheight / 40,
              color: Theme.of(context).iconTheme.color,
            ),
          ),
          Image.asset(
            ImgAdrPathConst.logoimg,
            height: appsizeheight / 15,
          ),
          InkWell(
              onTap: () => tc.toggleTheme(),
              child: Icon(Icons.dark_mode_rounded))
        ],
      ),
    );
  }
}
