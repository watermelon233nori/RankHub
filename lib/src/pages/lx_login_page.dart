import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class LxLoginPage extends StatefulWidget {
  const LxLoginPage({super.key});

  @override
  _LxLoginPageState createState() => _LxLoginPageState();
}

class _LxLoginPageState extends State<LxLoginPage> {
  InAppWebViewController? webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("登录"),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: WebUri.uri(Uri.parse("https://maimai.lxns.net/login")),
        ),
        onWebViewCreated: (controller) {
          webViewController = controller;
        },
        onUpdateVisitedHistory: (controller, url, isReload) async {
          if (url != null) {
            await _checkAndRetrieveToken(url);
          }
        },
      ),
    );
  }

  Future<void> _checkAndRetrieveToken(WebUri url) async {
    final cookies = await CookieManager().getCookies(url: url);
      final refreshToken = cookies
          .firstWhere(
            (cookie) => cookie.name == 'refresh_token',
            orElse: () => Cookie(name: '', value: ''),
          )
          .value;

      if (refreshToken.isNotEmpty) {
        // 成功获取 refresh_token
        Navigator.pop(context, refreshToken);
      }
  }
}
