import 'package:flutter/material.dart';

class FullScreenLoadingOverlay extends StatelessWidget {
  const FullScreenLoadingOverlay({
    super.key,
    required this.isLoading,
    required this.child,
    required this.loadingIndicator,
  });
  final bool isLoading;
  final Widget child;
  final Widget loadingIndicator;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [child, if (isLoading) loadingIndicator]);
  }
}
