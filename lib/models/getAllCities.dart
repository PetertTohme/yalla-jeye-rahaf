class getAllCitiesModel {
  int id = 0;
  String location = '';
  int deliveryPrice = 0;

  getAllCitiesModel();

  getAllCitiesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    location = json['location'];
    deliveryPrice = json['deliveryPrice'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['location'] = this.location;
  //   data['deliveryPrice'] = this.deliveryPrice;
  //   return data;
  // }
}
