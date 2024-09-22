import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spxce/bloc/spxce/event.dart';
import 'package:spxce/bloc/spxce/state.dart';
import 'package:spxce/model/parking_space.dart';
import 'package:spxce/repository/space_repository.dart';

class SpxceBloc extends Bloc<SpxceEvent, SpxceState> {
  final SpaceRepository spaceRepository;

  SpxceBloc(this.spaceRepository) : super(SpxceInitial()) {
    on<FetchNearby>(_fetchNearby);
  }

  _fetchNearby(FetchNearby event, Emitter emit) async {
    emit(SpxceLoading());

    try {
      List<ParkingSpace> spaces = await spaceRepository.getNearbySpaces(
        latitude: event.latitude,
        longitude: event.longitude,
      );

      emit(FetchedSpxces(spaces));
    } catch (e) {
      emit(SpxceError(e.toString()));
    }
  }
}
