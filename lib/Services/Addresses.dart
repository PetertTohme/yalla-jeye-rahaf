//
// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:yallajeye/Services/ApiLink.dart';
// import 'package:yallajeye/models/Adresses.dart';
// import 'package:yallajeye/models/getAllCities.dart';
//
// class AddressService {
//   Future<bool> createAddress({
//   @required  String addresstitle,
//     // String country,
//     @required    String cityId,
//     @required   String street,
//     @required   String buildingName,
//     @required   String description,
//     @required   String floor,
//   }) async {
//     Adresses address = Adresses();
//     try {
//       // SharedPreferences prefs = await SharedPreferences.getInstance();
//       var headers = {
//         'Authorization': 'Bearer ${ApiLink.deviceToken}'};
//       var respons = http.MultipartRequest(
//           'POST', Uri.parse(ApiLink.CreateAdress));
//       respons.headers.addAll(headers);
//       respons.fields.addAll({
//         //    'Id': prefs.getString("token").toString(),
//         'Title': addresstitle,
//         'description': description,
//         'cityId': cityId,
//         'Street': street,
//         'BuildingName': buildingName,
//         'FloorNumber': floor,
//
//       });
//
//
//       http.StreamedResponse responses = await respons.send();
//
//       var response = await http.Response.fromStream(responses);
//       print("ssssssssssssssssssssssssssssssssss${response.statusCode}");
//       if (response.statusCode == 200) {
//         // Map<String, dynamic> responseData = json.decode(response.body);
//         //  SharedPreferences prefs = await SharedPreferences.getInstance();
//
//
//         return true;
//       } else {
//         print(response.reasonPhrase);
//         return false;
//       }
//     } catch (e) {
//       print(e);
//       return false;
//     }
//   }
//
//   Future<bool> editAddress({
//     @required  String addresstitle,
//     // String country,
//     @required    String cityId,
//     @required   String street,
//     @required   String buildingName,
//     @required   String description,
//     @required   String floor,
//   }) async {
//     Adresses address = Adresses();
//     try {
//       // SharedPreferences prefs = await SharedPreferences.getInstance();
//       var headers = {
//         'Authorization': 'Bearer ${ApiLink.deviceToken}'};
//       var respons = http.MultipartRequest(
//           'PUT', Uri.parse(ApiLink.editAddress));
//       respons.headers.addAll(headers);
//       respons.fields.addAll({
//         //    'Id': prefs.getString("token").toString(),
//         'Title': addresstitle,
//         'description': description,
//         'cityId': cityId,
//         'Street': street,
//         'BuildingName': buildingName,
//         'FloorNumber': floor,
//
//       });
//
//
//       http.StreamedResponse responses = await respons.send();
//
//       var response = await http.Response.fromStream(responses);
//       print("ssssssssssssssssssssssssssssssssss${response.statusCode}");
//       if (response.statusCode == 200) {
//         // Map<String, dynamic> responseData = json.decode(response.body);
//         //  SharedPreferences prefs = await SharedPreferences.getInstance();
//
//
//         return true;
//       } else {
//         print(response.reasonPhrase);
//         return false;
//       }
//     } catch (e) {
//       print(e);
//       return false;
//     }
//   }
//
//   Future<List<getAllCitiesModel>> getAllCities() async{
//     List<getAllCitiesModel> l=[];
//     try {
//
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//
//
//
//       var headers = {
//         'Authorization': 'Bearer ${prefs.getString("token")}'
//       };
//       var request = http.Request('GET', Uri.parse(ApiLink.getAllCities));
//       request.headers.addAll(headers);
//
//       http.StreamedResponse responses = await request.send();
//       var response = await http.Response.fromStream(responses);
//       if (response.statusCode == 200) {
//
//         List<dynamic> responseData = json.decode(response.body);
//
//         // List<City> posts = List<City>.from(responseData.map((model)=> City.fromJson(model)));  //map to list
//
//         for(int i=0;i<responseData.length;i++){
//           l.add(getAllCitiesModel.fromJson(responseData[i]));
//         }
//         return l;
//
//       }
//       else {
//         print(response.reasonPhrase);
//         return [];
//       }
//
//
//
//     }catch(e){
//       print("eeeeeeeeeeeeeeeeeeeeeeeeeeeeeee:$e");
//       return [];
//     }
//   }
//
//
//
//
//
// }