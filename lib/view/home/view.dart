import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spxce/view/common/map_view.dart';
import 'package:spxce/view/home/widgets/nearby_parking_view.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      bottomSheet: NearbyParkingView(),
      backgroundColor: Colors.black,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 16.0, right: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // FloatingActionButton.small(
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(13.0),
            //     side: BorderSide(width: 1.0, color: Colors.white38),
            //   ),
            //   backgroundColor: Color(0xFF121212),
            //   onPressed: () {},
            //   child: const Icon(
            //     CupertinoIcons.car_detailed,
            //     color: Colors.white70,
            //   ),
            // ),
            // SizedBox(
            //   width: 8.0,
            // ),
            FloatingActionButton(
              backgroundColor: Colors.deepPurple,
              onPressed: () {},
              child: const Icon(
                CupertinoIcons.car_detailed,
                color: Colors.white70,
              ),
            ),
            // SizedBox(
            //   width: 8.0,
            // ),
            // FloatingActionButton.small(
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(13.0),
            //     side: BorderSide(width: 1.0, color: Colors.white38),
            //   ),
            //   backgroundColor: Color(0xFF121212),
            //   onPressed: () {},
            //   child: const Icon(
            //     CupertinoIcons.car_detailed,
            //     color: Colors.white70,
            //   ),
            // ),
          ],
        ),
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            const MapView(),
            CustomAppBar(
              searchController: searchController,
            ),
            // Positioned(bottom: 0.0, child: )
          ],
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.searchController});

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black,
            Colors.black.withOpacity(0.9),
            Colors.black.withOpacity(0.8),
            Colors.black.withOpacity(0.5),
            Colors.black.withOpacity(0.3),
            Colors.black.withOpacity(0.02),
          ],
        ),
      ),
      width: size.width,
      padding: const EdgeInsets.fromLTRB(20.0, 48.0, 20.0, 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 48.0,
                      width: 48.0,
                      decoration: BoxDecoration(
                        color: const Color(0xFF121212),
                        borderRadius: BorderRadius.circular(100.0),
                        border: Border.all(
                          color: Colors.white30,
                        ),
                      ),
                      child: const Icon(Icons.location_on_rounded,
                          color: Colors.white70),
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  const Text(
                    "Albert st, Marshall town",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 48.0,
                  width: 48.0,
                  decoration: BoxDecoration(
                    color: const Color(0xFF121212),
                    borderRadius: BorderRadius.circular(100.0),
                    border: Border.all(
                      color: Colors.white30,
                    ),
                  ),
                  child: const Icon(Icons.notifications_rounded,
                      color: Colors.white70),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          TextFormField(
            controller: searchController,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFF121212),
              hintText: "Search",
              hintStyle: TextStyle(color: Colors.white60),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 5.0,
                horizontal: 20.0,
              ),
              prefixIcon: Icon(
                CupertinoIcons.search,
                color: Colors.white60,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          )
        ],
      ),
    );
  }
}
