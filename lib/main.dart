import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:movies_app_tutorial/ViewModels/news_article_list_ViewModel.dart';
import 'package:movies_app_tutorial/screens/news_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter News App',
      theme: ThemeData(
          scaffoldBackgroundColor: Color(0xfffefdfd),
          appBarTheme: AppBarTheme(
            color: Color(0xfffefdfd),
            elevation: 0,
            textTheme: TextTheme(
                headline6: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            )),
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
            actionsIconTheme: IconThemeData(
              color: Colors.black,
            ),
          )),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => NewsArticleListViewModel(),
          ),
        ],
        child: NewsScreen(),
      ),
    );
  }
}
