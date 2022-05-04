class OrderModel {
  int id=0;
  int orderNumber=0;
  String orderDetails="";
  String orderStatus="";
  int deliveryPrice=0;
  int orderStatusId=0;
  String createdAt="";

  OrderModel();

  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id']??0;
    orderNumber = json['orderNumber']??0;
    orderDetails = json['orderDetails']??"Not found";
    orderStatus = json['orderStatus']??"Not found";
    deliveryPrice = json['deliveryPrice']??0;
    orderStatusId=json['orderStatusId']??0;
    createdAt = json['createdAt']??"";
  }

}

class CancelOrderReasonModel {
  int id=0;
  String stauts="";

  CancelOrderReasonModel();

  CancelOrderReasonModel.fromJson(Map<String, dynamic> json) {
    id = json['id']??0;
    stauts = json['stauts']??"Not Found";
  }

}