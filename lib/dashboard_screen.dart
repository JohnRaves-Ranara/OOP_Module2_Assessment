import 'package:androidstudio_projects/dummy_transfermoney_screen.dart';
import 'package:androidstudio_projects/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:androidstudio_projects/total_balance.dart';

class dashboard_screen extends StatefulWidget {
  const dashboard_screen({Key? key}) : super(key: key);

  @override
  State<dashboard_screen> createState() => _dashboard_screenState();
}

class _dashboard_screenState extends State<dashboard_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("OVERVIEW",
            style: GoogleFonts.montserrat(
                textStyle:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
        backgroundColor: Colors.black,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Stack(clipBehavior: Clip.none, children: [
        Container(
          color: Colors.black,
          height: 1920,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(const Radius.circular(40)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 55, left: 20),
          child: Text(
            "Cards",
            style: GoogleFonts.montserrat(
                textStyle:
                    TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 110, horizontal: 15),
          child: SizedBox(
            width: 380,
            height: 250,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: const BorderRadius.all(const Radius.circular(25)),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 130, left: 320),
          child: Text(
            "VISA",
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                fontStyle: FontStyle.italic,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 130, left: 50),
          child: Text(
            "5234 6543 **** 6514",
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                fontStyle: FontStyle.normal,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 190, left: 50),
          child: Text(
            "Balance",
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                fontStyle: FontStyle.normal,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 210, left: 50),
          child: Text(
            "\$" + " $total_balance",
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.normal,
                fontStyle: FontStyle.normal,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 280, left: 50),
          child: Text(
            "Name",
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                fontStyle: FontStyle.normal,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 300, left: 50),
          child: Text(
            "Juan Dela Cruz",
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.normal,
                fontStyle: FontStyle.normal,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ]),
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: ListView(
            children: [
              ListTile(
                title: Text("Transfer Money",
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ))),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => dummy_transfermoney_screen()));
                },
              ),
              ListTile(
                title: Text("Logout",
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ))),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => login_screen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
