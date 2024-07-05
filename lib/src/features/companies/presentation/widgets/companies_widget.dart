import 'package:flutter/material.dart';
import 'package:tractian_test/src/features/companies/domain/entities/company_entity.dart';
import 'package:tractian_test/src/features/companies/presentation/widgets/company_card.dart';

class CompaniesWidget extends StatelessWidget {
  final List<CompanyEntity> companies;

  const CompaniesWidget({
    required this.companies,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: companies.length,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      itemBuilder: (context, index) {
        final company = companies[index];

        return CompanyCard(company: company);
      },
    );
  }
}
