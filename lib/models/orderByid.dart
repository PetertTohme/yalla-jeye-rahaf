import 'package:yallajeye/models/Adresses.dart';
import 'package:yallajeye/models/home_page.dart';

class OrderByIdModel {
  int id=0;
  String orderDetails="";
  String orderStatus="";
  int deliveryPrice=0;
  int orderStatusId=0;
  String createdAt="";
  AddressesModel address=AddressesModel();
  List<CheckList> checkList=[];
  List<ItemTypes> itemTypes=[];
  String other="";
  double rating=0.0;
  bool tracking=false;

  OrderByIdModel();

  OrderByIdModel.fromJson(Map<String, dynamic> json) {
    id = json['id']??0;
    orderDetails = json['orderDetails']??"Not found";
    orderStatus = json['orderStatus']??"Not found";
    deliveryPrice = json['deliveryPrice']??0;
    orderStatusId = json['orderStatusId']??0;
    createdAt = json['createdAt']??"Not found";
    address =
    json['address'] != null ? new AddressesModel.fromJson(json['address']) : AddressesModel();
    if (json['checkList'] != null) {
      checkList = <CheckList>[];
      json['checkList'].forEach((v) {
        checkList.add(new CheckList.fromJson(v));
      });
    }
    if (json['itemTypes'] != null) {
      itemTypes = <ItemTypes>[];
      json['itemTypes'].forEach((v) {
        itemTypes.add(new ItemTypes.fromJson(v));
      });
    }
    other = json['other']??"Not found";
    rating=json['rating'].toDouble()??0.0;
    tracking=json['tracking']??false;
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['orderDetails'] = this.orderDetails;
  //   data['orderStatus'] = this.orderStatus;
  //   data['deliveryPrice'] = this.deliveryPrice;
  //   data['orderStatusId'] = this.orderStatusId;
  //   data['createdAt'] = this.createdAt;
  //   if (this.address != null) {
  //     data['address'] = this.address!.toJson();
  //   }
  //   if (this.checkList != null) {
  //     data['checkList'] = this.checkList!.map((v) => v.toJson()).toList();
  //   }
  //   if (this.itemTypes != null) {
  //     data['itemTypes'] = this.itemTypes!.map((v) => v.toJson()).toList();
  //   }
  //   data['other'] = this.other;
  //   return data;
  // }
}



class CheckList {
  int id=0;
  String item="";
  bool isDone=false;

  CheckList();

  CheckList.fromJson(Map<String, dynamic> json) {
    id = json['id']??0;
    item = json['item']??"Not found";
    isDone = json['isDone']??false;
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['item'] = this.item;
  //   data['isDone'] = this.isDone;
  //   return data;
  // }
}

// class ItemTypes {
//   int id=0;
//   String title="";
//
//   ItemTypes();
//
//   ItemTypes.fromJson(Map<String, dynamic> json) {
//     id = json['id']??0;
//     title = json['title']??"Not found";
//   }
//
//   // Map<String, dynamic> toJson() {
//   //   final Map<String, dynamic> data = new Map<String, dynamic>();
//   //   data['id'] = this.id;
//   //   data['title'] = this.title;
//   //   return data;
//   // }
// }