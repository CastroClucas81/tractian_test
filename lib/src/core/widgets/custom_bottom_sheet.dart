import 'package:flutter/material.dart';
import 'package:tractian_test/src/core/colors/app_colors_enum.dart';

class CustomBottomSheet {
  static Future<T?> show<T>(
    BuildContext context, {
    required String title,
    required Widget child,
    double height = 200,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(14),
        ),
      ),
      builder: (context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: SizedBox(
            height: height,
            child: Column(
              children: [
                const SizedBox(height: 10),
                Container(
                  width: 60,
                  height: 6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: AppColorsEnum.neutralGray.color,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          title,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.close),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 0),
                const Divider(
                  height: 0,
                  indent: 0,
                  thickness: 1,
                ),
                Expanded(child: child),
              ],
            ),
          ),
        );
      },
    );
  }
}
