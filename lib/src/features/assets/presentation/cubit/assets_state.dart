part of 'assets_cubit.dart';

sealed class AssetsState extends Equatable {
  const AssetsState();

  @override
  List<Object> get props => [];
}

final class AssetsLoading extends AssetsState {}

final class AssetsError extends AssetsState {}

final class AssetsEmpty extends AssetsState {}

final class AssetsSuccess extends AssetsState {
  final List<ItemEntity> itens;
  final List<ItemEntity> filteredItens;
  final FilterParams filter;

  const AssetsSuccess({
    required this.itens,
    required this.filteredItens,
    required this.filter,
  });

  AssetsSuccess copyWith({
    List<ItemEntity>? itens,
    List<ItemEntity>? filteredItens,
    FilterParams? filter,
  }) {
    return AssetsSuccess(
      itens: itens ?? this.itens,
      filteredItens: filteredItens ?? this.filteredItens,
      filter: filter ?? this.filter,
    );
  }

  @override
  List<Object> get props => [itens, filteredItens, filter];
}
