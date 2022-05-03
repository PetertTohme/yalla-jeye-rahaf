

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yallajeye/constants/colors_textStyle.dart';
import 'package:yallajeye/screens/auth/signin_screen.dart';
import 'package:yallajeye/screens/navigation%20bar/navigation_bar.dart';
import 'package:yallajeye/screens/splash_screen.dart';

import '../providers/user.dart';



 buildShowDialogLogout(ctx){
   final user=Provider.of<UserProvider>(ctx,listen:false);
  return showDialog(
      context: ctx,
      builder: (ctx) =>
          AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(
                15)),
        title: Text(
          "Hop to see you again!",
          style: TextStyle(
              fontSize: 17,
              fontWeight:
              FontWeight.bold,
              fontFamily:
              "BerlinSansFB"),
          textAlign: TextAlign.center,
        ),
        content: Column(
          mainAxisSize:
          MainAxisSize.min,
          children: [
            Text(
              "Are you sure you want to\nlog out?",
              style: TextStyle(
                fontSize: 17,
                fontFamily:
                "BerlinSansFB",
              ),
              textAlign:
              TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment:
              MainAxisAlignment
                  .spaceBetween,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.of(
                          ctx)
                          .pop();
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                          fontSize:
                          15,
                          fontWeight:
                          FontWeight
                              .bold,
                          fontFamily:
                          "BerlinSansFB",
                          color: Colors
                              .black),
                    )),
                TextButton(
                    onPressed: ()async {
                      // DefaultCacheManager().emptyCache();
                      // imageCache.clear();
                      // imageCache.clearLiveImages();
                   print("logout");
                       // UserPreferences().removeUser();
                     // await GoogleSignInApi.logout();
                      // await FacebookSignInApi.logout();
                       final SharedPreferences prefs = await SharedPreferences.getInstance();
                       prefs.clear();
                      // print('logout');
                      // User user=await UserPreferences().getUser();
                      // var token = await UserPreferences().getToken();
                      // print('token:$token');
                      // print('user name:${user.name}');
                   user.status =
                       Status.isAnonymous;
                    //Navigator.pushReplacement(ctx, MaterialPageRoute(builder: (context)=>SignInScreen()));
                      Navigator.of(ctx).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => SplashScreen()), (route) => false);
                              user.clearAllTextController();
                    },
                    child: Text(
                        "Confirm",
                        style: TextStyle(
                            fontSize:
                            15,
                            fontWeight: FontWeight
                                .bold,
                            fontFamily:
                            "BerlinSansFB",
                            color:
                            yellowColor))),
              ],
            ),
          ],
        ),

      )
  );
}

