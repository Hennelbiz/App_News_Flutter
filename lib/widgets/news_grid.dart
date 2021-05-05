import 'package:flutter/material.dart';
import 'package:movies_app_tutorial/ViewModels/news_article_ViewModel.dart';
import 'package:movies_app_tutorial/screens/news_article_detail_screen.dart';
import 'package:movies_app_tutorial/widgets/circle_widget.dart';

class NewsGrid extends StatelessWidget {
  final List<NewsArticleViewModel> articles;
  NewsGrid({this.articles});

  void _showNewsArticleDetails(context, article) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) {
          return NewsArticleDetailScreen(article: article);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (_, index) {
        var article = articles[index];
        //return Text(listViewModel.articles[index].title);
        return GestureDetector(
          onTap: () {
            _showNewsArticleDetails(context, article);
          },
          child: GridTile(
            child: Container(
                //child: Image.network(listViewModel.articles[index].urlToImage),
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: CircleImage(
                  urlToImage: article.urlToImage,
                )),
            footer: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                article.title,
                style: TextStyle(fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        );
      },
      itemCount: this.articles.length,
    );
  }
}
