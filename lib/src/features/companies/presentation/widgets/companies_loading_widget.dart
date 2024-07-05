import 'package:flutter/material.dart';
import 'package:tractian_test/src/core/widgets/skeleton_item_widget.dart';

class CompaniesLoadingWidget extends StatelessWidget {
  const CompaniesLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      itemBuilder: (context, index) => Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
          child: Row(
            children: [
              const SkeletonItemWidget(
                width: 40,
                height: 40,
                borderRadius: 40,
              ),
              const SizedBox(width: 10),
              SkeletonItemWidget(
                width: MediaQuery.of(context).size.width / 2,
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
