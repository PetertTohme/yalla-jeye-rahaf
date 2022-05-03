import 'package:shared_preferences/shared_preferences.dart';
import 'package:yallajeye/Services/ApiLink.dart';
import 'package:yallajeye/models/home_page.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomePageService {

 Future<Map<String,dynamic>> getHomePage() async {
   HomePageModel _HomePageModel=HomePageModel();
   try {
     SharedPreferences prefs = await SharedPreferences.getInstance();
     var headers = {
       'Authorization': 'Bearer ${prefs.getString("token")}'};
     var request = http.Request('GET', Uri.parse(ApiLink.HomePage));
     request.headers.addAll(headers);
     http.StreamedResponse responses = await request.send();
     var response = await http.Response.fromStream(responses);
     if (response.statusCode == 200) {
       Map<String,dynamic> responseData = json.decode(response.body);
       // order=DriverOrderModel.fromJson(responseData);
       return responseData;
     }else{
       return {};
     }
   } catch (e) {
     return {};
   }
  }
}
