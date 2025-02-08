
//sunModel
class AzzanSubmodel {
  String? city;
  String? azanSobh;
  String? toloeAftab;
  String? azanZohre;
  String? ghorobAftab;
  String? azanMaghreb;
  String? nimeShabeSharie;
  String? month;
  String? day;
  String? longitude;
  String? latitude;

  AzzanSubmodel({
    this.city,
    this.azanSobh,
    this.toloeAftab,
    this.azanZohre,
    this.ghorobAftab,
    this.azanMaghreb,
    this.nimeShabeSharie,
    this.month,
    this.day,
    this.longitude,
    this.latitude,
  });

  AzzanSubmodel.fromJson(Map<String, dynamic> json) {
  city = json["city"];
  azanSobh = json["azan_sobh"];
  toloeAftab = json["toloe_aftab"];
  azanZohre = json["azan_zohre"];
  ghorobAftab = json["ghorob_aftab"];
  azanMaghreb = json["azan_maghreb"];
  nimeShabeSharie = json["nime_shabe_sharie"];
  month = json["month"];
  day = json["day"];
  longitude = json["longitude"];
  latitude = json["latitude"];
}

}

