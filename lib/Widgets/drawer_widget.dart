import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ooghatsharei/Components/fonts.dart';
import 'package:ooghatsharei/Components/imgconstpasth.dart';
import 'package:ooghatsharei/Components/stringsconst.dart';
import 'package:ooghatsharei/Views/about_screen.dart';
import 'package:ooghatsharei/Widgets/divider_widget.dart';
import 'package:ooghatsharei/Widgets/divider_widget2.dart';
import 'package:quickalert/quickalert.dart';
import 'package:share_plus/share_plus.dart';

Drawer drawerApp(Size appsize, BuildContext context) {
  return Drawer(
    // backgroundColor: Colors.white,
    elevation: 3,
    shadowColor: Colors.black87,
    child: ListView(
      padding: EdgeInsets.only(top: appsize.height / 25),
      children: [
        SizedBox(
          height: appsize.height / 4,
          child: Image.asset(
            ImgAdrPathConst.logoimg,
            scale: 2,
          ),
        ),
        MyDivider(appWidth: appsize.width),
        ListTile(
          onTap: () {
            Get.off(() => AboutPage());
          },
          title: Text(
            StringsConst.aboutus,
            style: SettingsFonts.drawerMenuItems,
          ),
          leading: Image.asset(
            ImgAdrPathConst.aboutusicon,
            height: appsize.height / 35,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
        MyDivider2(appWidth: appsize.width),
        ListTile(
          onTap: () async {
            await Share.share(StringsConst.sharetext);
          },
          title: Text(StringsConst.share, style: SettingsFonts.drawerMenuItems),
          leading: Image.asset(
            ImgAdrPathConst.shareicon,
            height: appsize.height / 35,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
        MyDivider2(appWidth: appsize.width),
        ListTile(
          onTap: () {
            // QuicAlert.Show();
            QuickAlert.show(
              context: context,
              type: QuickAlertType.confirm,
              text: StringsConst.exitdialogtext,
              confirmBtnText: StringsConst.exityes,
              cancelBtnText: StringsConst.exitno,
              confirmBtnColor: Colors.green,
              title: StringsConst.exittitle,
              onConfirmBtnTap: () {
                // SystemNavigator.pop(); // یا exit(0)
                exit(0);
              },
            );
          },
          title: Text(StringsConst.exit, style: SettingsFonts.drawerMenuItems),
          leading: Image.asset(
            ImgAdrPathConst.exiticon,
            height: appsize.height / 35,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
      ],
    ),
  );
}
