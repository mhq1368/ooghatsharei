import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ooghatsharei/Components/constcolors.dart';
import 'package:ooghatsharei/Components/fonts.dart';
import 'package:ooghatsharei/Controllers/azan_controller.dart';
import 'package:ooghatsharei/Controllers/azan_sub_controller.dart';
import 'package:ooghatsharei/Widgets/drawer_widget.dart';
import 'package:ooghatsharei/Widgets/main_loading_widget.dart';
import 'package:ooghatsharei/Widgets/top_screen_widget_2.dart';
import 'package:ooghatsharei/gen/assets.gen.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    super.key,
    required this.heightsize,
    required this.widthsize,
  });
  final double heightsize;
  final double widthsize;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> drwerkey = GlobalKey();
  final TextEditingController _cityname = TextEditingController();
  AzanSubController subAzan = Get.put(AzanSubController());
  AzanController mainAzan = Get.put(AzanController());
  @override
  void initState() {
    super.initState();
    _loadLastSearchedCity();
  }

  // بارگذاری آخرین شهر جستجو شده
  void _loadLastSearchedCity() async {
    final prefs = await SharedPreferences.getInstance();
    String? lastCity = prefs.getString('last_searched_city');

    if (lastCity != null) {
      setState(() {
        _cityname.text = lastCity;
      });
      // جستجوی خودکار با آخرین شهر
      subAzan.getAzansubItems(lastCity);
    }
  }

  // ذخیره‌سازی شهر
  void _saveLastSearchedCity(String city) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('last_searched_city', city);
  }

