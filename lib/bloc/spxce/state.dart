import 'package:equatable/equatable.dart';
import 'package:spxce/model/parking_space.dart';

class SpxceState extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchedSpxces extends SpxceState {
  final List<ParkingSpace> spaces;

  FetchedSpxces(this.spaces);

  @override
  List<Object?> get props => [spaces];
}

class SpxceInitial extends SpxceState {}

class SpxceLoading extends SpxceState {}

class SpxceError extends SpxceState {
  final String message;

  SpxceError(this.message);

  @override
  List<Object?> get props => [message];
}
