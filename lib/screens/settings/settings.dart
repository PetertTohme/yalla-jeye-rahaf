import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yallajeye/constants/colors_textStyle.dart';
import 'package:yallajeye/screens/auth/change-passwod.dart';
import 'package:yallajeye/screens/order/order_list.dart';
import 'package:yallajeye/screens/settings/emergencyNumber.dart';
import 'package:yallajeye/screens/order/promoCode.dart';
import 'package:yallajeye/screens/settings/setting-profile.dart';
import 'package:yallajeye/widgets/build_show-Dialog_logout.dart';

import '../../providers/user.dart';
import '../auth/signin_screen.dart';
import 'addresses/tabBar_addresses.dart';

class Settings extends StatefulWidget {
  const Settings({Key key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool _isLoading=false;
String email="";
String imageprof="";
  getData() async {
    final user=Provider.of<UserProvider>(context,listen: false);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      email = prefs.getString('email') ??"";
      imageprof = prefs.getString('imageUrl') ?? "";
      print(imageprof);
      _isLoading = false;
    });
  }
  void initState() {
    getData();
    super.initState();
  }
File image;
  @override
  Widget build(BuildContext context) {
    final user=Provider.of<UserProvider>(context,listen: true);
    final screenHeight=MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child:
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child:user.status==Status.isVerified? Row(
                  children: [
                    GestureDetector(
                      onTap: (){},

                      child: CircleAvatar(
                        // radius: (52),
                        // backgroundColor: Colors.white,
                        child:ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child:Image.network(
                            imageprof,
                            errorBuilder: (BuildContext context,
                                Object exception,
                                StackTrace stackTrace) {
                              return Image.asset("assets/images/profile.png"
                                  );
                            },
                            loadingBuilder: (BuildContext context,
                                Widget child,
                                ImageChunkEvent loadingProgress) {
                              if (loadingProgress == null)
                                return child;
                              return Padding(
                                padding:
                                const EdgeInsets.all(25.0),
                                child: Center(
                                  child:
                                  CircularProgressIndicator(
                                    value: loadingProgress
                                        .expectedTotalBytes !=
                                        null
                                        ? loadingProgress
                                        .cumulativeBytesLoaded /
                                        loadingProgress
                                            .expectedTotalBytes
                                        : null,
                                  ),
                                ),
                              );
                            },
                            fit: BoxFit.fill,
                            width: 100,
                            height: 100,
                          ),
                        ),
                        backgroundColor: Color(0xFFE2E2E2),
                        radius: screenHeight*0.05,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.05,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                         email,
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'BerlinSansFB'),
                        ),
                        SizedBox(
                          height: screenHeight * 0.01,
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ChangePassword()));
                            },
                            child: Text('Change password',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'BerlinSansFB',
                                    decoration:
                                    TextDecoration.underline,
                                    fontWeight: FontWeight.bold)))
                      ],
                    )
                  ],
                ):Container(
                    width: double.infinity,
                    height: screenHeight*0.2,
                    child:Image.asset("assets/images/logo.png")),
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    user.status==Status.isVerified?  TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(
                            builder: (_) => SettingProfile(
                              // imageUrl: imageUrl,
                            )));
                        //     .then((_) async {
                        //   await loadImageFromPreferences();
                        // });
                      },
                      child:const Text('Profile',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'BerlinSansFB',
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          )),
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              vertical: screenHeight * 0.035,
                              horizontal: 30),
                          side: BorderSide(
                              color: Colors.black, width: 1),
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10)))),
                    ):Container(),

                    // SizedBox(
                    //   height: screenHeight * 0.03,
                    // ),
                    // TextButton(
                    //   onPressed: () {
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) => PromoCode()));
                    //   },
                    //   child: Text('Promo Code',
                    //       style: TextStyle(
                    //         color: Colors.black,
                    //         fontFamily: 'BerlinSansFB',
                    //         fontWeight: FontWeight.bold,
                    //         fontSize: 15,
                    //       )),
                    //   style: TextButton.styleFrom(
                    //       padding: EdgeInsets.symmetric(
                    //           vertical: screenHeight * 0.035),
                    //       side: BorderSide(
                    //           color: Colors.black, width: 1),
                    //       shape: const RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.all(
                    //               Radius.circular(10)))),
                    // ),
                    SizedBox(
                      height: screenHeight * 0.03,
                    ),
                    user.status==Status.isVerified?   TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    TabBarAddresses()));
                      },
                      child:const Text('Addresses',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'BerlinSansFB',
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          )),
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              vertical: screenHeight * 0.035),
                          side:const BorderSide(
                              color: Colors.black, width: 1),
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10)))),
                    ):Container(),
                    SizedBox(
                      height: screenHeight * 0.03,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) =>const EmergencyNumber()));
                      },
                      child:const Text('Emergency Numbers',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'BerlinSansFB',
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          )),
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            vertical: screenHeight * 0.035,
                          ),
                          side:const BorderSide(
                              color: Colors.black, width: 1),
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10)))),
                    ),
                    SizedBox(
                        height:
                        MediaQuery.of(context).size.height * 0.05),
                    Column(
                      children: [
                        _isLoading
                            ? const CircularProgressIndicator()
                            :user.status==Status.isVerified?

                        TextButton(
                          onPressed: () async {
                            buildShowDialogLogout(context);
                          },
                          child:const Text('Logout',
                              style: TextStyle(
                                color: yellowColor,
                                fontFamily: 'BerlinSansFB',
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              )),
                          style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  vertical:
                                  screenHeight * 0.035,
                                  horizontal: 30),
                              side:const BorderSide(
                                  color: Colors.black,
                                  width: 1),
                                  backgroundColor: const Color(0xFF333333),
                              shape:
                              const RoundedRectangleBorder(

                                  borderRadius:
                                  BorderRadius.all(
                                      Radius.circular(
                                          10)))),
                        )

                            :TextButton(
                          onPressed: () async {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SignInScreen()));
                          },
                          child:const Text('Sign In',
                              style: TextStyle(
                                color: yellowColor,
                                fontFamily: 'BerlinSansFB',
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              )),
                          style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  vertical:
                                  screenHeight * 0.035,
                                  horizontal: 30),
                              side:const BorderSide(
                                  color: Colors.black,
                                  width: 1),
                              backgroundColor: const Color(0xFF333333),
                              shape:
                              const RoundedRectangleBorder(

                                  borderRadius:
                                  BorderRadius.all(
                                      Radius.circular(
                                          10)))),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),




      )
    //   Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         ElevatedButton(onPressed: ()async{
    //           final auth=Provider.of<UserProvider>(context,listen:false);
    //           await auth.logoutFacebook();
    //           // await auth.logout();
    //         }, child: Text("Logout")),
    //         TextButton(
    //         onPressed: () async {
    //   Navigator.push(
    //           context,
    //           MaterialPageRoute(
    //               builder: (context) =>
    //                   SignInScreen()));
    // },
    // child:const Text('Sign In',
    // style: TextStyle(
    // color: yellowColor,
    // fontFamily: 'BerlinSansFB',
    // fontWeight: FontWeight.bold,
    // fontSize: 15,
    // )),
    // style: TextButton.styleFrom(
    // padding: EdgeInsets.symmetric(
    // vertical:
    // screenHeight * 0.035,
    // horizontal: 30),
    // side:const BorderSide(
    // color: Colors.black,
    // width: 1),
    // backgroundColor: const Color(0xFF333333),
    // shape:
    // const RoundedRectangleBorder(
    //
    // borderRadius:
    // BorderRadius.all(
    // Radius.circular(
    // 10)))),
    // ),
    //       ],
    //     ),
    // ),

    );
  }
}
