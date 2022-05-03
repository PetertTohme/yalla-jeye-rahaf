import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yallajeye/constants/colors_textStyle.dart';

import '../../../providers/address.dart';
import 'RecentAddresses.dart';
import 'myAddress_settings.dart';

class TabBarAddresses extends StatefulWidget {
  // final int numTab;
  //
  // const TabBarAddresses(this.numTab);

  @override
  _TabBarAddresses createState() => _TabBarAddresses();
}

class _TabBarAddresses extends State<TabBarAddresses> {
  getData() async{
    final address=Provider.of<AddressProvider>(context,listen: false);
    await address.getAllAddresses();
    return ;
  }
  @override
  void initState() {
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Image.asset(
          'assets/images/logo.png',
          height: 40,
        ),
        foregroundColor: yellowColor,
      ),
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          // initialIndex: widget.numTab,
          child: Column(
            children: [
              Container(
                height: (MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top -
                        MediaQuery.of(context).padding.bottom) *
                    0.08,
                child: const TabBar(
                  indicatorColor: Colors.yellow,
                  indicatorWeight: 4,
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  tabs: [
                    Tab(
                      text: 'Addresses',
                    ),
                    Tab(
                      text: 'Recent',
                    ),

                  ],
                ),
              ),
              Expanded(
                child: TabBarView(children: [
                  MyAddressSettings(),
                  RecentAddresses(),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
