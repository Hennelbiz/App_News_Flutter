import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movies_app_tutorial/Models/news_article.dart';
import 'package:movies_app_tutorial/Services/web_services.dart';
import 'package:movies_app_tutorial/ViewModels/news_article_ViewModel.dart';

enum LoadingStatus { completed, searching, empty }

class NewsArticleListViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.empty;
  List<NewsArticleViewModel> articles = [];

  void topCountryHeadlines(String country) async {
    List<NewsArticle> newsArticles = await WebService().fetchTopHeadlinesCountry(country);
    loadingStatus = LoadingStatus.searching;
    notifyListeners();

    this.articles = newsArticles
        .map((article) => NewsArticleViewModel(article: article))
        .toList();

    if (this.articles.isEmpty) {
      this.loadingStatus = LoadingStatus.empty;
    } else {
      this.loadingStatus = LoadingStatus.completed;
    }
    notifyListeners();
  }

  void topHeadlines() async {
    List<NewsArticle> newsArticles = await WebService().fetchTopHeadlines();
    loadingStatus = LoadingStatus.searching;
    notifyListeners();

    this.articles = newsArticles
        .map((article) => NewsArticleViewModel(article: article))
        .toList();

    if (this.articles.isEmpty) {
      this.loadingStatus = LoadingStatus.empty;
    } else {
      this.loadingStatus = LoadingStatus.completed;
    }
    notifyListeners();
  }
}
