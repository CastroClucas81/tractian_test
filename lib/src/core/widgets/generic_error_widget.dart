import 'package:flutter/material.dart';
import 'package:tractian_test/src/core/colors/app_colors_enum.dart';

class GenericErrorWidget extends StatelessWidget {
  final String description;

  const GenericErrorWidget({
    required this.description,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error,
            size: 48,
            color: AppColorsEnum.darkBlue.color,
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              description,
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColorsEnum.darkBlue.color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
