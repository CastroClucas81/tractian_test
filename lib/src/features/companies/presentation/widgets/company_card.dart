import 'package:flutter/material.dart';
import 'package:tractian_test/src/core/routes/app_coordinator_mixin.dart';
import 'package:tractian_test/src/features/companies/domain/entities/company_entity.dart';
import 'package:tractian_test/src/core/colors/app_colors_enum.dart';

class CompanyCard extends StatelessWidget with AppCoordinatorMixin {
  final CompanyEntity company;

  const CompanyCard({
    required this.company,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => goAssets(context, companyId: company.id),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 32,
                    child: CircleAvatar(
                      backgroundColor: AppColorsEnum.darkBlue.color,
                      child: Icon(
                        Icons.business_sharp,
                        color: AppColorsEnum.white.color,
                        size: 18,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    company.name,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const Icon(
                Icons.chevron_right,
                size: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
