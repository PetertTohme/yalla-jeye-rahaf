import 'package:flutter/material.dart';

class AddressCard extends StatefulWidget {
 final String title;
 final String city;
 final String street;
 final String buildingNum;
 final String floorNum;

 AddressCard(this.title,this.city,this.street,this.buildingNum,this.floorNum);

  @override
  _AddressCardState createState() => _AddressCardState();
}

class _AddressCardState extends State<AddressCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape:
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 1,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 10),
              child: Text(
                'Address',
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'BerlinSansFB',
                    fontWeight: FontWeight.normal,
                    color: Colors.black54),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, bottom: 10.0),
                child:
                Text(
                  "${widget.title}\n${widget.city}\n${widget.street}\n${widget.buildingNum}\n${widget.floorNum}",
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'BerlinSansFB',
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                ),
              ),
            ),
          ]),
    );
  }
}
