// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/widgets.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:form_field_validator/form_field_validator.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
// import 'package:yallajeye/Services/ApiLink.dart';
// import 'package:yallajeye/constants/colors_textStyle.dart';
// import 'package:yallajeye/providers/user.dart';
// import 'package:yallajeye/screens/navigation%20bar/navigation_bar.dart';
// import 'package:yallajeye/widgets/build_show_dialog.dart';
// import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';
//
// import '../../models/user.dart';
// import '../../widgets/custom_gender.dart';
//
//
// class ProfileScreen extends StatefulWidget {
//   final String email, password, confirmPassword;
//
//   static const String screenRoute = 'profile_screen';
//
//   const ProfileScreen({this.email, this.password, this.confirmPassword});
//
//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }
//
// class _ProfileScreenState extends State<ProfileScreen> {
//
//   GlobalKey<FormState> formkey = GlobalKey<FormState>();
//   bool _isLoading = false;
//   bool _hasInternet;
//   String name = '', address = '', phoneNumber = '';
//   String validateMobile(String value) {
//     if (value.length != 8)
//       return 'Mobile Number must be of 8 digit';
//     else
//       return null;
//   }
//
//   validate() async {
//     // print("genderChoose:$genderChoose");
//     print("newDate:$_chosenDate");
//     if (!formkey.currentState.validate()) {
//       print("Not validated");
//       buildShowDialog(context, "Please Enter all fields");
//       setState(() {
//         _isLoading = false;
//       });
//       return;
//     } else {
//       print("validated");
//       // try {
//       //   FocusScope.of(context).unfocus();
//       //
//       //   setState(() {
//       //     _isLoading = true;
//       //   });
//       //   formkey.currentState.save();
//       //   _hasInternet = await InternetConnectionChecker().hasConnection;
//       //   if (_hasInternet == false) {
//       //     // showSimpleNotification(Text(
//       //     //   'No internet Connection',
//       //     //   textAlign: TextAlign.center,
//       //     // ));
//       //     _isLoading = false;
//       //     return;
//       //   }
//       //
//       //   // var response = await ApiCall().register(
//       //   //     name: name,
//       //   //     email: widget.email,
//       //   //     password: widget.password,
//       //   //     confirmPassword: widget.confirmPassword,
//       //   //     gender: genderChoose,
//       //   //     image: image,
//       //   //     birthday:selectedDate ,
//       //   //     phoneNumber: phoneNumber.toString());
//       //   setState(() {
//       //     _isLoading = false;
//       //     // User user = response;
//       //     // print(user.email);
//       //     // Navigator.pushReplacement(
//       //     //     context, MaterialPageRoute(builder: (context) => MainScreen()));
//       //     Navigator.of(context).pushAndRemoveUntil(
//       //         MaterialPageRoute(builder: (context) => MainScreen()),
//       //             (route) => false);
//       //   });
//       // }
//         // on HttpException catch (e) {
//       //   var errorMessage = 'Authentication failed';
//       //   if (e.toString().contains("is already taken")) {
//       //     errorMessage = 'Username ${widget.email} is already taken';
//       //     buildShowDialog(context, errorMessage);
//       //   } else if (e.toString().contains(
//       //       "Passwords must have at least one non alphanumeric character")) {
//       //     errorMessage =
//       //     'Passwords must have at least one non alphanumeric character';
//       //     buildShowDialog(context, errorMessage);
//       //   } else if (e.toString().contains("Passwords Don't match")) {
//       //     print('helooo');
//       //     errorMessage = "Passwords Don't match";
//       //     buildShowDialog(context, errorMessage);
//       //   } else if (e.toString().contains("User already exists")) {
//       //     print('helooo');
//       //     errorMessage = "User already exists";
//       //     buildShowDialog(context, errorMessage);
//       //   } else if (e.toString().contains(
//       //       "Passwords must have at least one lowercase ('a'-'z').")) {
//       //     print('helooo');
//       //     errorMessage =
//       //     "Passwords must have at least one lowercase ('a'-'z').";
//       //     buildShowDialog(context, errorMessage);
//       //   } else if (e.toString().contains(
//       //       "Passwords must have at least one uppercase ('A'-'Z').")) {
//       //     print('helooo');
//       //     errorMessage =
//       //     "Passwords must have at least one uppercase ('A'-'Z').";
//       //     buildShowDialog(context, errorMessage);
//       //   } else if (e.toString().contains("Failed to create account")) {
//       //     print('helooo');
//       //     errorMessage = "Failed to create account";
//       //     buildShowDialog(context, errorMessage);
//       //   } else
//       //     buildShowDialog(context, "unable to create account");
//       //   setState(() {
//       //     _isLoading = false;
//       //   });
//       // } catch (error) {
//       //   print(error);
//       //   var errorMessage = 'please try again later';
//       //   buildShowDialog(context, errorMessage);
//       //   setState(() {
//       //     _isLoading = false;
//       //   });
//       // }
//     }
//   }
//
//   //cutom class
//   String validatePass(value) {
//     if (value.isEmpty) {
//       return 'Required *';
//     } else if (value.length < 6) {
//       return 'Should Se At Least 6 Characters';
//     } else if (value.length > 15) {
//       return 'Should Not Be More Than 15 characters';
//     } else {
//       return null;
//     }
//   }
//
//   File image;
//
//   Future PickImage(ImageSource source) async {
//     try {
//       final image = await ImagePicker().pickImage(source: source);
//       if (image == null) return;
//       final imageTemporary = File(image.path);
//       setState(() {
//         this.image = imageTemporary;
//       });
//       // ignore: nullable_type_in_catch_clause
//     } on PlatformException catch (e) {
//       print('Failed : $e');
//     }
//   }
//
//   //added for dropdown
//   // String genderChoose;
//   // List <Map<String,dynamic>> listGender = [
//   //   {
//   //     "id": 1,
//   //     "gender":"male"
//   //   },
//   //   {
//   //     "id": 2,
//   //     "gender":"female"
//   //   },
//   // ];
// //added new
// //   DateTime selectedDate = new DateTime.now();
// //   DateTime _newDate;
// //   _datePicker() async {
// //      _newDate = await showDatePicker(
// //         context: context,
// //         initialDate: selectedDate,
// //         firstDate: DateTime(1930),
// //         lastDate: DateTime.now(),
// //         initialEntryMode: DatePickerEntryMode.calendar);
// //     if (_newDate != null) {
// //       setState(() {
// //         selectedDate = _newDate;
// //       });
// //     }
// //   }
//
//   DateTime _chosenDate = DateTime.now();
//   DateFormat _dateFormat = DateFormat('dd-MM-yyyy');
//   DateFormat _monthFormat = DateFormat('MMMM');
//   DateFormat _yearFormat = DateFormat('yyyy');
//   DateFormat _dayFormat = DateFormat('dd');
//   String _chosenMonth = "";
//   String _chosenYear = "";
//   String _chosenDay = "";
//   void showPicker(ctx) {
//     final auth = Provider.of<UserProvider>(context, listen: false);
//     DatePicker.showDatePicker(
//
//       ctx,
//       onMonthChangeStartWithFirstDate: true,
//       pickerTheme: DateTimePickerTheme(
//         showTitle: false,
//         // backgroundColor: LightColors.kLightYellow2,
//         itemTextStyle: TextStyle(
//           color: redColor,
//         ),
//       ),
//       initialDateTime: _chosenDate,
//       maxDateTime: DateTime.now(),
//       minDateTime: DateTime(1950),
//       dateFormat: 'MMMM-yyyy-dd',
//       onClose: () {},
//       onCancel: () => print('onCancel'),
//       onChange: (dateTime, List<int> index) {
//         setState(
//               () {
//             _chosenDate = dateTime;
//             _chosenDay = _dayFormat.format(dateTime);
//             _chosenMonth = _monthFormat.format(dateTime);
//             _chosenYear = _yearFormat.format(dateTime);
//             auth.birthday.text = _dateFormat.format(dateTime);
//
//
//
//
//           },
//         );
//       },
//     );
//   }
//   FocusNode _focusNode = FocusNode();
//   final _scaffKey = GlobalKey<ScaffoldState>();
//   @override
//   Widget build(BuildContext context) {
//     final authProvider = Provider.of<UserProvider>(context, listen: true);
//     print("imageeee:$image");
//     var screenHeight =
//         MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
//     var screenWidth = MediaQuery.of(context).size.width;
//     return SafeArea(
//       child: Scaffold(
//         key: _scaffKey,
//         body:
//         //LayoutBuilder(
//         //builder: (ctx, constraints) =>
//         SingleChildScrollView(
//           child: Container(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   //height: constraints.maxHeight * 0.09,
//                   padding: EdgeInsets.only(top: 0, left: 27),
//                   child: IconButton(
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                     icon: Icon(
//                       Icons.arrow_back,
//                       size: 40,
//                       color: Color.fromRGBO(254, 212, 48, 1),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * 0.02,
//                 ),
//                 // Container(
//                 //   width: double.infinity,
//                 //   child: Container(
//                 //     alignment: Alignment.center,
//                 //     height: screenHeight * 0.06,
//                 //     // padding: EdgeInsets.fromLTRB(37.0, 0, 0.0, 0.0),
//                 //     child: FittedBox(
//                 //       child: Text(
//                 //         'Complete Profile',
//                 //         style: TextStyle(
//                 //           fontSize: 40,
//                 //           fontWeight: FontWeight.w600,
//                 //           fontFamily: 'BerlinSansFB',
//                 //         ),
//                 //       ),
//                 //     ),
//                 //   ),
//                 // ),
//                 Container(
//                   alignment: Alignment.center,
//                   margin: EdgeInsets.symmetric(vertical: screenHeight * 0.025),
//                   height: screenHeight * 0.20,
//                   child: GestureDetector(
//                     onTap: () => _buildShowBottomSheet(),
//                     // child: CircleAvatar(
//                     //   backgroundColor: Color(0xFFE2E2E2),
//                     //   minRadius: 16,
//                     //   maxRadius: screenHeight * 0.2,
//                     //   backgroundImage: image == null ? null : FileImage(image),
//                     //   child: image == null
//                     //       ? Column(
//                     //           mainAxisAlignment: MainAxisAlignment.center,
//                     //           children: [
//                     //             Image.asset(
//                     //               "assets/images/profile.png",
//                     //               height: screenHeight * 0.15,
//                     //             ),
//                     //             SizedBox(
//                     //               height: 5,
//                     //             ),
//                     //             Text(
//                     //               'Add Profile',
//                     //               style: TextStyle(
//                     //                   fontSize: 9,
//                     //                   color: Color(0xFF878787),
//                     //                   fontWeight: FontWeight.bold,
//                     //                   decoration: TextDecoration.underline),
//                     //             ),
//                     //           ],
//                     //         )
//                     //       : Container(),
//                     // ),
//                     child: CircleAvatar(
//                       backgroundColor: Color(0xFFE2E2E2),
//                       minRadius: 10,
//                       maxRadius: screenHeight * 0.2,
//                       backgroundImage: image == null ? null : FileImage(image),
//                       child: image == null
//                           ? Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Image.asset(
//                             "assets/images/profile.png",
//                             height: screenHeight * 0.10,
//                           ),
//                           Text(
//                             'Choose picture',
//                             style: TextStyle(
//                                 fontSize: 12,
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.bold,
//                                 decoration: TextDecoration.none),
//                           ),
//                         ],
//                       )
//                           : Container(),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   // height: constraints.maxHeight * 0.35,
//                   //width: double.infinity,
//                   padding: EdgeInsets.only(top: 0.0, left: 37.0, right: 37.0),
//                   child: Column(
//                     children: [
//                       Center(
//                         child: Form(
//                           autovalidateMode: AutovalidateMode.onUserInteraction,
//                           key: formkey,
//                           child: _buildProfileTextFields(screenHeight),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: screenHeight * 0.03),
//                 Column(
//                   children: [
//                     Center(
//                       child: Container(
//                         child: _isLoading
//                             ? CircularProgressIndicator()
//                             : ElevatedButton(
//                           onPressed:()async{_chosenDate==null
//                           ? ()=> buildShowDialog(context, "Please fill all fields")
//                               : validate;
//                           setState(() {
//                             _isLoading = true;
//                           });
//                           if (formkey.currentState.validate() == false) {
//                             // ignore: avoid_print
//                             print('Not Validated');
//                             setState(() {
//                               _isLoading = false;
//                             });
//                             // reset!=null?
//                           } else {
//                             if (await authProvider.SignUpNew(image)) {
//                           setState(() {
//                           _isLoading = false;
//                           });
//                           Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                           builder: (context) => Navigation(),
//                           ),
//                           );
//                           } else {
//                           setState(() {
//                           _isLoading = false;
//                           });
//                           // _scaffKey.currentState.showSnackBar(
//                           // SnackBar(
//                           // content: Text(
//                           // "${authProvider.messageSignUp.toString()}"),
//                           // ),
//                           // );
//                           Fluttertoast.showToast(
//                               msg: "${authProvider.message}",
//                               fontSize: 15,
//                               gravity: ToastGravity.BOTTOM,
//                               timeInSecForIosWeb: 2,
//                               textColor: Colors.white,
//                               backgroundColor: redColor,
//                               toastLength: Toast.LENGTH_SHORT
//
//                           );
//
//                           // authProvider.messageSignUp = "";
//                           }
//                           }
//
//
//                             },
//                           child: Text('Sign up'),
//                           style: ElevatedButton.styleFrom(
//                             padding: EdgeInsets.fromLTRB(
//                                 screenHeight * 0.05,
//                                 screenHeight * 0.03,
//                                 screenHeight * 0.05,
//                                 screenHeight * 0.03),
//                             onPrimary: Color.fromRGBO(254, 212, 48, 1),
//                             primary: Color.fromRGBO(51, 51, 51, 1),
//                             shape: new RoundedRectangleBorder(
//                               borderRadius:
//                               new BorderRadius.circular(15.0),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                    //  Padding(
//                    //    padding: const EdgeInsets.only(top:28.0,right: 28.0),
//                    //    child: Align(
//                    //      alignment: Alignment.bottomRight,
//                    //      child: GestureDetector(child: Text('Skip',style: TextStyle(fontFamily: 'BerlinSansFB',fontSize: 20),),
//                    // onTap: (){
//                    //   Navigator.of(context).pushAndRemoveUntil(
//                    //       MaterialPageRoute(
//                    //           builder: (context) =>
//                    //               Navigation()),
//                    //           (Route<dynamic> route) => false);
//                    //        },
//                    //      ),
//                    //    ),
//                    //  )
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//         // )
//       ),
//     );
//   }
//
//   Widget _buildProfileTextFields(screenHeight) {
//     final authProvider = Provider.of<UserProvider>(context, listen: true);
//     return Column(
//       children: [
//         TextFormField(
//           // onSaved: (value) => name = value,
//           controller:authProvider.name ,
//           decoration: InputDecoration(
//             filled: true,
//             fillColor: Colors.white,
//             border: OutlineInputBorder(
//               borderSide: BorderSide.none,
//               borderRadius: BorderRadius.circular(15.0),
//             ),
//             contentPadding: EdgeInsets.all(15),
//             hintText: 'Name',
//             hintStyle: TextStyle(
//               fontSize: 15,
//               fontFamily: 'BerlinSansFB',
//               fontWeight: FontWeight.w600,
//               color: Color.fromRGBO(135, 135, 135, 1),
//             ),
//           ),
//           validator: MultiValidator([
//             RequiredValidator(errorText: 'Required *'),
//           ]),
//           autovalidateMode: AutovalidateMode.onUserInteraction,
//           keyboardType: TextInputType.text,
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.02,
//           //height: constraints.maxHeight * 0.02,
//         ),
//         CustomCupertinoPicker(
//
//           label: "Gender",
//
//           items: authProvider.genderIdList.map((value) {
//             return value.name;
//           }).toList(),
//
//           // events: address.regular.events,
//           selectedValue: 0,
//           inputType: TextInputType.text,
//           controller: authProvider.gender,
//         ),
//         // Container(
//         //   decoration: BoxDecoration(
//         //     color: Colors.white,
//         //     borderRadius: BorderRadius.circular(15),
//         //   ),
//         //   child: DropdownButton(
//         //     underline: SizedBox(),
//         //     focusColor: Colors.white,
//         //     hint: Padding(
//         //       padding: const EdgeInsets.only(left: 15.0),
//         //       child: Text(
//         //         "Gender",
//         //         style: TextStyle(
//         //             fontSize: 15,
//         //             fontWeight: FontWeight.w700,
//         //             fontFamily: 'BerlinSansFB'),
//         //       ),
//         //     ),
//         //     dropdownColor: Colors.white,
//         //     iconSize: 36,
//         //     isExpanded: true,
//         //
//         //     style: TextStyle(color: Colors.black54, fontSize: 15),
//         //     value: genderChoose,
//         //     onChanged: (newValue) {
//         //       setState(() {
//         //         genderChoose = newValue;
//         //         // validator:
//         //         //     (value) => value == null ? 'Please fill in your gender' : null;
//         //       });
//         //     },
//         //     items: listGender.map((valueItem) {
//         //       return DropdownMenuItem(
//         //         value: valueItem['id'].toString(),
//         //         child: Padding(
//         //           padding: const EdgeInsets.only(left: 15),
//         //           child: Text(valueItem['gender'].toString(),style: TextStyle(color: Colors.black),),
//         //         ),
//         //       );
//         //     }).toList(),
//         //   ),
//         // ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.02,
//           // height: constraints.maxHeight * 0.02,
//         ),
//         TextFormField(
//           // onSaved: (value) => phoneNumber = value,
//           controller: authProvider.phoneNumber,
//           validator: validateMobile,
//           decoration: InputDecoration(
//             filled: true,
//             fillColor: Colors.white,
//             border: OutlineInputBorder(
//               borderSide: BorderSide.none,
//               borderRadius: BorderRadius.circular(15.0),
//             ),
//             contentPadding: EdgeInsets.all(15),
//             hintText: 'Phone Number',
//             hintStyle: TextStyle(
//               fontSize: 15,
//               fontFamily: 'BerlinSansFB',
//               fontWeight: FontWeight.w600,
//               color: Color.fromRGBO(135, 135, 135, 1),
//             ),
//           ),
//           autovalidateMode: AutovalidateMode.onUserInteraction,
//           keyboardType: TextInputType.number,
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.02,
//           //height: constraints.maxHeight * 0.04,
//         ),
//         Container(
//           height: MediaQuery.of(context).size.height/11,
//           // margin: EdgeInsets.only(bottom: 5),
//           padding: EdgeInsets.all(5),
//           decoration: BoxDecoration(
//               color: Colors.white, //white
//               borderRadius: BorderRadius.all(Radius.circular(17))),
//           child: TextFormField(
//
//
//
//             decoration: InputDecoration(
//
//
//                 suffixIcon:Icon(
//                   Icons.keyboard_arrow_down,
//                   color: Colors.black,
//                   size: 24,
//                 ) ,
//
//                 alignLabelWithHint: true,
//                 labelStyle: TextStyle(
//                     fontFamily: 'BerlinSansFB',
//                     fontSize: _focusNode.hasFocus ? 20 : 18.0,//I believe the size difference here is 6.0 to account padding
//                     color:
//                     _focusNode.hasFocus ? Color(0xFF3F5521) : Colors.grey),
//                 labelText: "birthdate",
//                 filled: true,
//                 fillColor: Colors.white,
//                 border: OutlineInputBorder(
//                   borderRadius:
//                   BorderRadius.all(Radius.circular(15)),
//                   borderSide:  BorderSide.none,
//                   // const BorderSide(
//                   //   color: Colors.grey,
//                   // ),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//
//                     borderRadius: BorderRadius.circular(5.0),
//                     borderSide: const BorderSide(
//                       color: Color(0xFF3F5521),
//                     ))),
//             style: TextStyle(color: Colors.black),
//
//             focusNode: _focusNode,
//             controller: authProvider.birthday,
//             onTap: () {
//               _focusNode.unfocus();
//               showPicker(context);
//             },
//             readOnly: true,
//
//
//           ),
//         )
//         // SizedBox(
//         //   width: MediaQuery.of(context).size.width * 1,
//         //   child: Card(
//         //     shape:
//         //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//         //     elevation: 1,
//         //     child: Container(
//         //       height: screenHeight * 0.1,
//         //       width: double.maxFinite,
//         //       child: Padding(
//         //         padding: const EdgeInsets.only(
//         //             top: 8.0, bottom: 2.0, left: 14, right: 14),
//         //         child: Column(
//         //           mainAxisAlignment: MainAxisAlignment.start,
//         //           crossAxisAlignment: CrossAxisAlignment.start,
//         //           children: [
//         //             Row(
//         //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         //               children: [
//         //                 Text(
//         //                   "${DateFormat.yMMMEd().format(selectedDate)}",
//         //                   style: TextStyle(color: Colors.black54, fontSize: 18),
//         //                 ),
//         //                 IconButton(
//         //                     onPressed: () {
//         //                       _datePicker();
//         //                     },
//         //                     icon: Icon(
//         //                       Icons.calendar_today_rounded,
//         //                       color: Colors.black54,
//         //                     )),
//         //               ],
//         //             ),
//         //           ],
//         //         ),
//         //       ),
//         //     ),
//         //   ),
//         // ),
//       ],
//     );
//   }
//
//   _buildShowBottomSheet() {
//     return showModalBottomSheet(
//       shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(20), topRight: Radius.circular(20))),
//       context: context,
//       builder: (context) {
//         return Container(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               ListTile(
//                 leading: Icon(
//                   Icons.camera,
//                   color: Color.fromRGBO(
//                     232,
//                     47,
//                     28,
//                     1,
//                   ),
//                 ),
//                 title: Text(
//                   'Camera',
//                   style: TextStyle(
//                     fontFamily: 'BerlinSansFB',
//                     fontSize: 16,
//                     color: Color.fromRGBO(232, 47, 28, 1),
//                   ),
//                 ),
//                 onTap: () {
//                   PickImage(ImageSource.camera);
//                   Navigator.pop(context);
//                 },
//               ),
//               ListTile(
//                 leading: Icon(
//                   Icons.image,
//                   color: Color.fromRGBO(
//                     232,
//                     47,
//                     28,
//                     1,
//                   ),
//                 ),
//                 title: Text(
//                   'Gallery',
//                   style: TextStyle(
//                     fontFamily: 'BerlinSansFB',
//                     fontSize: 16,
//                     color: Color.fromRGBO(232, 47, 28, 1),
//                   ),
//                 ),
//                 onTap: () {
//                   PickImage(ImageSource.gallery);
//                   Navigator.pop(context);
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }