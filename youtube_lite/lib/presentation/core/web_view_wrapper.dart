import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:youtube_lite/core/app_colors.dart';
import 'package:youtube_lite/presentation/core/full_screen_loading_overlay.dart';

class WebViewWrapper extends StatefulWidget {
  const WebViewWrapper({super.key, required this.url, required this.title});
  final String url;
  final String title;

  @override
  State<WebViewWrapper> createState() => _WebViewWrapperState();
}

class _WebViewWrapperState extends State<WebViewWrapper> {
  late final WebViewController _controller;
  final ValueNotifier<bool> _isLoading = ValueNotifier(true);

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (_) => _isLoading.value = true,
          onPageFinished: (_) {
            _isLoading.value = false;
            _controller.runJavaScript('''
var navBar = document.querySelector('ytm-pivot-bar-renderer');
if (navBar) {
  navBar.style.display = 'none';
}''');
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
          loadingIndicator: Center(
            child: CircularProgressIndicator(color: AppColors.youtubePrimary),
          ),
          child: Scaffold(
            backgroundColor: AppColors.backgroundDark,
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back),
              ),
            ),
            body: WebViewWidget(controller: _controller),
          ),
        );
      },
    );
  }
}
