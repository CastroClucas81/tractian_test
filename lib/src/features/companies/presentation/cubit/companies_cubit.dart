import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tractian_test/src/features/companies/domain/entities/company_entity.dart';
import 'package:tractian_test/src/features/companies/domain/usecases/get_companies_usecase.dart';

part 'companies_state.dart';

class CompaniesCubit extends Cubit<CompaniesState> {
  CompaniesCubit(GetCompaniesUsecase obterCompaniesUsecase)
      : _obterCompaniesUsecase = obterCompaniesUsecase,
        super(CompaniesLoading());

  final GetCompaniesUsecase _obterCompaniesUsecase;

  Future<void> start() async {
    (await _obterCompaniesUsecase()).fold(
      (failure) => emit(CompaniesError()),
      (companies) {
        if (companies.isEmpty) return emit(CompaniesEmpty());

        emit(CompaniesSuccess(companies: companies));
      },
    );
  }
}
