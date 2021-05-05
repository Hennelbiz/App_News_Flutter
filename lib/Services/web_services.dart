import 'package:dio/dio.dart';
import 'package:movies_app_tutorial/Models/news_article.dart';
import 'package:movies_app_tutorial/utils/constants.dart';

class WebService
{
  var dio = new Dio();

    Future<List<NewsArticle>> fetchTopHeadlinesCountry(String country) async
  {
    final response = await dio.get(Constants.headlinesFor(country));
    if(response.statusCode == 200)
    {
      final result = response.data;
      Iterable list = result['articles'];
      return list.map((article) => NewsArticle.fromJson(article)).toList();
    }
    else
    {
      throw Exception("Fail to get the news");
    }
  }

  Future<List<NewsArticle>> fetchTopHeadlines() async
  {
    //String url = "https://newsapi.org/v2/everything?q=tesla&from=2021-05-05&sortBy=publishedAt&apiKey=f7d222157de7441f81ddd6ac250396ce";

    final response = await dio.get(Constants.TOP_HEADLINES_URL);
    if(response.statusCode == 200)
    {
      final result = response.data;
      Iterable list = result['articles'];
      return list.map((article) => NewsArticle.fromJson(article)).toList();
    }
    else
    {
      throw Exception("Fail to get the news");
    }
  }
}