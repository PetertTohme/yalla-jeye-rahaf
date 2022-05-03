import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletons/skeletons.dart';
import 'package:yallajeye/providers/address.dart';
import 'package:yallajeye/screens/settings/addresses/create_update_address.dart';
import 'package:yallajeye/widgets/custom_alert_dialog.dart';

import '../../../constants/colors_textStyle.dart';
import '../../../widgets/skeleton_card.dart';

class MyAddressSettings extends StatefulWidget {
  static const String screenroute = 'EditAddress';

  @override
  State<MyAddressSettings> createState() => _MyAddressSettingsState();
}

class _MyAddressSettingsState extends State<MyAddressSettings> {

@override
  void initState() {

    super.initState();
  }

  bool loading=true;
  @override
  Widget build(BuildContext context) {
    // context.read<AddressProvider>().getAllAddresses();
    final address=Provider.of<AddressProvider>(context,listen: true);
    var screenHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    return Scaffold(
      body:CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child:   Center(
              child: Column(
                children: [
                  Text(
                    "Delivery address",
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: "BerlinSansFB",
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // addNewAddressButton();
                        address.isCreateAddress=true;
                        Navigator.of(context).push(MaterialPageRoute(builder: (_)=> CreateAddress()));
                      },
                      child: Text('Add New Address'),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.fromLTRB(
                            screenHeight * 0.07,
                            screenHeight * 0.03,
                            screenHeight * 0.07,
                            screenHeight * 0.03),
                        onPrimary: Color.fromRGBO(254, 212, 48, 1),
                        primary: Color.fromRGBO(51, 51, 51, 1),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // SliverToBoxAdapter(
          //   child: Center(
          //     child:
          //
          //   ),
          //
          // ),
          address.loading?
          SliverToBoxAdapter(
            child: Skeleton(
              shimmerGradient:  LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  redColor,
                  Colors.red
                ],
              ),
              isLoading: address.loading,
              skeleton: SkeletonItem(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      CustomSkeletonCard(0.05),
                      CustomSkeletonCard(0.05),
                      CustomSkeletonCard(0.05),
                      CustomSkeletonCard(0.05),
                      CustomSkeletonCard(0.05),
                      CustomSkeletonCard(0.05),
                      CustomSkeletonCard(0.05),
                    ],
                  ),
                ),
              ),
              child: Container(),
            ),

          ): address.addresses.length==0?SliverToBoxAdapter(
            child: Center(child: Text("No address added yet")),
          ):
          SliverList(delegate: SliverChildBuilderDelegate(
              (context,index){
                return  Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  elevation: 5,
                  child: Container(
                    // height: screenHeight * 0.1,
                    width: double.maxFinite,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        // top: 5.0,
                        // bottom: 5.0,
                          left: 10,
                          right: 10),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(

                              address.addresses[index].title,
                              style:const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    address.isCreateAddress=false;
                                    address.addresstitle.text=address.addresses[index].title;
                                    address.cityChoosen.location=address.addresses[index].city;
                                    address.street.text=address.addresses[index].street;
                                    address.buildingName.text=address.addresses[index].buildingName;
                                    address.floor.text=address.addresses[index].floorNumber.toString();
                                    address.description.text=address.addresses[index].description;
                                    address.cityUpdateId=address.addresses[index].cityId;
                                    address.idOfAddressToUpdate=address.addresses[index].id;
                                    // Navigator.of(context).push(MaterialPageRoute(builder: (_)=>UpdateAddress(address.addresses[index].id,address.addresses[index].cityId)));
                                    Navigator.of(context).push(MaterialPageRoute(builder: (_)=>CreateAddress()));

                                  },
                                  icon:const Icon(
                                    Icons.edit_road,
                                    color: Colors.green,
                                  )),
                              IconButton(
                                  onPressed: () {
                                    showDialog(context: context, builder: (context){
                                     return CustomAlertDialog(title: "Do you want to delete this address?",content: "",
                                      cancelBtnFn: (){
                                        Navigator.pop(context);
                                      },confrimBtnFn: () async{
                                         Navigator.pop(context);
                                         setState(() {
                                           address.loading=true;
                                         });
                                         await address.deleteAddress(address.addresses[index].id);
                                         await address.getAllAddresses();
                                       },);
                                    });
                                    // await address.deleteAddress(address.addresses[index].id);
                                    // setState(() {
                                    //
                                    // });
                                    // await address.getAllAddresses();
                                  },
                                  icon:const Icon(
                                    Icons.cancel_outlined,
                                    color: Colors.red,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            childCount: address.addresses.length

          ))
        ],
      )
      
      // Column(
      //   // crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //
      //     SizedBox(height: screenHeight * 0.02),
      //     Center(
      //       child: Container(
      //         height: screenHeight * 0.08,
      //         child:
      //       ),
      //     ),
      //     SizedBox(height: screenHeight * 0.02),
      //     Container(
      //       height: screenHeight = MediaQuery.of(context).size.height -
      //           MediaQuery.of(context).padding.top * 1.2,
      //       width: double.infinity,
      //       padding: EdgeInsets.only(top: 15.0, bottom: 10.0),
      //       child: RefreshIndicator(
      //         onRefresh: () async {
      //           await Future.delayed(Duration(seconds: 2));
      //         },
      //
      //         child:address.loading?Center(child: CircularProgressIndicator(),): ListView.builder(
      //           physics: NeverScrollableScrollPhysics(),
      //           itemCount: address.addresses.length,
      //           itemBuilder: (context, index) =>
      //
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}

class MapState {
  final Map<dynamic, dynamic> _map = <dynamic, dynamic>{};
  static MapState instance = new MapState._();

  MapState._();

  set(dynamic Key, dynamic value) => _map[Key] = value;

  get(dynamic Key) => _map[Key];
}
