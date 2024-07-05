import 'package:equatable/equatable.dart';

class FilterParams extends Equatable {
  final String name;
  final bool isEnergySensor;
  final bool isCritic;

  const FilterParams({
    required this.name,
    this.isEnergySensor = false,
    this.isCritic = false,
  });

  FilterParams copyWith({
    String? name,
    bool? isEnergySensor,
    bool? isCritic,
  }) {
    return FilterParams(
      name: name ?? this.name,
      isEnergySensor: isEnergySensor ?? this.isEnergySensor,
      isCritic: isCritic ?? this.isCritic,
    );
  }

  @override
  List<Object?> get props => [
        name,
        isEnergySensor,
        isCritic,
      ];
}
