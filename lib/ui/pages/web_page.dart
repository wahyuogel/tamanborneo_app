import 'package:flutter/material.dart';
import 'package:flutter_inappbrowser/flutter_inappbrowser.dart';

class WebPage extends StatefulWidget {

  String title;
  String url;

  WebPage({Key key, title, url}) : super(key : key);

  @override
  State<StatefulWidget> createState() => WebPageState();
}

class WebPageState extends State<WebPage> {
  InAppWebViewController webView;
  double progress = 0;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Open Web Page")),
        body: Container(
            height: MediaQuery
                .of(context)
                .size
                .height,
            width: MediaQuery
                .of(context)
                .size
                .width,
            child: InAppWebView(
              initialUrl: "http://attendize.website/e/6124/ok",
              initialHeaders: {
              },
              initialOptions: {
              },
              onWebViewCreated: (InAppWebViewController controller) {
                webView = controller;
              },
              onLoadStart: (InAppWebViewController controller, String url) {

              },
              onProgressChanged: (InAppWebViewController controller,
                  int progress) {
                setState(() {
                  this.progress = progress / 100;
                });
              },)
        ));
  }


}