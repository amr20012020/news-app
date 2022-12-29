import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier{
  String languageCode = 'en';

  void changeLanguage(String lang){
    languageCode = lang;
    notifyListeners();
  }


  List<dynamic> search = [];

  void getSearch(value){
    Center(child: CircularProgressIndicator());
    print(value);


  }


}