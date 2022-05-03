import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:yallajeye/constants/colors_textStyle.dart';
import 'package:yallajeye/widgets/address_card.dart';

import '../../providers/order.dart';

class OrderInfo extends StatefulWidget {
  const OrderInfo({Key key}) : super(key: key);

  @override
  _OrderInfoState createState() => _OrderInfoState();
}

class _OrderInfoState extends State<OrderInfo> {
  double ratingOrder = 0;

  @override
  void initState() {
    final order = Provider.of<OrderProvider>(context, listen: false);
    ratingOrder = order.orderByIdModel.rating;
    super.initState();
  }

  bool loadingRating = false;
  bool btnRate = false;

  @override
  Widget build(BuildContext context) {
    final order = Provider.of<OrderProvider>(context, listen: true);
    int statusId = order.orderByIdModel.orderStatusId;
    return order.loadingButton
        ? Center(
            child: CircularProgressIndicator(),
          )
        : SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  statusId == 1
                      ? SvgPicture.asset('assets/images/loading.svg')
                      : statusId == 2
                          ? Image.asset('assets/images/moneynew.png')
                          : statusId == 4
                              ? SvgPicture.asset('assets/images/cancel.svg')
                              : statusId == 3
                                  ? Image.asset('assets/images/motornew.png')
                                  :
                                  //widget.status == "In Progress"? SvgPicture.asset('assets/images/motor.svg',fit: BoxFit.cover,) :
                                  statusId == 5
                                      ? SvgPicture.asset(
                                          'assets/images/delivered.svg')
                                      : Container(),
                  Text(
                    order.orderByIdModel.orderStatus,
                    style: const TextStyle(
                        fontSize: 40,
                        fontFamily: 'BerlinSansFB',
                        fontWeight: FontWeight.bold,
                        color: redColor),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: statusId == 1
                        ? const Text(
                            'Your order is under review, thank for you patiennce! ',
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'BerlinSansFB',
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            textAlign: TextAlign.center,
                          )
                        : statusId == 2
                            ? const Text(
                                'Pending your confirmation ',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'BerlinSansFB',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                textAlign: TextAlign.center,
                              )
                            : statusId == 3
                                ? const Text(
                                    'Your order is on the way',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'BerlinSansFB',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                    textAlign: TextAlign.center,
                                  )
                                : statusId == 4
                                    ? const Text(
                                        'Your order is Canceled ',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'BerlinSansFB',
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                        textAlign: TextAlign.center,
                                      )
                                    : statusId == 5
                                        ? const Text(
                                            'Your order has been delivered!',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontFamily: 'BerlinSansFB',
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                            textAlign: TextAlign.center,
                                          )
                                        : Container(),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    elevation: 1,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 20.0, top: 10),
                            child: Text(
                              'price',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'BerlinSansFB',
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black54),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding:
                                  EdgeInsets.only(left: 20.0, bottom: 10.0),
                              child: order.orderByIdModel.deliveryPrice == 0
                                  ? const Text(
                                      'Not set',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'BerlinSansFB',
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black),
                                    )
                                  : Text(
                                      '${order.orderByIdModel.deliveryPrice} L.L',
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'BerlinSansFB',
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black),
                                    ),
                            ),
                          ),
                        ]),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    elevation: 1,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 20.0, top: 10),
                            child: Text(
                              'Address',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'BerlinSansFB',
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black54),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                                padding:
                                    EdgeInsets.only(left: 20.0, bottom: 10.0),
                                child: Text(
                                  order.addressesModelByOrderId.title,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'BerlinSansFB',
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black),
                                )),
                          ),
                        ]),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    elevation: 1,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 20.0, top: 10),
                            child: Text(
                              'Delivery Type',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'BerlinSansFB',
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black54),
                            ),
                          ),
                          order.itemTyppesById.length == 0
                              ? Container()
                              : Container(
                                  height: 50,
                                  padding: EdgeInsets.only(left: 20),
                                  child: ListView.separated(
                                      shrinkWrap: true,
                                      separatorBuilder: (context, index) =>
                                          const SizedBox(
                                            width: 10,
                                          ),
                                      scrollDirection: Axis.horizontal,
                                      itemCount: order.itemTyppesById.length,
                                      itemBuilder: (context, index) {
                                        return Chip(
                                          label: Text(order
                                              .itemTyppesById[index].title),
                                          backgroundColor: yellowColor,
                                        );
                                      }),
                                ),
                          order.orderByIdModel.other.isEmpty
                              ? Container()
                              : Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 20.0),
                                    child: Chip(
                                      label: Text(order.orderByIdModel.other),
                                      backgroundColor: yellowColor,
                                    ),
                                  ),
                                )
                        ]),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(vertical: 16),
                  //   child: AddressCard(),
                  // ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    elevation: 1,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0, top: 10),
                            child: Text(
                              'Details',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'BerlinSansFB',
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black54),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding:
                                  EdgeInsets.only(left: 20.0, bottom: 10.0),
                              child: Text(
                                order.orderByIdModel.orderDetails,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'BerlinSansFB',
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ]),
                  ),
                  statusId == 1 || statusId == 2
                      ? Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            mainAxisAlignment: statusId == 1
                                ? MainAxisAlignment.center
                                : MainAxisAlignment.spaceAround,
                            children: [
                              TextButton(
                                onPressed: () async {
                                  if (statusId == 1) {
                                    setState(() {});
                                    await order.setOrderStatus(
                                        order.orderByIdModel.id, 4);
                                  } else {
                                    showDialog(
                                        barrierDismissible: false,
                                        context: context,
                                        builder: (context) {
                                          bool show = false;
                                          bool loadingBtn = false;
                                          int selectedNum = -1;
                                          int id = 0;
                                          return StatefulBuilder(
                                            builder: (context, setState) =>
                                                AlertDialog(
                                                    content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                ListView.builder(
                                                  shrinkWrap: true,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return ListTile(
                                                      title: Text(
                                                          order
                                                              .cancelOrderReason[
                                                                  index]
                                                              .stauts,
                                                          style: TextStyle(
                                                              color: selectedNum ==
                                                                      index
                                                                  ? redColor
                                                                  : yellowColor)),
                                                      leading: Radio(
                                                        groupValue: index,
                                                        onChanged: (int value) {
                                                          id = order
                                                              .cancelOrderReason[
                                                                  index]
                                                              .id;
                                                          print(id.toString());
                                                          if (index !=
                                                              order.cancelOrderReason
                                                                      .length -
                                                                  1) {
                                                            setState(() {
                                                              selectedNum =
                                                                  index;
                                                              show = false;
                                                              order
                                                                  .cancelOrderController
                                                                  .clear();
                                                            });
                                                          }
                                                          if (index ==
                                                              order.cancelOrderReason
                                                                      .length -
                                                                  1) {
                                                            setState(() {
                                                              selectedNum =
                                                                  index;
                                                              show = true;
                                                            });
                                                          }
                                                        },
                                                        value: selectedNum,
                                                      ),
                                                    );

                                                    CheckboxListTile(
                                                        side: BorderSide(
                                                            color: selectedNum ==
                                                                    index
                                                                ? redColor
                                                                : yellowColor),
                                                        activeColor: redColor,
                                                        controlAffinity:
                                                            ListTileControlAffinity
                                                                .leading,
                                                        title: Text(
                                                          order
                                                              .cancelOrderReason[
                                                                  index]
                                                              .stauts,
                                                          style: TextStyle(
                                                              color: selectedNum ==
                                                                      index
                                                                  ? redColor
                                                                  : yellowColor),
                                                        ),
                                                        value:
                                                            selectedNum == index
                                                                ? true
                                                                : false,
                                                        onChanged: (value) {
                                                          id = order
                                                              .cancelOrderReason[
                                                                  index]
                                                              .id;
                                                          print(id.toString());
                                                          if (index !=
                                                              order.cancelOrderReason
                                                                      .length -
                                                                  1) {
                                                            setState(() {
                                                              selectedNum =
                                                                  index;
                                                              show = false;
                                                              order
                                                                  .cancelOrderController
                                                                  .clear();
                                                            });
                                                          }
                                                          if (index ==
                                                              order.cancelOrderReason
                                                                      .length -
                                                                  1) {
                                                            setState(() {
                                                              selectedNum =
                                                                  index;
                                                              show = true;
                                                            });
                                                          }
                                                        });
                                                  },
                                                  itemCount: order
                                                      .cancelOrderReason.length,
                                                ),
                                                show
                                                    ? TextFormField(
                                                        controller: order
                                                            .cancelOrderController,
                                                        decoration: InputDecoration(
                                                            hintText:
                                                                "add what's your reason"),
                                                      )
                                                    : Container(),
                                                loadingBtn
                                                    ? Center(
                                                        child:
                                                            CircularProgressIndicator(),
                                                      )
                                                    : Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          TextButton(
                                                            onPressed:
                                                                () async {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child:
                                                                Text("Cancel"),
                                                          ),
                                                          TextButton(
                                                            onPressed:
                                                                () async {
                                                              if (id == 0) {
                                                                Fluttertoast.showToast(
                                                                    msg:
                                                                        "Please choose a reason",
                                                                    fontSize:
                                                                        15,
                                                                    gravity:
                                                                        ToastGravity
                                                                            .BOTTOM,
                                                                    timeInSecForIosWeb:
                                                                        2,
                                                                    textColor:
                                                                        Colors
                                                                            .white,
                                                                    backgroundColor:
                                                                        redColor,
                                                                    toastLength:
                                                                        Toast
                                                                            .LENGTH_SHORT);
                                                              } else if (id ==
                                                                      3 &&
                                                                  order
                                                                      .cancelOrderController
                                                                      .text
                                                                      .isEmpty) {
                                                                Fluttertoast.showToast(
                                                                    msg:
                                                                        "Please type your reason",
                                                                    fontSize:
                                                                        15,
                                                                    gravity:
                                                                        ToastGravity
                                                                            .BOTTOM,
                                                                    timeInSecForIosWeb:
                                                                        2,
                                                                    textColor:
                                                                        Colors
                                                                            .white,
                                                                    backgroundColor:
                                                                        redColor,
                                                                    toastLength:
                                                                        Toast
                                                                            .LENGTH_SHORT);
                                                              } else {
                                                                setState(() {
                                                                  loadingBtn =
                                                                      true;
                                                                });
                                                                await order
                                                                    .cancelOrder(
                                                                        order
                                                                            .orderByIdModel
                                                                            .id,
                                                                        id);
                                                                Navigator.pop(
                                                                    context);
                                                                setState(() {
                                                                  loadingBtn =
                                                                      false;
                                                                });
                                                              }
                                                            },
                                                            child:
                                                                Text("Confirm"),
                                                          ),
                                                        ],
                                                      )
                                              ],
                                            )),
                                          );
                                        });
                                  }
                                  // Navigator.pop(context);
                                  // setState(() {
                                  // _isLoadingC = false;
                                  // });
                                },
                                child: const Text('Cancel order',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'BerlinSansFB',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    )),
                                style: TextButton.styleFrom(
                                    padding: statusId == 1
                                        ? EdgeInsets.symmetric(
                                            vertical: 12, horizontal: 30)
                                        : EdgeInsets.fromLTRB(15, 15, 15, 15),
                                    side: const BorderSide(
                                        color: Colors.black, width: 1),
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)))),
                              ),
                              statusId == 2
                                  ? TextButton(
                                      onPressed: () async {
                                        setState(() {});
                                        await order.setOrderStatus(
                                            order.orderByIdModel.id, 3);
                                      },
                                      child: Text(
                                        'Accept order',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontFamily: 'BerlinSansFB',
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        padding:
                                            EdgeInsets.fromLTRB(15, 15, 15, 15),
                                        onPrimary:
                                            Color.fromRGBO(254, 212, 48, 1),
                                        primary: Color.fromRGBO(51, 51, 51, 1),
                                        shape: new RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(10.0),
                                        ),
                                      ),
                                    )
                                  : Container()
                            ],
                          ),
                        )
                      : statusId == 5
                          ? Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                children: [
                                  RatingBar.builder(
                                    initialRating: ratingOrder,
                                    ignoreGestures:
                                        order.orderByIdModel.rating == 0.0
                                            ? false
                                            : true,

                                    minRating: 1,
                                    itemSize: 30,
                                    // allowHalfRating: true,
                                    itemPadding: EdgeInsets.all(4),
                                    itemBuilder: (context, index) {
                                      switch (index) {
                                        case 0:
                                          return Icon(
                                            Icons.sentiment_very_dissatisfied,
                                            color: Colors.red,
                                          );
                                        case 1:
                                          return Icon(
                                            Icons.sentiment_dissatisfied,
                                            color: Colors.redAccent,
                                          );
                                        case 2:
                                          return Icon(
                                            Icons.sentiment_neutral,
                                            color: Colors.amber,
                                          );
                                        case 3:
                                          return Icon(
                                            Icons.sentiment_satisfied,
                                            color: Colors.lightGreen,
                                          );
                                        case 4:
                                          return Icon(
                                            Icons.sentiment_very_satisfied,
                                            color: Colors.green,
                                          );
                                        default:
                                          return Container();
                                      }
                                    },
                                    updateOnDrag: true,
                                    onRatingUpdate: (value) async {
                                      setState(() {
                                        ratingOrder = value;
                                      });
                                    },
                                  ),
                                  loadingRating
                                      ? Center(
                                          child: CircularProgressIndicator(),
                                        )
                                      : order.orderByIdModel.rating == 0
                                          ? ElevatedButton(
                                              onPressed: () async {
                                                setState(() {
                                                  loadingRating = true;
                                                });
                                                if (ratingOrder == 0) {
                                                  Fluttertoast.showToast(
                                                      msg:
                                                          "Please choose a face",
                                                      fontSize: 15,
                                                      gravity:
                                                          ToastGravity.BOTTOM,
                                                      timeInSecForIosWeb: 2,
                                                      textColor: Colors.white,
                                                      backgroundColor: redColor,
                                                      toastLength:
                                                          Toast.LENGTH_SHORT);
                                                } else {
                                                  await order.ratingOrder(
                                                      order.orderByIdModel.id,
                                                      ratingOrder.toInt());
                                                }
                                                setState(() {
                                                  loadingRating = false;
                                                });
                                              },
                                              child: Text(
                                                "Press to rate your order",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontFamily: 'BerlinSansFB',
                                                ),
                                              ),
                                              style: ElevatedButton.styleFrom(
                                                padding: EdgeInsets.fromLTRB(
                                                    15, 15, 15, 15),
                                                onPrimary: Color.fromRGBO(
                                                    254, 212, 48, 1),
                                                primary: Color.fromRGBO(
                                                    51, 51, 51, 1),
                                                shape:
                                                    new RoundedRectangleBorder(
                                                  borderRadius:
                                                      new BorderRadius.circular(
                                                          10.0),
                                                ),
                                              ),
                                            )
                                          : Container()
                                ],
                              ),
                            )
                          : Container(),
                ],
              ),
            ),
          );
  }
}
