import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yallajeye/screens/auth/signin_screen.dart';

import '../constants/colors_textStyle.dart';
import '../providers/user.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    final user=Provider.of<UserProvider>(context,listen:true);
    return Scaffold(
      body: user.status==Status.isVerified?Center(child: Text("Notifications appear here"),): Center(
        child: TextButton(
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
                  MediaQuery.of(context).size.height * 0.035,
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
      ),
    );
  }
}
