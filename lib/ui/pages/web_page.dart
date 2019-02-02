import 'package:flutter/material.dart';
import 'package:flutter_inappbrowser/flutter_inappbrowser.dart';
import 'package:zoo_app/ui/components/common/app_back_button.dart';

class WebPage extends StatefulWidget {
  final String title;
  final String url;

  WebPage(this.title, this.url);

  @override
  State<StatefulWidget> createState() => WebPageState(this.title, this.url);
}

class WebPageState extends State<WebPage> {
  InAppWebViewController webView;
  double progress = 0;
  final String title;
  final String url;

  WebPageState(this.title, this.url);

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(children: <Widget>[
              InAppWebView(
                initialUrl: this.url,
                initialHeaders: {},
                initialOptions: {},
                onWebViewCreated: (InAppWebViewController controller) {
                  webView = controller;
                },
                onLoadStart: (InAppWebViewController controller, String url) {},
                onProgressChanged:
                    (InAppWebViewController controller, int progress) {
                  setState(() {
                    this.progress = progress / 100;
                  });
                },
              ),
              AppBackButton(),
            ])));
  }
}
