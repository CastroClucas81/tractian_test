part of 'companies_cubit.dart';

sealed class CompaniesState extends Equatable {
  const CompaniesState();

  @override
  List<Object> get props => [];
}

final class CompaniesLoading extends CompaniesState {}

final class CompaniesError extends CompaniesState {}

final class CompaniesEmpty extends CompaniesState {}

final class CompaniesSuccess extends CompaniesState {
  final List<CompanyEntity> companies;

  const CompaniesSuccess({required this.companies});

  @override
  List<Object> get props => [companies];
}
