import 'dart:typed_data';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:spxce/bloc/location/bloc.dart';
import 'package:spxce/bloc/location/state.dart';

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  MapboxMap? mapboxMap;

  @override
  Widget build(BuildContext context) {
    String ACCESS_TOKEN = dotenv.env['ACCESS_TOKEN']!;
    MapboxOptions.setAccessToken(ACCESS_TOKEN);

    CameraOptions camera = CameraOptions(
      center: Point(coordinates: Position(25.7828, 28.2748)),
      zoom: 15,
      bearing: 0,
      pitch: 0,
    );

    return BlocListener<LocationBloc, LocationState>(
      listener: (context, state) async {
        if (state is GeoLocationState) {
          mapboxMap!.flyTo(
            CameraOptions(
              center: Point(
                  coordinates: Position(
                      state.location.longitude, state.location.latitude)),
              zoom: 15,
              bearing: 0,
              pitch: 0,
            ),
            null,
          );

          mapboxMap!.annotations.createPointAnnotationManager().then(
            (pointAnnotationManager) async {
              pointAnnotationManager.create(
                PointAnnotationOptions(
                    geometry: Point(
                      coordinates: Position(
                        state.location.longitude,
                        state.location.latitude,
                      ),
                    ),
                    iconImage: 'car-15'),
              );
            },
          );
        } else if (state is LocationError) {
          print(state.message);
          final snackBar = SnackBar(
            /// need to set following properties for best effect of awesome_snackbar_content
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              title: 'Location Error',
              message: state.message,

              /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
              contentType: ContentType.failure,
            ),
          );

          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);
        }
      },
      child: MapWidget(
        styleUri: MapboxStyles.DARK,
        cameraOptions: camera,
        onMapCreated: _onMapCreated,
      ),
    );
  }

  _onMapCreated(MapboxMap box) {
    setState(() {
      mapboxMap = box;
    });
  }

  Future<Uint8List> loadMarkerImage() async {
    var byteData = await rootBundle.load("assets/images/poi.png");
    return byteData.buffer.asUint8List();
  }
}




    // Define options for your camera
    // CameraOptions camera = CameraOptions(
    //   center: Point(coordinates: Position(25.7828, 28.2748)),
    //   zoom: 15,
    //   bearing: 0,
    //   pitch: 0,
    // );

    // return BlocListener<LocationBloc, LocationState>(
    //   listener: (context, state) {
    //     print('dskfjdlksfjlkdsjflkdsjflkjsdlkfjsdajflk;jsad');
    //     if (state is GeoLocationState) {
    //       // camera = CameraOptions(
    //       //   center: Point(
    //       //     coordinates: Position(
    //       //       state.location.longitude,
    //       //       state.location.latitude,
    //       //     ),
    //       //   ),
    //       //   zoom: 5,
    //       //   bearing: 0,
    //       //   pitch: 0,
    //       // );
    //     } else if (state is LocationError) {
    //       print(state.message);
    //       final snackBar = SnackBar(
    //         /// need to set following properties for best effect of awesome_snackbar_content
    //         elevation: 0,
    //         behavior: SnackBarBehavior.floating,
    //         backgroundColor: Colors.transparent,
    //         content: AwesomeSnackbarContent(
    //           title: 'Location Error',
    //           message: state.message,

    //           /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
    //           contentType: ContentType.failure,
    //         ),
    //       );

    //       ScaffoldMessenger.of(context)
    //         ..hideCurrentSnackBar()
    //         ..showSnackBar(snackBar);
    //     }
    //   },
    //   child: MapWidget(
    //     styleUri: MapboxStyles.DARK,
    //     cameraOptions: camera,
    //     onMapCreated: (mapBox) {},
    //   ),
    // );
