import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tractian_test/generated/l10n.dart';
import 'package:tractian_test/src/core/assets/images_enum.dart';
import 'package:tractian_test/src/features/companies/presentation/cubit/companies_cubit.dart';
import 'package:tractian_test/src/features/companies/presentation/widgets/companies_loading_widget.dart';
import 'package:tractian_test/src/features/companies/presentation/widgets/companies_widget.dart';
import 'package:tractian_test/src/core/colors/app_colors_enum.dart';
import 'package:tractian_test/src/core/widgets/empty_widget.dart';
import 'package:tractian_test/src/core/widgets/generic_error_widget.dart';

class CompaniesPage extends StatefulWidget {
  const CompaniesPage({super.key});

  @override
  State<CompaniesPage> createState() => _CompaniesPageState();
}

class _CompaniesPageState extends State<CompaniesPage> {
  @override
  void initState() {
    context.read<CompaniesCubit>().start();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColorsEnum.darkBlue.color,
        title: SvgPicture.asset(
          ImagesEnum.tractianLogo.path,
          height: 20,
          colorFilter: ColorFilter.mode(
            AppColorsEnum.white.color,
            BlendMode.srcIn,
          ),
        ),
      ),
      body: BlocBuilder<CompaniesCubit, CompaniesState>(
        builder: (context, state) => switch (state) {
          CompaniesLoading() => const CompaniesLoadingWidget(),
          CompaniesError() => GenericErrorWidget(
              description: S.of(context).AnErrorOccurredWhenListCompanies,
            ),
          CompaniesEmpty() => EmptyWidget(
              title: S.of(context).noCompaniesAvailable,
            ),
          CompaniesSuccess() => CompaniesWidget(companies: state.companies),
        },
      ),
    );
  }
}
