import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:youtube_lite/core/constants/app_colors.dart';
import 'package:youtube_lite/presentation/core/widget/full_screen_loading_overlay.dart';

class WebViewWrapper extends StatefulWidget {
  const WebViewWrapper({super.key, required this.url, required this.title});
  final String url;
  final String title;

  @override
  State<WebViewWrapper> createState() => _WebViewWrapperState();
}

class _WebViewWrapperState extends State<WebViewWrapper> {
  final ValueNotifier<bool> _isLoading = ValueNotifier(false);
  late final WebViewController _controller;
  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (progress) => _isLoading.value,
          onPageFinished: (String url) {
            _isLoading.value = false;
            //             _controller.runJavaScript('''
            // var navBar =  document.querySelector('ytm-pivot-bar-renderer');
            // if(navbar) navBar.style.display = 'none';

            // ''');
            _controller.runJavaScript('''
                        var navBar = document.querySelector('ytm-mobile-topbar-renderer');
                        if (navBar) navBar.style.display = 'none';
                      ''');
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _isLoading,
      builder: (context, isLoading, child) {
        return FullScreenLoadingOverlay(
          isLoading: isLoading,
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                widget.title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              backgroundColor: AppColors.backgroundDark,
              leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back, color: Colors.white),
              ),
            ),
            body: WebViewWidget(controller: _controller),
          ),
        );
      },
    );
  }
}
