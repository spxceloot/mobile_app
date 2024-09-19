import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      bottomSheet: NearbyParkingView(),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          children: [],
        ),
      ),
    );
  }
}

class NearbyParkingView extends StatelessWidget {
  const NearbyParkingView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: 200.0,
      width: size.width,
      child: ListView.builder(
        itemCount: dummyParkingData,
        itemBuilder: (context, int idx) {},
      ),
    );
  }
}
