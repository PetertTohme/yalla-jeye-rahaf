import 'package:flutter/material.dart';

class RecentAddresses extends StatefulWidget {
  const RecentAddresses({Key key}) : super(key: key);

  @override
  _RecentAddressesState createState() => _RecentAddressesState();
}

class _RecentAddressesState extends State<RecentAddresses> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Recent Addresses'),
    );
  }
}
