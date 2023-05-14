import 'package:flutter/material.dart';
import 'package:trips/alertexitapp.dart';
import 'package:trips/home_widget/one_way.dart';
import 'package:trips/home_widget/round.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Stream<QuerySnapshot> onewayref;
  late Stream<QuerySnapshot> roundref;
  @override
  void initState() {
    getdata();
    super.initState();
  }

  void getdata() {
    onewayref =
        FirebaseFirestore.instance.collection("Info_one_way").snapshots();
    roundref = FirebaseFirestore.instance.collection("Info_round").snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 40,
          backgroundColor: const Color(0xff2b32b2),
          title: const Text("Trips"),
          centerTitle: true,
          bottom: const TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 3,
            tabs: [
              Tab(
                icon: Icon(
                  Icons.arrow_right_alt_rounded,
                  size: 30,
                ),
                text: "one Way trip",
              ),
              Tab(
                icon: Icon(
                  Icons.compare_arrows_rounded,
                  size: 30,
                ),
                text: "Round trip",
              )
            ],
          ),
        ),
        body: WillPopScope(
          onWillPop: () {
            alertExitApp(context);
            return Future.value(true);
          },
          child: TabBarView(children: [
            Center(
              child: OneWay(
                onewaystr: onewayref,
              ),
            ),
            Center(
                child: Round(
              roundstr: roundref,
            ))
          ]),
        ),
      ),
    );
  }
}
