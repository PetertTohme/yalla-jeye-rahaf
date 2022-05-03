class AddressesModel {
  int id = 0;
  String city = '';
  int cityId = 0;
  String street = '';
  String buildingName = '';
  int floorNumber = 0;
  String title = '';
  String description = '';

  AddressesModel();

  AddressesModel.fromJson(Map<String, dynamic> json) {
    id = json['id']??0;
    city = json['city']??"not found";
    cityId = json['cityId']??0;
    street = json['street']??"not found";
    buildingName = json['buildingName']??"not found";
    floorNumber = json['floorNumber']??0;
    title = json['title']??"not found";
    description = json['description']??"not found";
  }

// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = new Map<String, dynamic>();
//   data['id'] = this.id;
//   data['city'] = this.city;
//   data['cityId'] = this.cityId;
//   data['street'] = this.street;
//   data['buildingName'] = this.buildingName;
//   data['floorNumber'] = this.floorNumber;
//   data['title'] = this.title;
//   data['description'] = this.description;
//   return data;
// }
}
