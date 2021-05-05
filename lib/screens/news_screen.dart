import 'package:flutter/material.dart';
import 'package:movies_app_tutorial/utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:movies_app_tutorial/widgets/news_grid.dart';
import 'package:movies_app_tutorial/ViewModels/news_article_list_ViewModel.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<NewsArticleListViewModel>(context, listen: false)
        .topHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    var listViewModel = Provider.of<NewsArticleListViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          //Icon(Icons.more_vert),
          PopupMenuButton(
            onSelected: (country) {
              listViewModel.topCountryHeadlines(Constants.Countries[country]);
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) {
              return Constants.Countries.keys
                  .map((e) => PopupMenuItem(
                        value: e,
                        child: Text(e),
                      ))
                  .toList();
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                'News',
                style: TextStyle(fontSize: 50),
              ),
            ),
            Divider(
              color: Color(0xffff8a30),
              height: 40,
              thickness: 8,
              indent: 30,
              endIndent: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 15, bottom: 15),
              child: Text(
                'Headline',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Expanded(child: NewsGrid(articles: listViewModel.articles)),
          ],
        ),
      ),
    );
  }
}
