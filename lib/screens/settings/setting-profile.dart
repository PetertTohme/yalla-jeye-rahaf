import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yallajeye/constants/colors_textStyle.dart';

import 'package:yallajeye/providers/user.dart';
import 'package:yallajeye/screens/navigation%20bar/navigation_bar.dart';

import '../../widgets/custom_birthday.dart';


class SettingProfile extends StatefulWidget {
  // final String imageUrl;

  // const SettingProfile({Key key, this.imageUrl=("assets/images/persons2.png")}) : super(key: key);

  @override
  _SettingProfileState createState() => _SettingProfileState();
}

class _SettingProfileState extends State<SettingProfile> {
  bool loadingButton=false;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  getPersonalInfo()async{
    final personalInfo=await Provider.of<UserProvider>(context,listen: false);
    personalInfo.loading=true;
    await personalInfo.getUserProfile();
    personalInfo.loading=false;
  }

  File image;
  File imageTemporary;
  Future PickImage(ImageSource source) async {
    try {
      // SharedPreferences pref = await SharedPreferences.getInstance();
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return 'null';
       imageTemporary = File(image.path);
      // pref.setString("imageUrl", File(image.path).path);
      setState(() {
        imageprof=null;
        this.image = imageTemporary;

      });
    } on PlatformException catch (e) {
      print('Failed : $e');
    }
  }

  String imageprof = "";
  bool loadingImage=false;

  //   setData(String imageUrl) async{
  //     SharedPreferences pref = await SharedPreferences.getInstance();
  //     setState(() {
  //       imageprof = pref.setString('imageUrl', imageUrl) as String;
  //     });
  //
  // }
  getData() async {
    SharedPreferences image = await SharedPreferences.getInstance();
    setState(() {
      imageprof = image.getString('imageUrl') ?? "";
      loadingButton = false;
    });
  }




  void initState() {
    getData();
    getPersonalInfo();
    super.initState();
  }


  // Future PickImage(ImageSource source) async {
  //   try {
  //     final image = await ImagePicker().pickImage(source: source);
  //     if (image == null) return;
  //     final imageTemporary = File(image.path);
  //     setState(() {
  //       this.image = imageTemporary;
  //     });
  //     // ignore: nullable_type_in_catch_clause
  //   } on PlatformException catch (e) {
  //     print('Failed : $e');
  //   }
  // }

  bool validate() {
    if (formkey.currentState != null) {
      if (formkey.currentState.validate()) {
        print('Validated');
        return true;
      } else {
        // ignore: avoid_print
        print('Not validated');
        return false;
      }
    }
    return false;
  }
  
