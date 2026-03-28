import 'package:flutter/material.dart';
import 'package:youtube_lite/core/constants/app_colors.dart';

class YoutubeNavTile extends StatelessWidget {
  const YoutubeNavTile({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 15,
                  fontWeight: .w400,
                ),
              ),
            ),
            Icon(
              Icons.chevron_right_rounded,
              color: AppColors.iconMuted,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
