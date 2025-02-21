import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:ooghatsharei/Components/url_static.dart';
import 'package:ooghatsharei/Model/azan_sub_model.dart';
import 'package:ooghatsharei/services/dioservices.dart';

class AzanSubController extends GetxController {
  RxList<AzzanSubmodel> azansubmodelList = RxList();
  RxBool loading = false.obs;
  String? citycontroller;
  @override
  onInit() {
    super.onInit();
    getAzansubItems(ConstURL.city);
  }

  getAzansubItems(String city) async {
    loading.value = true;
    var response = await DioServices().getMethod(ConstURL.baseUrl + city);

    if (response.statusCode == 200) {
      var result = response.data["result"];

      if (result is Map<String, dynamic>) {
        azansubmodelList.clear(); // حذف داده‌های قبلی
        azansubmodelList
            .add(AzzanSubmodel.fromJson(result)); // اضافه کردن تنها یک شیء
      }
      loading.value = false;
    }
  }
}
