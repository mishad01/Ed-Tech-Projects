import 'package:flutter/material.dart';
import 'package:youtube_lite/core/constants/app_colors.dart';

class FullScreenLoadingOverlay extends StatelessWidget {
  const FullScreenLoadingOverlay({
    super.key,
    required this.isLoading,
    required this.child,
    this.loadingWidget,
  });

  final bool isLoading;
  final Widget child;
  final Widget? loadingWidget;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading)
          Container(
            height: double.infinity,
            width: double.infinity,
            color: AppColors.surfaceDark,
            child: Center(
              child:
                  loadingWidget ??
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                  ),
            ),
          ),
      ],
    );
  }
}
