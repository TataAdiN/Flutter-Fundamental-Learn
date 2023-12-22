import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'widgets/short_appbar_scaffold.dart';

class ArticleWebView extends StatelessWidget {
  final String url;
 
  const ArticleWebView({super.key, required this.url});
 
  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()..loadRequest(Uri.parse(url));
    return ShortAppBarScaffold(
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}