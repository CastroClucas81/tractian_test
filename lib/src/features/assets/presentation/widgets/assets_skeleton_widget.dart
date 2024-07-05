import 'package:flutter/material.dart';
import 'package:tractian_test/src/core/widgets/skeleton_item_widget.dart';

class AssetsSkeletonWidget extends StatelessWidget {
  const AssetsSkeletonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return ListView.builder(
      itemCount: 5,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SkeletonItemWidget(
            width: width,
            height: 24,
          ),
          const SizedBox(height: 8),
          SkeletonItemWidget(
            width: width / 2,
            height: 24,
          ),
          const SizedBox(height: 8),
          SkeletonItemWidget(
            width: width - 100,
            height: 24,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
