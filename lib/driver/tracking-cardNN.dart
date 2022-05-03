import 'package:flutter/material.dart';

class TrackingCardNN extends StatefulWidget {
  const TrackingCardNN({Key key}) : super(key: key);

  @override
  State<TrackingCardNN> createState() => _TrackingCardNNState();
}

class _TrackingCardNNState extends State<TrackingCardNN> {
  bool button = true;
  final appBar = AppBar(
    title: Text('Orders'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
        body: button
            ? Center(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      button = !button;
                    });
                    print(button);
                  },
                  child: Text('Start'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.height * 0.05,
                        MediaQuery.of(context).size.height * 0.04,
                        MediaQuery.of(context).size.height * 0.05,
                        MediaQuery.of(context).size.height * 0.04),
                    onPrimary: Color.fromRGBO(254, 212, 48, 1),
                    primary: Color.fromRGBO(51, 51, 51, 1),
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(15.0),
                    ),
                  ),
                ),
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        print("Testttt");
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Location: zahle"),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              Text("items: tawouk pepsi 5yar banadoura..."),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Next'),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.height * 0.05,
                            MediaQuery.of(context).size.height * 0.04,
                            MediaQuery.of(context).size.height * 0.05,
                            MediaQuery.of(context).size.height * 0.04),
                        onPrimary: Color.fromRGBO(254, 212, 48, 1),
                        primary: Color.fromRGBO(51, 51, 51, 1),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ));
  }
}
