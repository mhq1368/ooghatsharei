import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ooghatsharei/Components/imgconstpasth.dart';
import 'package:ooghatsharei/Controllers/theme_controller.dart';
import 'package:ooghatsharei/Views/main_screen.dart';

class TopScreenWidget extends StatelessWidget {
  final ThemeController tc = Get.put(ThemeController());
  TopScreenWidget({
    super.key,
    required this.appsizeheight,
    required this.appsizewidth,
  });
  final double appsizewidth;
  final double appsizeheight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
              onTap: () {
                Get.off(() => MainScreen(
                    heightsize: appsizeheight, widthsize: appsizewidth));
              },
              child: Icon(CupertinoIcons.back)),
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
