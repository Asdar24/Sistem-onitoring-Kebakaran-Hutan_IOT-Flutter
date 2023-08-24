import 'package:firebase/model/card2.dart';
import 'package:firebase/ui/lokasi1.dart';
import 'package:firebase/ui/lokasi2.dart';
import 'package:firebase/ui/lokasi3.dart';
import 'package:firebase/ui/lokasi4.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final DatabaseReference dbRef =
      FirebaseDatabase.instance.ref().child("Lokasi1");
  final DatabaseReference dbRef2 =
      FirebaseDatabase.instance.ref().child("Lokasi2");
  final DatabaseReference dbRef3 =
      FirebaseDatabase.instance.ref().child("Lokasi3");
  final DatabaseReference dbRef4 =
      FirebaseDatabase.instance.ref().child("Lokasi4");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/hutan.jpg"))),
                ),
                Container(
                  height: 30,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              flex: 2,
              child: Column(
                children: [
                  const Expanded(
                    child: Text(
                      "Taman Nasional Bantimurung",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Expanded(
                      flex: 10,
                      child: GridView.count(
                        primary: false,
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                        crossAxisSpacing: 30,
                        mainAxisSpacing: 30,
                        crossAxisCount: 2,
                        children: <Widget>[
                          InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Lokasi1(),
                                    ));
                              },
                              child: StreamBuilder<DatabaseEvent>(
                                  stream: dbRef.onValue,
                                  builder: (context, snapshot) {
                                    if (snapshot.hasError) {
                                      return Text('Error: ${snapshot.error}');
                                    } else if (snapshot.hasData) {
                                      final datanya = snapshot.data!.snapshot
                                          .value as Map<dynamic, dynamic>;
                                      return Card2(
                                        textnya: "Lokasi 1",
                                        imageee: datanya['Api'] == 0 ||
                                                datanya['Suhu'] >= 57 ||
                                                datanya['Kelembapan'] <= 10 ||
                                                datanya['Asap'] == 0
                                            ? "assets/images/peta.jpg"
                                            : "assets/images/pete.png",
                                      );
                                    } else {
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    }
                                  })),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Lokasi2(),
                                  ));
                            },
                            child: StreamBuilder<DatabaseEvent>(
                                stream: dbRef2.onValue,
                                builder: (context, snapshot) {
                                  if (snapshot.hasError) {
                                    return Text('Error: ${snapshot.error}');
                                  } else if (snapshot.hasData) {
                                    final datanya = snapshot.data!.snapshot
                                        .value as Map<dynamic, dynamic>;
                                    return Card2(
                                      textnya: "Lokasi 2",
                                      imageee: datanya['Api'] == 0 ||
                                              datanya['Suhu'] >= 57 ||
                                              datanya['Kelembapan'] <= 10 ||
                                              datanya['Asap'] == 0
                                          ? "assets/images/peta.jpg"
                                          : "assets/images/pete.png",
                                    );
                                  } else {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  }
                                }),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Lokasi3(),
                                  ));
                            },
                            child: StreamBuilder<DatabaseEvent>(
                                stream: dbRef3.onValue,
                                builder: (context, snapshot) {
                                  if (snapshot.hasError) {
                                    return Text('Error: ${snapshot.error}');
                                  } else if (snapshot.hasData) {
                                    final datanya = snapshot.data!.snapshot
                                        .value as Map<dynamic, dynamic>;
                                    return Card2(
                                      textnya: "Lokasi 3",
                                      imageee: datanya['Api'] == 0 ||
                                              datanya['Suhu'] >= 57 ||
                                              datanya['Kelembapan'] <= 10 ||
                                              datanya['Asap'] == 0
                                          ? "assets/images/peta.jpg"
                                          : "assets/images/pete.png",
                                    );
                                  } else {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  }
                                }),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Lokasi4(),
                                  ));
                            },
                            child: StreamBuilder<DatabaseEvent>(
                                stream: dbRef4.onValue,
                                builder: (context, snapshot) {
                                  if (snapshot.hasError) {
                                    return Text('Error: ${snapshot.error}');
                                  } else if (snapshot.hasData) {
                                    final datanya = snapshot.data!.snapshot
                                        .value as Map<dynamic, dynamic>;
                                    return Card2(
                                      textnya: "Lokasi 4",
                                      imageee: datanya['Api'] == 0 ||
                                              datanya['Suhu'] >= 57 ||
                                              datanya['Kelembapan'] <= 10 ||
                                              datanya['Asap'] == 0
                                          ? "assets/images/peta.jpg"
                                          : "assets/images/pete.png",
                                    );
                                  } else {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  }
                                }),
                          ),
                        ],
                      )),
                ],
              ))
        ],
      )),
    );
  }
}
