import 'dart:developer';
import 'package:dio/dio.dart';
Dio dio = Dio();
class DioServices {
  Future<dynamic> getMethod(String url) async {
    

    dio.options.headers['content-Type'] = 'application/json'; //تعیین نوع هدر
    return await dio
        .get(url,
            options: Options(responseType: ResponseType.json, method: 'GET'))
        .then((responseval) {
      log(responseval.toString());
      return responseval;
    });
  }
}

class DioServices1 {
  Future<dynamic> getPrayerTimes(String token, String city) async {
    // ساخت URL با پارامترهای مورد نیاز
    String apiUrl =
        'https://one-api.ir/owghat/?token=$token&city=$city&en_num=false';

    dio.options.headers['content-Type'] = 'application/json';

    return await dio
        .get(
      apiUrl,
      options: Options(responseType: ResponseType.json, method: 'GET'),
    )
        .then((response) {
      log(response.toString()); // لاگ پاسخ دریافتی
      return response.data; // بازگرداندن داده‌های دریافتی
    }).catchError((error) {
      log(error.toString()); // لاگ خطا در صورت وجود مشکل
      throw error; // پرتاب خطا به caller
    });
  }
}
