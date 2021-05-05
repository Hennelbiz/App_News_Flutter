import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CircleImage extends StatelessWidget {
  //String urlToImage; //Checar si no le afecta al codigo final el cambio de string a final
  final String urlToImage;

  CircleImage({this.urlToImage});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: urlToImage ?? "",
      imageBuilder: (context, imageProvider) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
          ),
        );
      },
      placeholder: (context, url) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
      //errorWidget: (context, url, error) => Icon(Icons.error),
      errorWidget: (context, url, error) {
        //return Container();
        return Icon(Icons.error);
      },
    );
  }
}
