import 'package:androidstudio_projects/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class authentication_screen extends StatelessWidget {
  const authentication_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Stack(children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 120, horizontal:20),
                child: Text("Hello",
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            fontSize: 100, fontWeight: FontWeight.bold, color: Colors.white))),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 220, horizontal:20),
                child: Text("There.",
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            fontSize: 100, fontWeight: FontWeight.bold),color: Colors.white)),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top:500),
                  child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        minimumSize: Size(350,40),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => login_screen()));
                      },
                      child: Text(
                        "Sign In",
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(fontSize: 18,color: Colors.black)),
                      ),
                      ),
                ),
              )
            ])
          ],
        ));
  }
}