  @override
  Widget build(BuildContext context) {
    final user=Provider.of<UserProvider>(context,listen: true);

    var screenHeight = MediaQuery
        .of(context)
        .size
        .height -

        MediaQuery
            .of(context)
            .padding
            .top;
    var qPortrait = MediaQuery
        .of(context)
        .orientation;
    return Scaffold(
      appBar: AppBar(
       title: Text("Settings", style: appBarText,),
        foregroundColor: yellowColor,),
      body: SingleChildScrollView(
        child: Container(
          height: qPortrait == Orientation.portrait
              ? (screenHeight) * 1
              : null,
          alignment: Alignment.center,
          padding: EdgeInsets.only(
              top: screenHeight * 0.01,
              left: 25,
              right: 25,
              bottom: screenHeight * 0.01),
          child: Column(
            children: [
              Container(
                margin:
                EdgeInsets.symmetric(vertical: screenHeight * 0.025),
                height: screenHeight * 0.25,
                child:  loadingImage
                    ? Center(child: CircularProgressIndicator())
                    : Center(
                  child: GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: user.loading
                          ? Center(
                        child: CircularProgressIndicator(),
                      )
                          : Center(
                          child: CircleAvatar(
                              radius: (52),
                              backgroundColor: Colors.white,
                               backgroundImage: image == null ? null : Image.file(imageTemporary).image,
                              child: ClipRRect(
                                borderRadius:
                                BorderRadius.circular(50),
                                child:imageprof!=null?Image.network(
                                  imageprof,
                                  fit: BoxFit.fill,
                                  width: 100,
                                  height: 100,
                                ):image==null?Image.asset("assets/images/user_icon_all.png"):null
                              )
                          )
                      ),
                    ),
                    onTap: () {
                      showModalBottomSheet(
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20))),
                          context: context,
                          builder: (context) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  leading: const Icon(
                                    Icons.camera,
                                    color: redColor
                                  ),
                                  title: const Text(
                                    'Camera',
                                    style: TextStyle(
                                      fontFamily: 'BerlinSansFB',
                                      fontSize: 14,
                                      color: redColor
                                    ),
                                  ),
                                  onTap: () async {
                                    Navigator.pop(context);
                                    setState(() {
                                      loadingImage = true;
                                    });
                                    await PickImage(ImageSource.camera);
                                      // await user.UpdateProfile(image);
                                    setState(() {
                                      loadingImage = false;
                                    });
                                  },
                                ),
                                ListTile(
                                  leading: const Icon(
                                    Icons.image,
                                    color: redColor
                                  ),
                                  title: const Text(
                                    'Gallery',
                                    style: TextStyle(
                                      fontFamily: 'BerlinSansFB',
                                      fontSize: 14,
                                      color: redColor,
                                    ),
                                  ),
                                  onTap: () async {
                                    Navigator.pop(context);
                                    setState(() {
                                      loadingImage = true;
                                    });
                                    await PickImage(ImageSource.gallery);

                                    // await user.UpdateProfile(image);
                                    // SharedPreferences prefs=await SharedPreferences.getInstance();
                                    // imageprof=prefs.getString('imageUrl');
                                    setState(() {
                                      loadingImage = false;
                                    });
                                    //    personalInfo.notifyListeners();
                                    // if (a != "") {
                                    //   setState(() {
                                    //     imageprof = a;
                                    //   });
                                    // }

                                    // personalInfo.loading=false;
                                  },
                                ),
                              ],
                            );
                          });
                    },
                  ),
                ),
              ),

              Container(
                child: Form(
                  // key: formkey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: user.name,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: screenHeight * 0.02,
                                horizontal: 25),
                            hintText: 'Name',
                            hintStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'BerlinSansFB'),
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(
                                    color: Colors.transparent)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(15)))),
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      TextFormField(
                        // validator: validateMobile,
                        controller: user.phoneNumber,
                        keyboardType: TextInputType.number,
                        autovalidateMode:
                        AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: screenHeight * 0.02,
                                horizontal: 25),
                            hintText: 'Phone Number',
                            hintStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'BerlinSansFB'),
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(
                                    color: Colors.transparent)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(15)))),
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      Container(
                        height: MediaQuery.of(context).size.height / 8,
                        child: CustomBirthdayPicker(
                          label: "Birthdate",
                          controller: user.birthday,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),

                      !loadingButton?TextButton(

                          onPressed: () async {
                            setState(() {
                              loadingButton = true;
                            });
                            validate();
                            var update = await user.UpdateProfile(image);
                            if (update) {
                              // Navigator.of(context).pop();
                              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=>Navigation()),(Route<dynamic> route) => false);
                              setState(() {
                                loadingButton = false;
                              });
                            } else {
                              setState(() {
                                loadingButton = false;
                              });
                              Fluttertoast.showToast(
                                  msg: "${user.message}",
                                  fontSize: 15,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 2,
                                  textColor: Colors.white,
                                  backgroundColor: redColor,
                                  toastLength: Toast.LENGTH_SHORT
                              );
                            };

                          },

                        child: const Text('Save',
                            style: TextStyle(
                              color: yellowColor,
                              fontFamily: 'BerlinSansFB',
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            )),
                        style: TextButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 40),
                            side: const BorderSide(
                                color: Colors.black, width: 1),
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(10))),
                            backgroundColor:
                            const Color(0xFF333333)),
                      ):Center(child: CircularProgressIndicator()),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

  // updateProfile(BuildContext context) async {
  //   if (nameController.text == pefUser.name &&
  //       phoneNController.text == pefUser.phoneNumber &&
  //       _selectedDate.toString() == pefUser.birthDate &&
  //       genderChoose == null &&
  //       image == null) {
  //     print("hola");
  //     print(nameController.text);
  //     print(phoneNController.text);
  //     print(_selectedDate);
  //     print(genderChoose);
  //     print("hola");
  //     buildShowDialog(context, "you didn't make any update");
  //     return;
  //   }
    // if (formkey.currentState.validate()) {
    //   formkey.currentState.save();
    //   try {
    //     setState(() {
    //       _isLoading2 = true;
    //     });
    //     _hasInternet = await InternetConnectionChecker().hasConnection;
    //     if (_hasInternet == false) {
    //       // showSimpleNotification(Text(
    //       //   'No internet Connection',
    //       //   textAlign: TextAlign.center,
    //       // ));
    //       _isLoading2 = false;
    //       return;
    //     }
    //
    //     String result = await ApiCall().updateProfile(
    //         phoneNumber: phoneNController.text ?? pefUser.phoneNumber,
    //         birthday: _selectedDate,
    //         image: image!=null?image:pefUser.imageUrl,
    //         gender: genderChoose != null
    //             ? genderChoose
    //             : pefUser.gender == "Male"
    //                 ? "1"
    //                 : "2",
    //         name: nameController.text ?? pefUser.name);
    //     if (result != null) {
    //       UserPreferences().updateUser(
    //         phoneNumber: phoneNController.text ?? pefUser.phoneNumber,
    //         name: nameController.text ?? pefUser.name,
    //         gender: genderChoose == null
    //             ? pefUser.gender
    //             : genderChoose == "1"
    //                 ? "Male"
    //                 : "Female",
    //         birthDate: _selectedDate != null
    //             ? _selectedDate.toString()
    //             : pefUser.birthDate,
    //       );
    //       UtilityImage.saveImageToPreferences(
    //           UtilityImage.base64String(image.readAsBytesSync()));
    //
    //       Navigator.pop(context);
    //       buildShowDialog(context, result);
    //       setState(() {
    //         _isLoading2 = false;
    //       });
    //     }
    //   } catch (e) {
    //     print(e);
    //     buildShowDialog(context, "sorry we couldn't update your profile");
    //     setState(() {
    //       _isLoading2 = false;
    //     });
    //   }
    // } else {
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //   content: WillPopScope(
      //     onWillPop: () async {
      //       ScaffoldMessenger.of(context).removeCurrentSnackBar();
      //       return true;
      //     },
      //     child: Text(
      //       'Please Enter all fields',
      //       textAlign: TextAlign.center,
      //     ),
      //   ),
      // ));
    //   buildShowDialog(context, "Please fill all fields");
    //   setState(() {
    //     _isLoading2 = false;
    //   });
    //   print('Not validated');
    // }

