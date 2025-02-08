import 'package:flutter/material.dart';
import 'package:ooghatsharei/Components/imgconstpasth.dart';

class TopScreenWidget extends StatelessWidget {
  const TopScreenWidget({
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
          Image.asset(
            ImgAdrPathConst.searchimg,
            height: appsizeheight / 40,
          ),
        ],
      ),
    );
  }
}
