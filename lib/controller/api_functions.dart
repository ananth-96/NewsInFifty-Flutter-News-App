import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/models/newsmodel.dart' show Newsmodel, NewsmodelBusiness, NewsmodelScience, NewsmodelSports;
import 'package:news_app/models/top10newsmodel.dart';

class NewsApi {

 static const String science='https://saurav.tech/NewsAPI/top-headlines/category/science/in.json';
  static const String business='https://saurav.tech/NewsAPI/top-headlines/category/business/in.json';
  static const String sports='https://saurav.tech/NewsAPI/top-headlines/category/sports/in.json';
  static const String top10='https://saurav.tech/NewsAPI/everything/cnn.json';

 static Future<List<NewsmodelScience>> getScienceNews() async {
  try {
    final response= await http.get(Uri.parse(science));
    if(response.statusCode==200){
      final List<dynamic>data=jsonDecode(response.body)['articles'];  
      return data.map((json)=>NewsmodelScience.fromJson(json)).toList().cast<NewsmodelScience>();
    }
    return [];
  } catch (e) {
    print('Error loading data $e');
      return [];
    
  }
}

static Future<List<NewsmodelBusiness>> getBusinessNews()async{
 try {
    final response= await http.get(Uri.parse(business));
    if(response.statusCode==200){
      final List<dynamic>data=jsonDecode(response.body)['articles'];
      return data.map((json)=>NewsmodelBusiness.fromJson(json)).toList().cast<NewsmodelBusiness>();
    }
    return [];
 } catch (e) {
   print('Error loading data $e');
   return[];
 }
  } 


  static Future<List<NewsmodelSports>> getSportsNews()async{
    try {
      final response= await http.get(Uri.parse(sports));
      if(response.statusCode==200){
        final List<dynamic>data=jsonDecode(response.body)['articles'];
        return data.map((json)=>NewsmodelSports.fromJson(json)).toList().cast<NewsmodelSports>();
      }
      return [];
    } catch (e) {
      print('Error loading data $e');
      return [];
    }
  }

  static Future <List<Top10NewsModel>> getTopTenNews()async{
    try {
      final response =await http.get(Uri.parse(top10));
      if(response.statusCode==200){
        final List<dynamic>data=jsonDecode(response.body)['articles'];
        return data.map((json)=>Top10NewsModel.fromJson(json)).toList().cast<Top10NewsModel>();
      }
      return[];
    } catch (e) {
      return [];
    }
  } 

}