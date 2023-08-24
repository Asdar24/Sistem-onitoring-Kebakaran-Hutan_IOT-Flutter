import 'package:flutter/material.dart';

class Cardd extends StatelessWidget {
  const Cardd({
    required this.image,
    required this.nilai,
    required this.textnya,
    required this.colornya,
    super.key,
  });
  final String textnya;
  final String image;
  final String nilai;
  final Color colornya;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          shadowColor: const Color.fromARGB(255, 169, 169, 169),
          elevation: 15.0,
          color: colornya,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 120,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        image,
                        height: 80,
                        width: 80,
                      ),
                      Text(
                        textnya,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Text(
                      nilai,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
