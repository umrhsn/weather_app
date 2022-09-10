import 'package:equatable/equatable.dart';

class AstroEntity extends Equatable {
  final String sunrise;
  final String sunset;

  const AstroEntity({required this.sunrise, required this.sunset});

  @override
  List<Object?> get props => [sunrise, sunset];
}
