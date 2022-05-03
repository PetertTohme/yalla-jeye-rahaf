import 'package:flutter/cupertino.dart';
import 'package:yallajeye/Services/ApiLink.dart';
import 'package:yallajeye/Services/HomePage.dart';
import 'package:yallajeye/Services/ServiceAPi.dart';
import 'package:yallajeye/models/home_page.dart';

class HomePageProvider extends ChangeNotifier {
  HomePageService _homePageService = HomePageService();
  ServiceAPi _serviceAPi=ServiceAPi();
  List<Ads> _services = [];

  List<Ads> get services => _services;

  set services(List<Ads> value) {
    _services = value;
  }

  List<Ads> _other = [];

  List<Ads> get other => _other;

  set other(List<Ads> value) {
    _other = value;
  }

  Map<String, dynamic> _allData = {};

  Map<String, dynamic> get allData => _allData;

  set allData(Map<String, dynamic> value) {
    _allData = value;
  }
List<Restaurants> _restaurants=[];

  List<Restaurants> get restaurants => _restaurants;

  set restaurants(List<Restaurants> value) {
    _restaurants = value;
  }

  List<ItemTypes> _itemTypes=[];

  List<ItemTypes> get itemTypes => _itemTypes;

  set itemTypes(List<ItemTypes> value) {
    _itemTypes = value;
  }

  // List<ItemTypes> _selectedItem=[];
  //
  //
  // List<ItemTypes> get selectedItem => _selectedItem;
  //
  // set selectedItem(List<ItemTypes> value) {
  //   _selectedItem = value;
  // }
  //
  // addItem(ItemTypes item){
  //   _selectedItem.add(item);
  //   notifyListeners();
  // }
  // removeItem(ItemTypes item){
  //   _selectedItem.remove(item);
  //   notifyListeners();
  // }
  //
  // List<int> _selectItemId=[];
  //
  // List<int> get selectItemId => _selectItemId;
  //
  // set selectItemId(List<int> value) {
  //   _selectItemId = value;
  // }
  //
  // selectItemById(){
  //   selectItemId=[];
  //   _selectedItem.forEach((element) {
  //     selectItemId.add(element.id);
  //   });
  //   notifyListeners();
  // }

  getHomePage() async{
    allData=await _serviceAPi.getAPi(ApiLink.HomePage, [], {});
    if(allData["error"]!=null){
      print(allData["error"]);
    }else{
      services=List<Ads>.from(
          allData["data"]["events"]["services"].map((model) => Ads.fromJson(model)));
      other = List<Ads>.from(
          allData["data"]["events"]["other"].map((model) => Ads.fromJson(model)));
      restaurants = List<Restaurants>.from(
          allData["data"]["restaurants"].map((model) => Restaurants.fromJson(model)));
      itemTypes = List<ItemTypes>.from(
          allData["data"]["itemTypes"].map((model) => ItemTypes.fromJson(model)));
    }
    notifyListeners();
  }
}
