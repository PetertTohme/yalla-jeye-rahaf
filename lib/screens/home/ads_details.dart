
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:yallajeye/providers/homePage.dart';

import '../../constants/colors_textStyle.dart';


class AdsDetails extends StatefulWidget {
  final String title;
  final String description;
  final String imageUrl;

  AdsDetails(this.title, this.description, this.imageUrl);

  @override
  State<AdsDetails> createState() => _AdsDetailsState();
}

class _AdsDetailsState extends State<AdsDetails> {
  final TextStyle st20Bold = const TextStyle(
      fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'BerlinSansFB');

  bool selected = false;
  bool loading = false;
  

  @override
  
  int count = 0;

  @override
  Widget build(BuildContext context) {
    final Home =
    Provider.of<HomePageProvider>(context, listen: true);
    var qPortrait = MediaQuery.of(context).orientation;
    var screenHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              shadowColor: Colors.transparent,
              leading: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(150)),
                child: Center(
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: yellowColor,
                      size: 30,
                    ),
                  ),
                ),
              ),
              pinned: false,
              floating: false,
              expandedHeight: MediaQuery.of(context).size.height * 0.4,
              backgroundColor: Colors.transparent,
              flexibleSpace: FlexibleSpaceBar(
                background: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: double.maxFinite,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child:Image.network(
                      widget.imageUrl,
                      errorBuilder: (BuildContext context, Object exception, StackTrace stackTrace) {
                        return Image.asset('assets/images/logo.png',
                          height:
                          MediaQuery.of(context).size.height * 0.1,
                        );
                      },
                    )
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    // height: MediaQuery.of(context).size.height ,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(30),
                        )),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Text(
                            widget.title,
                            style: const TextStyle(
                                fontSize: 28,
                                fontFamily: 'BerlinSansFB',
                                fontWeight: FontWeight.bold),
                          ),
                        ),

                        //   Container(height: 100,),
                        Html(
                          data:widget.description,
                          style: {
                            "body": Style(
                              fontFamily: 'BerlinSansFB',
                              color: Colors.black87,
                              fontWeight: FontWeight.normal,
                            )
                          },
                        ),
                        //  Container(height: 100,),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final PreferredSize child;

  _SliverAppBarDelegate({this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return child;
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => child.preferredSize.height;

  @override
  // TODO: implement minExtent
  double get minExtent => child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return false;
  }
}
