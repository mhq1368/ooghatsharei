import 'package:get/get.dart';
import 'package:ooghatsharei/Components/url_static.dart';
import 'package:ooghatsharei/Model/azan_model.dart';
import 'package:ooghatsharei/services/dioservices.dart';

class AzanController extends GetxController {
 
  Rx<AzanModel> azanList = AzanModel().obs;
  RxBool loading = false.obs;
  @override
  onInit() {
    super.onInit();
    getAzanItems();
  }

  getAzanItems() async {
    loading.value = true;
    var response =
        await DioServices().getMethod(ConstURL.baseUrl + ConstURL.city);

    if (response.statusCode == 200) {
      azanList.value = AzanModel.fromJson(response.data);

     

      loading.value = false;
    }
  }
}
