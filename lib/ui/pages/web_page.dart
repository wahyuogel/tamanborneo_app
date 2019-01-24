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
    return  Container(
        height: MediaQuery
            .of(context)
            .size
            .height,
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: Stack(children: <Widget>[
          InAppWebView(
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
            },),
          Positioned(
            top: 36.0,
            left: 20.0,
            child: FloatingActionButton(
              elevation: 0,
              mini: true,
              backgroundColor: Colors.green,
              onPressed: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios),
            ),
          ),
        ]));
  }


}