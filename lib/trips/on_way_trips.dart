import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:trips/colors.dart';
import 'package:trips/traipsmap.dart';
import 'package:trips/trips/trips_widget/custom_appbar.dart';

late String from;
late String to;
late List trips;

late Map deslocation;
late Map srclocation;

class OneWayTrips extends StatefulWidget {
  final String fromref;
  final String toref;
  final List tripsref;
  final Map deslocationref;
  final Map srclocationref;
  OneWayTrips(
      {super.key,
      required this.fromref,
      required this.toref,
      required this.tripsref,
      required this.deslocationref,
      required this.srclocationref}) {
    from = fromref;
    to = toref;
    trips = tripsref;

    deslocation = deslocationref;
    srclocation = srclocationref;
  }

  @override
  State<OneWayTrips> createState() => _OneWayTripsState();
}

class _OneWayTripsState extends State<OneWayTrips> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Column(
          children: [
            Container(
              height: 165,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: trips.length,
                    itemBuilder: (context, i) {
                      return Container(
                        margin: const EdgeInsets.only(top: 15),
                        child: ListTile(
                          title: Text("No: ${trips[i]['no']}"),
                          subtitle: Text(
                              "Tripping in: ${trips[i]['tripping']} \n Reach in: ${trips[i]['reach']}"),
                          isThreeLine: true,
                          leading: Icon(
                            Icons.bus_alert,
                            size: 50,
                            color: (trips[i]['status'] == true)
                                ? Colors.green
                                : Colors.red,
                          ),
                          trailing: Icon(
                            (trips[i]['curlocation']['online'] == true)
                                ? Icons.my_location
                                : Icons.location_disabled,
                            size: 30,
                            color: AppColor.firstColor,
                          ),
                          onTap: () {
                            if (trips[i]['curlocation']['online'] == true) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TripsMap(
                                            deslocation: deslocation,
                                            srclocation: srclocation,
                                            curlocation: trips[i]
                                                ['curlocation'],
                                          )));
                            } else {
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.warning,
                                animType: AnimType.scale,
                                desc: " The Trip is not available ",
                                btnOkOnPress: () {},
                              ).show();
                            }
                          },
                        ),
                      );
                    }))
          ],
        ),
        CustomAppBar(
          from: from,
          to: to,
        ),
      ],
    ));
  }
}
