import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:newsapp/models/NewsDataModel.dart';
import 'package:newsapp/shared/constants/constants.dart';

import '../../../models/SourcesResponse.dart';

class ApiManager{

  static Future<SourcesResponse> getSources(String category)async{
    var URL = Uri.https(BASE, '/v2/top-headlines/sources',{
      "apikey" : API_KEY,"category" : category});
    try{
      Response sources = await http.get(URL);
      print(sources.statusCode);
      var json = jsonDecode(sources!.body);
      SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
      return sourcesResponse;
    }catch(e){
      throw e;
    }
  }

  static Future<NewsDataModel> getNewsData(String sourceId)async{
    Uri URL = Uri.https(BASE,'/v2/everything',{
      "apikey" : API_KEY,
      "sources" : sourceId,
    });
   Response response = await http.get(URL);
   var json = jsonDecode(response.body);
   NewsDataModel newsDataModel = NewsDataModel.fromJson(json);
   return newsDataModel;
  }
}