import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:trips/colors.dart';
import 'package:trips/traipsmap.dart';
import 'package:trips/trips/trips_widget/custom_appbar.dart';

late String from;
late String to;
late Map trips;
late List listtrips;
late Map deslocation;
late Map srclocation;

class RoundTrips extends StatefulWidget {
  final String fromref;
  final String toref;
  final Map tripsref;
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
    listtrips = [];
    trips.forEach((key, value) {
      listtrips.add(value);
    });
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
                    itemCount: listtrips.length,
                    itemBuilder: (context, i) {
                      return Container(
                        margin: const EdgeInsets.only(top: 15),
                        child: ListTile(
                          title: Text("No: ${listtrips[i]['no']}"),
                          subtitle: Text(
                              "Tripping in: ${listtrips[i]['tripping']} \n Reach in: ${listtrips[i]['reach']} \n Backing in: ${listtrips[i]['back']}"),
                          isThreeLine: true,
                          leading: Icon(
                            Icons.bus_alert,
                            size: 50,
                            color: (listtrips[i]['status'] == true)
                                ? Colors.green
                                : Colors.red,
                          ),
                          trailing: Icon(
                            (listtrips[i]['curlocation']['online'] == true)
                                ? Icons.my_location
                                : Icons.location_disabled,
                            size: 30,
                            color: AppColor.firstColor,
                          ),
                          onTap: () {
                            if (listtrips[i]['curlocation']['online'] == true) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TripsMap(
                                            deslocation: deslocation,
                                            srclocation: srclocation,
                                            curlocation: listtrips[i]
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
