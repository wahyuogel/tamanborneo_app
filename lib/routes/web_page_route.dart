import 'package:flutter/material.dart';
import 'package:zoo_app/ui/pages/web_page.dart';

class WebPageRoute extends MaterialPageRoute<Null> {

  final String title;
  final String url;

  WebPageRoute(this.title,this.url) : super(builder: (BuildContext context) {
    return WebPage(title,url);
  });
}
