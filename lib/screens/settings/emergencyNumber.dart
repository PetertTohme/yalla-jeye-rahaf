import 'package:flutter/material.dart';
import 'package:yallajeye/constants/colors_textStyle.dart';

class EmergencyNumber extends StatefulWidget {
  const EmergencyNumber({Key key}) : super(key: key);

  @override
  _EmergencyNumberState createState() => _EmergencyNumberState();
}

class _EmergencyNumberState extends State<EmergencyNumber> {
  @override
  Widget build(BuildContext context) {
    final screenHeight=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: Text("Emergency Number",style: appBarText,),
      foregroundColor: yellowColor,),
      body: SafeArea(child: Center(
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.05,
            ),
            Image.asset(
              "assets/images/alert.png",
              width: screenHeight * 0.2,
              height: screenHeight * 0.2,
            ),
            SizedBox(
              height: screenHeight * 0.08,
            ),
            IntrinsicWidth(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/police-capp.png",
                          width: screenHeight * 0.1,
                          height: screenHeight * 0.1,
                        ),
                        SizedBox(
                          width: 31,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Police",
                              style: TextStyle(
                                  fontSize: screenHeight*0.02,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'BerlinSansFB'),
                            ),
                            Text(
                              "112",
                              style: TextStyle(
                                  fontFamily: "BerlinSansFB",
                                  fontWeight: FontWeight.bold,
                                  fontSize: screenHeight*0.06,
                                  color: Colors.black.withOpacity(0.5)),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/cross.png",
                          width: screenHeight * 0.1,
                          height: screenHeight * 0.1,
                        ),
                        SizedBox(
                          width: 31,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Red Cross",
                              style: TextStyle(
                                  fontSize: screenHeight*0.02,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'BerlinSansFB'),
                            ),
                            Text(
                              "140",
                              style: TextStyle(
                                  fontFamily: "BerlinSansFB",
                                  fontWeight: FontWeight.bold,
                                  fontSize: screenHeight*0.06,
                                  color: Colors.black.withOpacity(0.5)),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/hydrant.png",
                          width: screenHeight * 0.1,
                          height: screenHeight * 0.1,
                        ),
                        SizedBox(
                          width: 31,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Fire Dept.",
                              style: TextStyle(
                                  fontSize: screenHeight*0.02,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'BerlinSansFB'),
                            ),
                            Text(
                              "125",
                              style: TextStyle(
                                  fontFamily: "BerlinSansFB",
                                  fontWeight: FontWeight.bold,
                                  fontSize: screenHeight*0.06,
                                  color: Colors.black.withOpacity(0.5)),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),),
    );
  }
}
