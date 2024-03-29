import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/model/article.dart';

String apiKey = 'aafec704974649f595008b02ebf1e260';
String baseUrl = 'https://newsapi.org/v2';

class News{
  Future<List<Article>?> getNews() async {
    List<Article>? list;
    String url = '$baseUrl/top-headlines?country=us&apiKey=$apiKey';

    var response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      var result = data['articles'] as List;
      list = result.map((json) => Article.fromJson(json)).toList();
      print(response.body);
      return list;
    }else{
      throw Exception("404 not found");
    }
  }

  Future<List<Article>?> getNewsCategory(String category) async {
    List<Article> list;
    String url = '$baseUrl/https://newsapi.org/v2/top-headlines/sources?category=$category&apiKey=$apiKey';
    var response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      var result = data['article'] as List;
      list = result.map((json) => Article.fromJson(json)).toList();
      print(response.body);
      return list;
    }else{
      throw Exception("404 not fund");
    }

  }
}