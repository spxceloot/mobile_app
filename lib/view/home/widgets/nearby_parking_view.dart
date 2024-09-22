import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spxce/bloc/spxce/bloc.dart';
import 'package:spxce/bloc/spxce/state.dart';
import 'package:spxce/model/parking_space.dart';
import 'package:spxce/utils/colors.dart';

class NearbyParkingView extends StatelessWidget {
  NearbyParkingView({super.key});

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<SpxceBloc, SpxceState>(
      builder: (context, state) {
        if (state is FetchedSpxces) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                end: Alignment.topCenter,
                begin: Alignment.bottomCenter,
                colors: [
                  Colors.black,
                  Colors.black.withOpacity(0.9),
                  Colors.black.withOpacity(0.5),
                  Colors.black.withOpacity(0.3),
                  Colors.black.withOpacity(0.02),
                ],
              ),
            ),
            height: 270.0,
            width: size.width,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: state.spaces.length,
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(16.0),
              itemBuilder: (context, int idx) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: NearbyTile(parkingSpace: state.spaces[idx]),
                );
              },
            ),
          );
        } else if (state is SpxceError) {
          return Text(state.message);
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}

class NearbyTile extends StatelessWidget {
  const NearbyTile({super.key, required this.parkingSpace});

  final ParkingSpace parkingSpace;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.7,
      decoration: BoxDecoration(
        color: const Color(0xFF121212),
        borderRadius: BorderRadius.circular(20.0),
      ),
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 150.0,
            width: size.width * 0.7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                image: AssetImage(parkingSpace.imageUrl),
                fit: BoxFit.fill,
              ),
            ),
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0)),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'R',
                          style: TextStyle(
                            color: textSecondary,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: parkingSpace.pricePerHour.toStringAsFixed(2),
                          style: TextStyle(
                            color: textImportant,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: ' / hr',
                          style: TextStyle(
                            color: textSecondary,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 50,
            width: size.width * 0.7,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        parkingSpace.name,
                        style: TextStyle(
                          color: textPrimary,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${parkingSpace.location.street}, ${parkingSpace.location.city}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: textPrimary,
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                ),
                CircleAvatar(
                  child: InkWell(
                    onTap: () {},
                    child: Icon(Icons.directions_rounded),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
