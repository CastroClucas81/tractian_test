import 'package:flutter/material.dart';
import 'package:tractian_test/src/core/routes/route_constants.dart';

mixin AppCoordinatorMixin {
  void goAssets(BuildContext context, {required String companyId}) {
    Navigator.pushNamed(
      context,
      RouteConstants.assets,
      arguments: companyId,
    );
  }
}
