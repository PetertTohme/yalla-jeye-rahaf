import 'package:flutter/material.dart';

class CustomSkeletonCard extends StatefulWidget {
  final double heightInMediaQuery;
  CustomSkeletonCard(this.heightInMediaQuery);

  @override
  State<CustomSkeletonCard> createState() => _CustomSkeletonCardState();
}

class _CustomSkeletonCardState extends State<CustomSkeletonCard> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery=MediaQuery.of(context).size;
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      child: Padding(
        padding:
        const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        child:SizedBox(height: mediaQuery.height*widget.heightInMediaQuery,width: double.infinity,)

        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     Container(
        //       width: MediaQuery.of(context).size.width * 1.0,
        //       child: FittedBox(
        //         child: Row(
        //           mainAxisAlignment:
        //           MainAxisAlignment.spaceBetween,
        //           children: [
        //             Text(
        //               'Order Nb ',
        //               style: TextStyle(
        //                   fontSize: mediaQuery.height * 0.02,
        //                   fontWeight: FontWeight.w900,
        //                   fontFamily: 'Berlin Sans'),
        //             ),
        //             SizedBox(
        //               width: MediaQuery.of(context).size.width *
        //                   0.1,
        //             ),
        //             Text.rich(
        //               TextSpan(
        //                 text: 'Status:',
        //                 style: TextStyle(
        //                     decoration:
        //                     TextDecoration.underline,
        //                     fontSize: mediaQuery.height * 0.02,
        //                     fontWeight: FontWeight.normal,
        //                     fontFamily: 'Berlin Sans'),
        //                 children: <TextSpan>[
        //                   TextSpan(
        //                     text: 'Pending',
        //                     style: TextStyle(
        //                         decoration: TextDecoration.none,
        //                         fontSize:
        //                         mediaQuery.height * 0.02,
        //                         fontWeight: FontWeight.normal,
        //                         fontFamily: 'Berlin Sans'),
        //                   ),
        //                   // can add more TextSpans here...
        //                 ],
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //     ),
        //     SizedBox(
        //       height: mediaQuery.height * 0.02,
        //     ),
        //     Row(
        //       children: [
        //         Text.rich(
        //           TextSpan(
        //             text: 'Details:',
        //             style: TextStyle(
        //                 decoration: TextDecoration.none,
        //                 fontSize: mediaQuery.height * 0.025,
        //                 fontWeight: FontWeight.normal,
        //                 fontFamily: 'Berlin Sans'),
        //             children: <TextSpan>[
        //               TextSpan(
        //                 text: "Order details"
        //                 // .length >
        //                 // 5
        //                 // ? "${value.map[index]['orderDetails'] ?? 'not set'}".replaceRange(
        //                 // 4,
        //                 // "${value.map[index]['orderDetails']}"
        //                 //     .length,
        //                 // "...") ??
        //                 // 'not set'
        //                 // : "${value.map[index]['orderDetails'] ?? 'not set'}",
        //                 ,
        //                 style: TextStyle(
        //                     decoration: TextDecoration.none,
        //                     fontSize: mediaQuery.height * 0.025,
        //                     fontWeight: FontWeight.normal,
        //                     fontFamily: 'Berlin Sans'),
        //               ),
        //               // can add more TextSpans here...
        //             ],
        //           ),
        //         ),
        //       ],
        //     ),
        //     SizedBox(
        //       height: mediaQuery.height * 0.025,
        //     ),
        //     Container(
        //       width: MediaQuery.of(context).size.width * 1.0,
        //       child: Row(
        //         mainAxisAlignment:
        //         MainAxisAlignment.spaceBetween,
        //         children: [
        //           Expanded(
        //             child: Text.rich(
        //               TextSpan(
        //                 text: 'Delivery fees:',
        //                 style: TextStyle(
        //                     decoration:
        //                     TextDecoration.underline,
        //                     fontSize: mediaQuery.height * 0.025,
        //                     fontWeight: FontWeight.w900,
        //                     fontFamily: 'Berlin Sans'),
        //                 children: <TextSpan>[
        //                   TextSpan(
        //                     // text: _liststatus[index].price,
        //                     // text:'${orderList[index].orders[index].deliveryPrice}',
        //                     text: '10 000 000 L.L',
        //                     style: TextStyle(
        //                         decoration: TextDecoration.none,
        //                         fontSize:
        //                         mediaQuery.height * 0.025,
        //                         fontWeight: FontWeight.w900,
        //                         fontFamily: 'Berlin Sans'),
        //                   ),
        //                   // can add more TextSpans here...
        //                 ],
        //               ),
        //             ),
        //           ),
        //           // SizedBox(
        //           //   width: MediaQuery.of(context).size.width * 0.1,
        //           // ),
        //           IconButton(
        //             onPressed: null,
        //             icon: Icon(
        //               Icons.arrow_forward_ios_rounded,
        //               size: mediaQuery.height * 0.025,
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
