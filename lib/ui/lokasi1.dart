// ignore_for_file: unused_field

import 'dart:async';

import 'package:firebase/model/cardd.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Lokasi1 extends StatefulWidget {
  const Lokasi1({super.key});

  @override
  State<Lokasi1> createState() => _Lokasi1State();
}

class _Lokasi1State extends State<Lokasi1> {
  final DatabaseReference dbRef =
      FirebaseDatabase.instance.ref().child('Lokasi1');

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-5.3544667, 119.4295404),
    zoom: 15,
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
                                markerId: const MarkerId("marker 1"),
                                position: LatLng(datamaps['latitude'],
                                    datamaps['longitude']),
                                infoWindow: const InfoWindow(
                                    title: "Lokasi 1",
                                    snippet: "Alat Kebakaran"))
                          },
                          mapType: MapType.hybrid,
                          initialCameraPosition: CameraPosition(
                            target: LatLng(
                                datamaps['latitude'], datamaps['longitude']),
                            zoom: 15,
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
                              nilai: datanya['Api'] == 0 ? "Bahaya" : "Normal",
                              textnya: "Api",
                              colornya: datanya['Api'] == 0
                                  ? Colors.red
                                  : Colors.teal[200]!),
                          Cardd(
                              image: "assets/images/kelembapann.png",
                              nilai: "${datanya['Kelembapan']} %",
                              textnya: "Kelembapan",
                              colornya: datanya['Kelembapan'] <= 10
                                  ? Colors.red
                                  : Colors.teal[200]!),
                          Cardd(
                              image: "assets/images/suhuu.png",
                              nilai: "${datanya['Suhu']}\u00B0C",
                              textnya: "Suhu",
                              colornya: datanya['Suhu'] >= 57
                                  ? Colors.red
                                  : Colors.teal[200]!),
                          Cardd(
                              image: "assets/images/smokee.png",
                              nilai: datanya['Asap'] == 0 ? "Bahaya" : "Normal",
                              textnya: "Asap",
                              colornya: datanya['Asap'] == 0
                                  ? Colors.red
                                  : Colors.teal[200]!),
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
