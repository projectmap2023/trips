import 'package:flutter/material.dart';
import 'package:trips/trips/paypalPage.dart';

import '../../auth/auth_widget/signinbutton.dart';
import '../../colors.dart';

buyTicketDialog(context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            "Buying a Ticket",
            textAlign: TextAlign.center,
          ),
          content: SizedBox(
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ListTile(
                  title: const Text("Ticket Price:1000 EGP"),
                  leading: Icon(
                    Icons.price_change,
                    size: 30,
                    color: AppColor.firstColor,
                  ),
                ),
                ListTile(
                  title: const Text("Available Seats:20"),
                  leading: Icon(
                    Icons.chair_alt,
                    size: 30,
                    color: AppColor.firstColor,
                  ),
                ),
                const SizedBox(
                  width: 140,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(label: Text("Number of seats")),
                  ),
                ),
                SignButton(
                  label: 'Submit',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CheckoutPage()));
                  },
                )
              ],
            ),
          ),
        );
      });
}
