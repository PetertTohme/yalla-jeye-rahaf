import 'package:flutter/material.dart';

import '../constants/colors_textStyle.dart';





class TrackingCard extends StatefulWidget {
  @override
  _TrackingCardState createState() => _TrackingCardState();
}

class _TrackingCardState extends State<TrackingCard> {
  // final order = OrderDriver.orderToBeDelivered();
  bool delivered = false;
  bool delivery = false;
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
    // var screenHeight = MediaQuery.of(context).size.height -
    //     appBar.preferredSize.height -
    //     MediaQuery.of(context).padding.top;

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
              delivery
                  ? TextButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
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
                                        "Are you sure that you want to mark\nthis order as delivered?",
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                              onPressed: () {},
                                              child: Text("Confirm",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily:
                                                          "BerlinSansFB",
                                                      color: yellowColor))),
                                        ],
                                      ),
                                    ],
                                  ),
                                ));
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
                  : Container()
            ],
          ),
        ),
      ),
      body: delivery
          ? SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
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
                              text:" order.customerName",
                              style: TextStyle(fontWeight: FontWeight.normal))
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
                              text: "order.address",
                              style: TextStyle(fontWeight: FontWeight.normal))
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
                              text: "order.phoneNumber",
                              style: TextStyle(fontWeight: FontWeight.normal))
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
                              text: " order.price L.L",
                              style: TextStyle(decoration: TextDecoration.none))
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
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          // setState(() {
                          //   if (order.orderDetails[index]["check"] == "1") {
                          //     order.orderDetails[index]["check"] = "0";
                          //   } else
                          //     order.orderDetails[index]["check"] = "1";
                          // });
                        },
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 22,
                                  width: 22,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.red
                                      // order.orderDetails[index]
                                      //             ["check"] ==
                                      //         "1"
                                      //     ? Colors.yellow
                                      //     : Colors.red),
                                ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "order.orderDetails[index][name]",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontFamily: "BerlinSansFB",
                                      color: Colors.red,
                                      // order.orderDetails[index]
                                      //             ["check"] ==
                                      //         "1"
                                      //     ? Colors.black
                                      //     : Color(0xFF7A7A7A)),
                                ),
                                // SizedBox(
                                //   width: 20,
                                // ),
                                // Text("${order.orderDetails[index]["check"]}"),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      ),
                      itemCount: 5,
                      // itemCount: order.orderDetails.length,
                    )
                  ],
                ),
              ),
            )
          : Center(
              child: Text(
                'No deliveries assigned!',
                style: TextStyle(
                  fontSize: 22,
                  fontFamily: 'BerlinSansFB',
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            delivery = true;
          });
        },
        child: Text('test'),
      ),
    );
  }
}

