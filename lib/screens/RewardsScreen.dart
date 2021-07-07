import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RewardsScreen extends StatefulWidget {
  @override
  _RewardsScreenState createState() => _RewardsScreenState();
}

class _RewardsScreenState extends State<RewardsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Go Manager'),
      ),
      body: Container(
          child: WebView(
        initialUrl: Uri.dataFromString(
                '<html><body><iframe style="border: 1px solid rgba(0, 0, 0, 0.1);" width="380" height="700" src="https://www.figma.com/embed?embed_host=share&url=https%3A%2F%2Fwww.figma.com%2Fproto%2FNeN66ZN2baaBfYC1aWTMkH%2FUntitled%3Fnode-id%3D1%253A2%26scaling%3Dmin-zoom%26page-id%3D0%253A1" allowfullscreen></iframe></body></html>',
                mimeType: 'text/html')
            .toString(),
            javaScriptMode: JavaScriptMode.unrestricted,
        // javascriptMode: JavaScriptMode.unrestricted,
      )),
    );
  }
}
