import 'package:flutter/material.dart';

class OrderChat extends StatefulWidget {
  const OrderChat({Key key}) : super(key: key);

  @override
  _OrderChatState createState() => _OrderChatState();
}

class _OrderChatState extends State<OrderChat> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("Order Chat"),),
    );
  }
}
