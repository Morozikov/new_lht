import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_lht_news/model/news.dart';

class NewsApi {
  static Future<NewsList> getHeadLines(
      {int page: 0}) async {
    print("request  $page");
    final response = await http.get(
        "https://newsapi.org/v2/top-headlines?country=ru&apiKey=652c201b63904ddc9d07bb5e7e84dbf2&page=$page&category=technology");

    return compute(parseResult, response.body);
  }

  static NewsList parseResult(String respond) {
    return NewsList.fromJson(json.decode(respond));
  }
}
