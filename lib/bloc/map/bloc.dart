// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:spxce/bloc/map/event.dart';
// import 'package:spxce/bloc/map/state.dart';

// class MapBloc extends Bloc<MapEvent, MapState> {
//   MapBloc() : super(MapInitial()) {
//     on<UpdateLocation>(_updateLocation);
//   }

//   _updateLocation(UpdateLocation event, Emitter emit) async {
//     state.mapboxMap.flyTo(event.cameraOptions);
//   }

//   _mapCreated(MapCreated event, Emitter emit) async {
//     emit(state.copyWith)
//   }
// }
