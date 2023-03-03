import 'package:biticonapp/Common/AppText/AppTextView.dart';
import 'package:biticonapp/Common/Constant/AppConfig.dart';
import 'package:biticonapp/Common/Constant/size_config.dart';
import 'package:biticonapp/Common/Theme/colors.dart';
import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';
// Import for Android features.
import 'package:webview_flutter_android/webview_flutter_android.dart';
// Import for iOS features.

class DynamicWebPage extends StatefulWidget {
  final String title;
  final String url;
  const DynamicWebPage({
    Key? key,
    required this.title,
    required this.url,
  }) : super(key: key);

  @override
  State<DynamicWebPage> createState() => _DynamicWebPageState();
}

class _DynamicWebPageState extends State<DynamicWebPage> {
  final GlobalKey webViewKey = GlobalKey();
  // String webURL =  ;
  @override
  void dispose() {
    super.dispose();
    _controller.clearCache();
  }

  late final PlatformWebViewControllerCreationParams params;

  double progress = 0;
  WebViewController _controller = WebViewController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = WebViewController();
    if (_controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
    }
    _controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {
            print("error");
            print(error);
          },
          onNavigationRequest: (NavigationRequest request) async {
            Uri uri = Uri.parse(request.url);
            print("URL");
            print(uri);
            try {
              if (uri.queryParameters["code"] != null) {
                print("code fetched");

                Navigator.pop(context, uri.queryParameters["code"]);
                print("code fetched prevented");
                return NavigationDecision.prevent;
              } else if (uri.queryParameters["error"] == "cancelledOnApp") {
                //ShowMessage().showErrorMessage("Request Cancelled");
                Navigator.pop(
                  context,
                );

                return NavigationDecision.prevent;
              } else {
                print("Else Navigated");
                return NavigationDecision.navigate;
              }
            } catch (e) {
              print("error fetched");
              print(e);
              return NavigationDecision.navigate;
            }
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.primaryColor,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: CustomText(
              title: widget.title,
              color: AppColor.white,
              size: SizeConfig.screenWidth * 0.05,
              fontWeight: FontWeight.w600,
            ),
          ),
          body: SizedBox(
            height: AppConfig(context).height,
            width: AppConfig(context).width,
            // child: WebViewWidget(controller: _controller),
            child: WebViewWidget(controller: _controller),
          ),
        ),
      ),
    );
  }
}
