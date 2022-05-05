import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:yallajeye/models/order.dart';

import '../../Providers/user.dart';
import '../../providers/order.dart';


class TrackingOrder extends StatefulWidget {
  int id;

  TrackingOrder(
    this.id,
  );

  @override
  _TrackingOrderState createState() => _TrackingOrderState();
}

class _TrackingOrderState extends State<TrackingOrder> {
  bool loading = true;

  getData() async {
    // print(w)

    final order = Provider.of<OrderProvider>(context, listen: false);
    // await order.getOrderStatus(widget.id);
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    OrderModel orderModel = OrderModel();
    final order = Provider.of<OrderProvider>(context, listen: true);
    int statusId = order.orderByIdModel.orderStatusId;
    return Scaffold(

        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child:  Center(
              child: statusId == 3
                  ? Image.asset('assets/images/TrackingInfoPhotos/inProgress.png')
                  : statusId == 5
                  ? Image.asset('assets/images/TrackingInfoPhotos/Delivered.png')
                  : statusId == 6
                  ? Image.asset('assets/images/TrackingInfoPhotos/OnMyWay.png')
                  : statusId == 7
                  ? Image.asset('assets/images/TrackingInfoPhotos/twoMinAway.png')
                  : Container()

// 1 2 4
            ),

          ),
        ));
  }
}
