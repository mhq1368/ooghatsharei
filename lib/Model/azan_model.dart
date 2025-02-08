class AzanModel {
  int? status;

  AzanModel({
    this.status,
  });

  AzanModel.fromJson(Map<String, dynamic> element) {
    status = element["status"];
  }
}



