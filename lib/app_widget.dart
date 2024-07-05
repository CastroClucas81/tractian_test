import 'package:flutter/material.dart';
import 'package:tractian_test/generated/l10n.dart';
import 'package:tractian_test/src/core/routes/app_routes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tractian test',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      themeMode: ThemeMode.system,
      localizationsDelegates: const [S.delegate],
      supportedLocales: S.delegate.supportedLocales,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
