import 'package:tractian_test/src/core/services/api/api_manager.dart';
import 'package:tractian_test/src/core/services/api/i_api_manager.dart';
import 'package:tractian_test/src/features/assets/data/datasource/assets_remote_datasource.dart';
import 'package:tractian_test/src/features/assets/data/datasource/i_assets_datasource.dart';
import 'package:tractian_test/src/features/assets/data/repository/assets_repository_impl.dart';
import 'package:tractian_test/src/features/assets/domain/repository/i_assets_repository.dart';
import 'package:tractian_test/src/features/assets/domain/usecases/get_assets_usecase.dart';
import 'package:tractian_test/src/features/assets/domain/usecases/get_locations_usecase.dart';
import 'package:tractian_test/src/features/assets/presentation/cubit/assets_cubit.dart';
import 'package:tractian_test/src/features/companies/data/datasource/company_remote_datasource.dart';
import 'package:tractian_test/src/features/companies/data/datasource/i_company_datasource.dart';
import 'package:tractian_test/src/features/companies/data/repository/company_repository_impl.dart';
import 'package:tractian_test/src/features/companies/domain/repository/i_company_repository.dart';
import 'package:tractian_test/src/features/companies/domain/usecases/get_companies_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:tractian_test/src/features/companies/presentation/cubit/companies_cubit.dart';

class AppDependency {
  static final instance = GetIt.instance;

  Future<void> start() async {
    instance.registerLazySingleton<IApiManager>(() => ApiManager());

    instance.registerLazySingleton<ICompanyDatasource>(
      () => CompanyRemoteDatasource(apiManager: instance()),
    );

    instance.registerLazySingleton<IAssetsDatasource>(
      () => AssetsRemoteDatasource(apiManager: instance()),
    );

    instance.registerLazySingleton<ICompanyRepository>(
      () => CompanyRepositoryImpl(instance()),
    );

    instance.registerLazySingleton<IAssetsRepository>(
      () => AssetsRepositoryImpl(instance()),
    );

    instance.registerLazySingleton(
      () => GetCompaniesUsecase(instance()),
    );

    instance.registerLazySingleton(
      () => GetLocationsUsecase(instance()),
    );

    instance.registerLazySingleton(
      () => GetAssetsUsecase(instance()),
    );

    instance.registerFactory(
      () => CompaniesCubit(instance()),
    );

    instance.registerFactory(
      () => AssetsCubit(
        obterAssetsUsecase: instance(),
        obterLocationsUsecase: instance(),
      ),
    );
  }
}
