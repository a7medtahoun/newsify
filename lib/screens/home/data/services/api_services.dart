import 'package:dio/dio.dart';
import 'package:newsify/screens/home/data/model/article.dart';

class ApiServices {
Dio dio = Dio();

 Future <List <Article>> fetchData()async{
  final response=await dio.get("https://newsapi.org/v2/top-headlines?country=us&apiKey=24876b1adfb146f8b3265f31e6748d74");
  List<Article> articles=[];
  List<dynamic> dataJson=response.data['articles'];
  for(var jsonItem in dataJson ){
     Article article= Article.fromJson(jsonItem);
     articles.add(article);
  }
  return articles;
 }
























}