import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:trips/trips/round_trips.dart';

late Stream<QuerySnapshot> roundref;

// ignore: must_be_immutable
class Round extends StatefulWidget {
  late Stream<QuerySnapshot> roundstr;
  Round({super.key, required this.roundstr}) {
    roundref = roundstr;
  }

  @override
  State<Round> createState() => _RoundState();
}

class _RoundState extends State<Round> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: roundref,
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;

                return Container(
                  height: 250,
                  margin: const EdgeInsets.only(top: 30, right: 40, left: 40),
                  child: Material(
                    elevation: 8,
                    borderRadius: BorderRadius.circular(28),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: const Color(0xff2b32b2),
                    child: InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      "${data['info']['from']}",
                                      textAlign: TextAlign.end,
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 17),
                                    ),
                                  ),
                                  const Expanded(
                                    flex: 1,
                                    child: Icon(
                                      Icons.compare_arrows_rounded,
                                      size: 40,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      "${data['info']['to']}",
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 17),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.format_list_numbered,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Number of trips: ${data['info']['num']}",
                                    style: const TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.access_time,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Starting from: ${data['info']['starting']} ",
                                    style: const TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.access_time,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "ends at: ${data['info']['ends']} ",
                                    style: const TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.garage_outlined,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "parking in ${data['info']['from']}: ${data['info']['parkingF']}",
                                    style: const TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.garage_outlined,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "parking in ${data['info']['to']}: ${data['info']['parkingT']}",
                                    style: const TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ]),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RoundTrips(
                                      fromref: data['info']['from'],
                                      toref: data['info']['to'],
                                      tripsref: data['trips'],
                                      srclocationref: data['info']
                                          ['srclocation'],
                                      deslocationref: data['info']
                                          ['deslocation'],
                                    )));
                      },
                    ),
                  ),
                );
              }).toList(),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
