// ignore_for_file: unused_field

import 'dart:async';

import 'package:firebase/model/cardd.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Lokasi4 extends StatelessWidget {
  Lokasi4({super.key});

  final DatabaseReference dbRef =
      FirebaseDatabase.instance.ref().child('Lokasi4');

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-4.6996, 119.552),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            flex: 2,
            child: StreamBuilder<DatabaseEvent>(
                stream: dbRef.onValue,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    // ignore: unused_local_variable
                    final datamaps =
                        snapshot.data!.snapshot.value as Map<dynamic, dynamic>;
                    return Stack(
                      children: [
                        GoogleMap(
                          markers: {
                            Marker(
                                markerId: const MarkerId("marker 4"),
                                position: LatLng(
                                    datamaps['latitude'], datamaps['latiout']),
                                infoWindow: const InfoWindow(
                                    title: "Lokasi 4",
                                    snippet: "Alat Kebakaran"))
                          },
                          mapType: MapType.hybrid,
                          initialCameraPosition: CameraPosition(
                            target: LatLng(
                                datamaps['latitude'], datamaps['latiout']),
                            zoom: 14.4746,
                          ),
                          onMapCreated: (GoogleMapController controller) {
                            _controller.complete(controller);
                          },
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.arrow_circle_left_outlined,
                                color: Colors.white),
                            iconSize: 40),
                      ],
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
          ),
          Expanded(
            flex: 4,
            child: StreamBuilder<DatabaseEvent>(
                stream: dbRef.onValue,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    // ignore: unused_local_variable
                    final datanya =
                        snapshot.data!.snapshot.value as Map<dynamic, dynamic>;
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Cardd(
                              image: "assets/images/apiii.png",
                              nilai: datanya['Kebakaran'] == 0
                                  ? "Bahaya"
                                  : "Normal",
                              textnya: "Api",
                              colornya: datanya['Api'] == 0
                                  ? Colors.red
                                  : Colors.teal[500]!),
                          Cardd(
                              image: "assets/images/kelembapann.png",
                              nilai: "${datanya['Kelembapan']} %",
                              textnya: "Kelembapan",
                              colornya: datanya['Kelembapan'] <= 10
                                  ? Colors.red
                                  : Colors.teal[500]!),
                          Cardd(
                              image: "assets/images/suhuu.png",
                              nilai: "${datanya['Suhu']}\u00B0C",
                              textnya: "Suhu",
                              colornya: datanya['Kelembapan'] >= 57
                                  ? Colors.red
                                  : Colors.teal[500]!),
                          Cardd(
                              image: "assets/images/smokee.png",
                              nilai: datanya['Asap'] == 0 ? "Bahaya" : "Normal",
                              textnya: "Asap",
                              colornya: datanya['Asap'] == 0
                                  ? Colors.red
                                  : Colors.teal[500]!),
                        ],
                      ),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
          )
        ],
      )),
    );
  }
}
