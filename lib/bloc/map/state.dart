import 'package:equatable/equatable.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class MapState extends Equatable {
  final MapboxMap? mapboxMap;

  const MapState({this.mapboxMap});

  MapState copyWith({mapboxMap}) {
    return MapState(mapboxMap: mapboxMap);
  }

  @override
  List<Object?> get props => [];
}
