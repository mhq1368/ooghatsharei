import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:ooghatsharei/Components/fonts.dart';
import 'package:ooghatsharei/Components/stringsconst.dart';
import 'package:ooghatsharei/Widgets/app_bar_widget1.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    var appsize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: myAppBar(appsize),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    HtmlWidget(
                      StringsConst.aboutme,
                      textStyle: SettingsFonts.aboutMeStyle,
                      //جهت استایل دادن به المان هایی که درون html هستند
                      customStylesBuilder: (element) {
                        if (element.className == 'txtkolmatn') {
                          return {'text-align': 'justify'};
                        }

                        return null;
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
