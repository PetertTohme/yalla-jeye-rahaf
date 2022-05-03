import 'dart:io';

import 'package:flutter/material.dart';

import '../constants/colors_textStyle.dart';




class TrackingCardN extends StatefulWidget {
  @override
  _TrackingCardNState createState() => _TrackingCardNState();
}

class _TrackingCardNState extends State<TrackingCardN> {
  // List<DriverOrder> _driverOrders = [];

  // _getDriverOrder() async {
  //   _driverOrders = await ApiCall().getDriverOrders();
  //   print('in function _getDriverOrder');
  //   print(_driverOrders[0].name);
  //   return _driverOrders;
  // }

  // final order = OrderDriver.orderToBeDelivered();
  bool _isLoading = false;
  bool delivered = false;
  bool delivery = false;
  bool _isDone = false;
  var appBar = AppBar(
    title: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/images/logo.png',
            // fit: BoxFit.cover,
            height: 40,
          ),
        ],
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    print ('_driverOrders');
    //print(_driverOrders[0].checkListItems.length);

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/images/logo.png',
                // fit: BoxFit.cover,
                height: 40,
              ),
              TextButton(
                  onPressed: () {
                    // buildDialogDelivery(
                    //     context,
                    //     "Are you sure that you want to mark\nthis order as delivered?",
                    //     () {});
                  },
                  child: Text(
                    "Delivered",
                    style: TextStyle(
                        fontFamily: 'BerlinSansFB',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: yellowColor,
                        decoration: TextDecoration.underline),
                  ))
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: FutureBuilder(
            // future: _getDriverOrder(),
            builder: (context, snapshot) {
              if(snapshot.hasError){
                return Center(
                  child: Text("No order founds"),
                );
              } else if(snapshot.connectionState==ConnectionState.waiting){
                return Center(
                  child: Text("Loading..."),
                );
              }

              if (snapshot.data == null) {
                return Container(
                  child: Center(
                    child: Text('No orders found'),
                  ),
                );
              } else
                return ListView.builder(
                  itemCount:snapshot.data.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Customer Information:",
                          style: TextStyle(
                              fontSize: 17,
                              fontFamily: "BerlinSansFB",
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        RichText(
                            text: TextSpan(
                                style: TextStyle(
                                    fontFamily: "BerlinSansFB",
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                children: [
                              TextSpan(text: "Name: "),
                              TextSpan(
                                  text: "${snapshot.data[index].name}",
                                  style:
                                      TextStyle(fontWeight: FontWeight.normal))
                            ])),
                        RichText(
                            text: TextSpan(
                                style: TextStyle(
                                    fontFamily: "BerlinSansFB",
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                children: [
                              TextSpan(text: "Address: "),
                              TextSpan(
                                  text: "${snapshot.data[index].address}",
                                  style:
                                      TextStyle(fontWeight: FontWeight.normal))
                            ])),
                        RichText(
                            text: TextSpan(
                                style: TextStyle(
                                    fontFamily: "BerlinSansFB",
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                children: [
                              TextSpan(text: "PN: "),
                              TextSpan(
                                  text: "${snapshot.data[index].phoneNumber}",
                                  style:
                                      TextStyle(fontWeight: FontWeight.normal))
                            ])),
                        SizedBox(
                          height: 5,
                        ),
                        RichText(
                            text: TextSpan(
                                style: TextStyle(
                                    fontFamily: "BerlinSansFB",
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                    color: Colors.black),
                                children: [
                              TextSpan(text: "Price:"),
                              TextSpan(
                                  text:
                                      " ${snapshot.data[index].deliveryPrice}L.L",
                                  style: TextStyle(
                                      decoration: TextDecoration.none))
                            ])),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Order Details",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              fontFamily: "BerlinSansFB"),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                            "Each time you finish gathering an item mark it in the list. Once finished with the delivery select delivered.",
                            style: TextStyle(
                                fontSize: 15, fontFamily: "BerlinSansFB")),
                        SizedBox(
                          height: 20,
                        ),
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) => Column(
                            children: [
                              Row(
                                children: [
                                  _isLoading
                                      ? SizedBox(
                                          child: CircularProgressIndicator(),
                                          height: 20.0,
                                          width: 20.0,
                                        )
                                      : GestureDetector(
                                          onTap: () => buildDialogPicked(
                                              context,
                                              'Make this item as picked?',
                                              snapshot.data[index]
                                                  .checkListItems[index].id),
                                          child: Container(
                                            height: 22,
                                            width: 22,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                //  color: snapshot.data[index].checkListItems[index].isDone ==
                                                color: _isDone
                                                    ? Colors.yellow
                                                    : Colors.red),
                                          ),
                                        ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Text(
                                      "${snapshot.data[index].checkListItems[index].item}",
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontFamily: "BerlinSansFB",
                                          color: _isDone == true
                                              ? Colors.black
                                              : Color(0xFF7A7A7A)),
                                    ),
                                  ),
                                  // SizedBox(
                                  //   width: 20,
                                  // ),
                                  // Text("${order.orderDetails[index]["check"]}"),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                          itemCount:0// _driverOrders[0].checkListItems.length//(snapshot.data[index].checkListItems).length,
                        )
                      ],
                    );
                  },
                );
            }),
      ),
    );
  }

  // setItemAsReady(data) async {
  //   setState(() {
  //     _isLoading = true;
  //   });
  //   try {
  //     String response = await ApiCall().markItemAsDone(data);
  //     print("inside function setItemAsReady");
  //     print('response');
  //     print(response);
  //     if (response == "Item marked as done") {
  //       setState(() {
  //         _isDone = true;
  //         _isLoading = false;
  //         buildShowDialog(context, "Item marked as done");
  //       });
  //     } else if (response == 'Item marked as undone') {
  //       setState(() {
  //         _isDone = false;
  //         _isLoading = false;
  //         buildShowDialog(context, "Item marked as undone");
  //       });
  //     } else {
  //       buildShowDialog(context, "status update failed");
  //       setState(() {
  //         _isDone = false;
  //         _isLoading = false;
  //       });
  //     }
  //   } on HttpException catch (e) {
  //     print('in http exception');
  //     var errorMessage = "status update failed";
  //     if (e.toString().contains("Item not found or is already done")) {
  //       errorMessage = "Item not found or is already done";
  //       buildShowDialog(context, errorMessage);
  //       setState(() {
  //         _isLoading = false;
  //         _isDone = false;
  //       });
  //     }
  //   } catch (e) {
  //     print(e);
  //       buildShowDialog(context, "status update failed");
  //     setState(() {
  //       _isLoading = false;
  //     });
  //   }
  // }

  buildDialogPicked(context, String text, data) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: Text(
          "This can not be undone!",
          style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              fontFamily: "BerlinSansFB"),
          textAlign: TextAlign.center,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 17,
                fontFamily: "BerlinSansFB",
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: "BerlinSansFB",
                          color: Colors.black),
                    )),
                TextButton(
                    onPressed: () {
                      // setItemAsReady(data);
                      // Navigator.pop(context);
                    },
                    child: Text("Confirm",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: "BerlinSansFB",
                            color: yellowColor))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
