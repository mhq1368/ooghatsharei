// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ooghatsharei/Components/constcolors.dart';
import 'package:ooghatsharei/Components/fonts.dart';
import 'package:ooghatsharei/Components/imgconstpasth.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ooghatsharei/Components/stringsconst.dart';
import 'package:ooghatsharei/Components/url_static.dart';
import 'package:ooghatsharei/Views/main_screen.dart';
import 'package:ooghatsharei/services/dioservices.dart';
import 'package:quickalert/quickalert.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Future.delayed(Duration(seconds: 3), () {
    //   Get.off(() => MainScreen(
    //         heightsize: MediaQuery.of(context).size.height,
    //         widthsize: MediaQuery.of(context).size.width,
    //       )); // جایگزینی صفحه فعلی با صفحه جدید
    // });
    testApiConnection();
  }

  Future<void> testApiConnection() async {
    try {
      final response = await DioServices()
          .getMethod(ConstURL.baseUrl + ConstURL.city)
          .timeout(
            Duration(seconds: 10), // تایم‌اوت 10 ثانیه‌ای
          );

      if (response.statusCode == 200) {
        // اگر API در دسترس بود، به صفحه اصلی برو
        Get.off(() =>
            MainScreen(heightsize: Get.height, widthsize: double.infinity));
      } else {
        // اگر خطایی از API دریافت شد، به صفحه خطا برو
      }
    } catch (e) {
      // اگر اتصال برقرار نشد، به صفحه خطا برو
      QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        text: StringsConst.titleerrorapitest,
        confirmBtnText: StringsConst.errorapitest,
        confirmBtnColor: Colors.green,
        title: StringsConst.dialogerrorapitest,
        onConfirmBtnTap: () {
          // SystemNavigator.pop(); // یا exit(0)
          testApiConnection();
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var sizeapp = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: MyGradients.splashBG,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                ImgAdrPathConst.logoimg,
                height: sizeapp.width / 2.4,
              ),
              SizedBox(
                height: sizeapp.height / 20,
              ),
              SpinKitFadingFour(
                color: Colors.white,
              ),
              SizedBox(
                height: sizeapp.height / 15,
              ),
              Text(
                StringsConst.loadingtextconst,
                style: SettingsFonts.loadingtextstyle,
              )
            ],
          ),
        ),
      ),
    );
  }
}
