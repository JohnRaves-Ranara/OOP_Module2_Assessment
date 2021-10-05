import 'package:androidstudio_projects/dashboard_screen.dart';
import 'package:androidstudio_projects/total_balance.dart';
import 'package:flutter/material.dart';

String amount = "";

class dummy_transfermoney_screen extends StatefulWidget {
  const dummy_transfermoney_screen({Key? key}) : super(key: key);
  @override
  _dummy_transfermoney_screenState createState() =>
      _dummy_transfermoney_screenState();
}

class _dummy_transfermoney_screenState
    extends State<dummy_transfermoney_screen> {
  TextEditingController amountTextField = new TextEditingController();

  final authenticateAmount = SnackBar(content: Text("Invalid amount."));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: amountTextField,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(),
              labelText: "Enter amount",
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              setState(() {
                amount = amountTextField.text;
                if (double.parse(amount) < 200.0 ||
                    double.parse(amount) > total_balance) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(authenticateAmount);
                } else {
                  total_balance -= double.parse(amount);
                  print("transfer successful. total balance $total_balance");
                }
              });
            },
            child: Text("Confirm"),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => dashboard_screen()));
              },
              child: Text("back"))
        ],
      ),
    );
  }
}
