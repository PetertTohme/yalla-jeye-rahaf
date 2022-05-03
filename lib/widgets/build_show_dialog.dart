import 'package:flutter/material.dart';

 buildShowDialog(context,message){
   print('messageeeeeeeeeeeee:$message');

  return   showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)),
      title: Text(
        message??"",
        style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: 'BerlinSansFB'),
      ),
    ),
  );
}
