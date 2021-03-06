import 'package:flutter/material.dart';

import 'const.dart';

class CustomDialog extends StatelessWidget {
  final String title, description;
final Widget button1,button2;
final bool oneOrtwo;

  CustomDialog({
    @required this.title,
    @required this.description,
    @required this.button1,
    @required this.oneOrtwo,
    this.button2,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Consts.padding),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            top: Consts.avatarRadius + Consts.padding,
            bottom: Consts.padding,
            left: Consts.padding,
            right: Consts.padding,
          ),
          margin: EdgeInsets.only(top: Consts.avatarRadius),
          decoration: new BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(Consts.padding),
            boxShadow: [
              BoxShadow(
                color: Colors.white,
                blurRadius: 10.0,
                offset: const Offset(0.0, 0.0),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // To make the card compact
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                ),textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.0),
              Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 24.0),
             oneOrtwo? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: button1,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: button2,
                  ),
                ],
              ) :
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 Align(
                   alignment: Alignment.center,
                   child:button1,
                 ),
               ],
             )
            ],
          ),
        ),
        // Positioned(
        //   left: Consts.padding,
        //   right: Consts.padding,
        //   child: CircleAvatar(
        //     backgroundColor: Colors.green,
        //     radius: Consts.avatarRadius,
        //     child: Text(
        //       "FAISAL",
        //       style: TextStyle(color: Colors.white),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
