import 'package:dio/dio.dart';
import 'package:newsify/screens/home/data/model/article.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiServices {
  //https://newsapi.org/v2/top-headlines?country=us&apiKey=24876b1adfb146f8b3265f31e6748d74

late Dio dio;
  static const String baseUrl = "https://newsapi.org/v2/";
  static const String apiKey = "24876b1adfb146f8b3265f31e6748d74";

  ApiServices() {
    dio = Dio(BaseOptions(baseUrl: baseUrl));
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
      ),
    );
  }

 Future<List<Article>> fetchData({String country = "us"}) async {
    final response = await dio.get(
      "top-headlines",
      queryParameters: {'country': country, 'apiKey': apiKey},
    );
    List<Article> articles = [];
    List<dynamic> dataJson = response.data['articles'];
    for (var jsonItem in dataJson) {
      Article article = Article.fromJson(jsonItem);
      articles.add(article);
    }
    return articles;
  }
}