//تابع گرفتن تاریخ از سیستم و نمایش به کاربر به صورت شمسی
  List<String> weeksdays = [
    'دوشنبه',
    'سه شنبه',
    'چهار شنبه',
    'پنج شنبه',
    'جمعه',
    'شنبه',
    'یک شنبه',
  ];
  String shamsidate() {
    DateTime now = DateTime.now();
    Jalali jNow = Jalali.fromDateTime(now);
    int today = now.weekday;
    var strdate = "${jNow.year}/${jNow.month}/${jNow.day}";
    var totaltoday = "${weeksdays[today - 1]} : $strdate";

    return totaltoday;
  }

  @override
  Widget build(BuildContext context) {
    var appsize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Theme.of(context).canvasColor.colorSpace,

        key: drwerkey,
        //MenuItems
        drawer: drawerApp(appsize, context),
        //StatusBar
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 4,
          shadowColor: Colors.black87,
          title: TopScreenWidget2(
              appsizeheight: appsize.height,
              appsizewidth: appsize.width,
              menudrawer: drwerkey),
          toolbarHeight: appsize.height / 14,
        ),

        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // باکس جستجو
            Padding(
              padding: EdgeInsets.fromLTRB(25, 25, 25, 25),
              child: SizedBox(
                child: TextField(
                  onSubmitted: (value) {
                    FocusScope.of(context).unfocus();
                  },
                  style: TextStyle(color: Colors.white),
                  controller: _cityname,
                  showCursor: true,
                  decoration: InputDecoration(
                      filled: true,
                      hintText: "نام شهر",
                      hintStyle: SettingsFonts.timetext,
                      fillColor: Colors.blueGrey,
                      prefixIcon: Icon(Icons.location_on),
                      prefixIconColor: Colors.white,
                      focusColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100))),
                  autocorrect: true,
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () async {
                // ذخیره‌سازی شهر قبل از جستجو
                _saveLastSearchedCity(_cityname.text);

                // جستجوی اذان برای شهر
                await subAzan.getAzansubItems(_cityname.text);
              },
              style: ButtonStyle(
                  iconSize: WidgetStatePropertyAll(25.0),
                  iconColor: WidgetStatePropertyAll(Colors.white),
                  alignment: Alignment.center,
                  padding: WidgetStatePropertyAll(
                      EdgeInsets.fromLTRB(30, 10, 20, 10)),
                  backgroundColor: WidgetStatePropertyAll(Colors.lightGreen)),
              iconAlignment: IconAlignment.end,
              icon: Icon(Icons.search_sharp),
              label: Text(
                "",
                style: SettingsFonts.buttonFont,
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: appsize.height / 1.5,
              width: double.infinity / 2,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(Assets.images.bg.path), opacity: 0.8)),
              child: //کل لیست اذان
                  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: appsize.height / 10.5,
                    width: appsize.width / 2,
                  ),
                  SizedBox(
                    height: appsize.height / 1.9,
                    child: Obx(() {
                      if (subAzan.loading.value == true) {
                        return mainLoading(appsize.height);
                      } else {
                        return ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: subAzan.azansubmodelList.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Text(shamsidate(),
                                    style: SettingsFonts.datetimefont),
                                SizedBox(
                                  height: appsize.height / 25,
                                ),
                                //افق
                                Container(
                                  height: appsize.height / 20,
                                  width: appsize.width / 3,
                                  decoration: BoxDecoration(
                                      gradient: MyGradients.azanofogh,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "افق : ${subAzan.azansubmodelList[index].city}",
                                      style: SettingsFonts.timetext,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: appsize.height / 14,
                                ),
                                //لیست ساعات اذان
                                Column(
                                  children: [
                                    //اذان صبح
                                    Container(
                                      height: appsize.height / 20,
                                      width: appsize.width / 1.4,
                                      decoration: BoxDecoration(
                                          gradient: MyGradients.azanListBG,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              " 🕌 ",
                                              style: SettingsFonts.emojiIcons,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8.0),
                                              child: Text(
                                                "اذان صبح : ",
                                                style: SettingsFonts.timetext,
                                              ),
                                            ),
                                            Text(
                                              subAzan.azansubmodelList[index]
                                                  .azanSobh
                                                  .toString(),
                                              style: SettingsFonts.timetext,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    //طلوع آفتاب
                                    Container(
                                      height: appsize.height / 20,
                                      width: appsize.width / 1.4,
                                      decoration: BoxDecoration(
                                          gradient: MyGradients.azanListBG,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              " 🌅 ",
                                              style: SettingsFonts.emojiIcons,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8.0),
                                              child: Text(
                                                "طلوع آفتاب ",
                                                style: SettingsFonts.timetext,
                                              ),
                                            ),
                                            Text(
                                              subAzan.azansubmodelList[index]
                                                  .toloeAftab
                                                  .toString(),
                                              style: SettingsFonts.timetext,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    //اذان ظهر
                                    Container(
                                      height: appsize.height / 20,
                                      width: appsize.width / 1.4,
                                      decoration: BoxDecoration(
                                          gradient: MyGradients.azanListBG,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              " ☀️ ",
                                              style: TextStyle(
                                                  fontSize:
                                                      appsize.height / 50),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 13.0),
                                              child: Text(
                                                "اذان ظهر : ",
                                                style: SettingsFonts.timetext,
                                              ),
                                            ),
                                            Text(
                                              subAzan.azansubmodelList[index]
                                                  .azanZohre
                                                  .toString(),
                                              style: SettingsFonts.timetext,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    //غروب آفتاب
                                    Container(
                                      height: appsize.height / 20,
                                      width: appsize.width / 1.4,
                                      decoration: BoxDecoration(
                                          gradient: MyGradients.azanListBG,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              " 🌇 ",
                                              style: SettingsFonts.emojiIcons,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 13.0),
                                              child: Text(
                                                "غروب آفتاب : ",
                                                style: SettingsFonts.timetext,
                                              ),
                                            ),
                                            Text(
                                              subAzan.azansubmodelList[index]
                                                  .ghorobAftab
                                                  .toString(),
                                              style: SettingsFonts.timetext,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    // اذان مغرب
                                    Container(
                                      height: appsize.height / 20,
                                      width: appsize.width / 1.4,
                                      decoration: BoxDecoration(
                                          gradient: MyGradients.azanListBG,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              " 🌙 ",
                                              style: SettingsFonts.emojiIcons,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 13.0),
                                              child: Text(
                                                "اذان مغرب : ",
                                                style: SettingsFonts.timetext,
                                              ),
                                            ),
                                            Text(
                                              subAzan.azansubmodelList[index]
                                                  .azanMaghreb
                                                  .toString(),
                                              style: SettingsFonts.timetext,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    //نیمه شب شرعی
                                    Container(
                                      height: appsize.height / 20,
                                      width: appsize.width / 1.4,
                                      decoration: BoxDecoration(
                                          gradient: MyGradients.azanListBG,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              " 🌌 ",
                                              style: SettingsFonts.emojiIcons,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 13.0),
                                              child: Text(
                                                "نیمه شب شرعی : ",
                                                style: SettingsFonts.timetext,
                                              ),
                                            ),
                                            Text(
                                              subAzan.azansubmodelList[index]
                                                  .nimeShabeSharie
                                                  .toString(),
                                              style: SettingsFonts.timetext,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                        );
                      }
                    }),
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
