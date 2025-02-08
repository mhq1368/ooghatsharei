import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ooghatsharei/Components/imgconstpasth.dart';
import 'package:ooghatsharei/Views/main_screen.dart';

class TopScreenWidget extends StatelessWidget {
  TopScreenWidget({
    super.key,
    required this.appsizeheight,
    required this.appsizewidth,
  });
  double appsizewidth;
  double appsizeheight;

  @override
  Widget build(BuildContext context) {
    appsizeheight = MediaQuery.of(context).size.height;
    appsizewidth = MediaQuery.of(context).size.width;
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
              child: Icon(CupertinoIcons.arrow_branch)),
          Image.asset(
            ImgAdrPathConst.logoimg,
            height: appsizeheight / 15,
          ),
          Image.asset(
            ImgAdrPathConst.searchimg,
            height: appsizeheight / 40,
          ),
        ],
      ),
    );
  }
}
