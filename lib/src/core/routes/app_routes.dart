import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tractian_test/src/core/dependencies/app_dependency.dart';
import 'package:tractian_test/src/core/routes/route_constants.dart';
import 'package:tractian_test/src/features/assets/presentation/assets_page.dart';
import 'package:tractian_test/src/features/assets/presentation/cubit/assets_cubit.dart';
import 'package:tractian_test/src/features/companies/presentation/companies_page.dart';
import 'package:tractian_test/src/features/companies/presentation/cubit/companies_cubit.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    late final Widget page;

    switch (settings.name) {
      case RouteConstants.companies:
        page = BlocProvider(
          create: (context) => AppDependency.instance<CompaniesCubit>(),
          child: const CompaniesPage(),
        );
      case RouteConstants.assets:
      default:
        page = BlocProvider(
          create: (context) => AppDependency.instance<AssetsCubit>(),
          child: AssetsPage(
            companyId: settings.arguments as String,
          ),
        );
    }

    return MaterialPageRoute(builder: (_) => page);
  }
}
