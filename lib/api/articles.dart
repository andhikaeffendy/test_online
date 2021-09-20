import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:test_app/global/variable.dart';
import 'package:test_app/model/articles.dart';

class ApiArticles{
  String? status;
  int? totalResult;
  List<Articles>? articles;

  ApiArticles({this.status, this.totalResult, this.articles});

  ApiArticles.fromJson(Map<String, dynamic> json):
      status = json["status"],
      totalResult = json["totalResults"],
      articles = List<Articles>.from(json["articles"].map((e) => Articles.fromJson(e)));

  ApiArticles.fromStringJson(String jsonString) :
      this.fromJson(json.decode(jsonString));

  Map<String, dynamic> toJson() =>{
    "status" : status,
    "totalResult" : totalResult,
    "articles" : List<dynamic>.from(articles!.map((e) => e.toJson()))
  };

  String toStringJson() => json.encode(this.toJson());
  bool isSucces() => status == "ok";

  static Future<ApiArticles> futureApiGetArticles() async {
    var dio = Dio();
    String _url = url;
    try{
      Response response = await dio.get(_url,
          queryParameters: {"page" : 1, "apiKey" : apiKey, "country" : "id"}
      );
      print(response.toString());
      return ApiArticles.fromStringJson(response.toString());
    }on DioError catch (e) {
      if(e.response == null)
        return ApiArticles.fromStringJson(e.toString());
      else
        return ApiArticles.fromStringJson(e.toString());
    }
  }

}