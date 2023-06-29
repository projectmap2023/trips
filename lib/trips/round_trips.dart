import 'package:flutter/material.dart';
import 'package:trips/colors.dart';
import 'package:trips/traipsmap.dart';
import 'package:trips/trips/trips_widget/buy_ticket.dart';
import 'package:trips/trips/trips_widget/custom_appbar.dart';
import 'package:trips/trips/trips_widget/warning_dialog.dart';

late String from;
late String to;
late List trips;

late Map deslocation;
late Map srclocation;

class RoundTrips extends StatefulWidget {
  final String fromref;
  final String toref;
  final List tripsref;
  final Map deslocationref;
  final Map srclocationref;
  RoundTrips(
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
  State<RoundTrips> createState() => _RoundTripsState();
}

class _RoundTripsState extends State<RoundTrips> {
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
                              "Tripping in: ${trips[i]['tripping']} \n Reach in: ${trips[i]['reach']} \n Backing in: ${trips[i]['back']}"),
                          isThreeLine: true,
                          leading: Icon(
                            Icons.bus_alert,
                            size: 50,
                            color: (trips[i]['status'] == true)
                                ? Colors.green
                                : Colors.red,
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              (trips[i]['curlocation']['online'] == true)
                                  ? Icons.my_location
                                  : Icons.location_disabled,
                              size: 30,
                              color: AppColor.firstColor,
                            ),
                            onPressed: () {
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
                                warningDialog(context,
                                    "The Trip is not available on map");
                              }
                            },
                          ),
                          onTap: () {
                            if (trips[i]['status']) {
                              buyTicketDialog(context);
                            } else {
                              warningDialog(
                                  context, "The Trip is not available ");
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
