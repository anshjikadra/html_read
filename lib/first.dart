import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class First extends StatefulWidget {
  const First({Key? key}) : super(key: key);

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {


  late WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(title: Text("RAID Calculator"),backgroundColor: Color.fromARGB(255,27,105,151)),
      body:Container(

        child: WebView(

          backgroundColor: Colors.grey[100],
          initialUrl: '',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller = webViewController;
            _loadHtmlFromAssets();
          },

        ),
      ),

    );
  }


  _loadHtmlFromAssets() async {
    String fileHtmlContents = await rootBundle.loadString("assets/en1.html");
    _controller.loadUrl(Uri.dataFromString(fileHtmlContents,
        mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
    print(fileHtmlContents);
  }
}


