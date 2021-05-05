import 'package:flutter/material.dart';
import 'package:movies_app_tutorial/ViewModels/news_article_ViewModel.dart';
import 'package:movies_app_tutorial/widgets/circle_widget.dart';

class NewsArticleDetailScreen extends StatelessWidget {
  final NewsArticleViewModel article;
  NewsArticleDetailScreen({this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage('assetName'),
            ),
            SizedBox(
              width: 5,
            ),
            Container(
              constraints: BoxConstraints(maxWidth: 150),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Text(
                    'Author',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    this.article.author ?? 'Undefined',
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Divider(
                  color: Color(0xffff8a30),
                  height: 80,
                  thickness: 20,
                ),
                Text(
                  'Headline',
                  style: TextStyle(fontSize: 14, color: Colors.white),
                )
              ],
            ),
            Text(
              this.article.title,
              style: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold, wordSpacing: 3),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              this.article.publishedAt,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 200,
              child: CircleImage(
                urlToImage: this.article.urlToImage,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              this.article.description,
              style: TextStyle(fontSize: 16, wordSpacing: 3),
            ),
          ],
        ),
      ),
    );
  }
}
