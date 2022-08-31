import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class UserguidePage extends StatefulWidget {
  const UserguidePage({Key? key}) : super(key: key);

  @override
  State<UserguidePage> createState() => _UserguidePageState();
}

class _UserguidePageState extends State<UserguidePage> {
  void initState() {
    super.initState();
    // Enable virtual display.
    WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: "https://flutter.dev",
    );
  }
}
