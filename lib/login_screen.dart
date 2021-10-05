import 'package:androidstudio_projects/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';

class login_screen extends StatefulWidget {
  @override
  State<login_screen> createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {
  TextEditingController userInputController = new TextEditingController();

  TextEditingController passInputController = new TextEditingController();

  final loginAuthenticate = SnackBar(content: Text('Invalid credentials.'));

  String userValue = "", passValue = "";

Future<bool?> _onBackPressed(BuildContext context){
  return showDialog(
    context: context,
    builder: (context)=>AlertDialog(
      title: Text("Do you really want to exit?"),
      actions:[
        TextButton(
          child: Text("No"),
          onPressed: ()=>Navigator.pop(context,false),
        ),
        TextButton(
          child: Text("Yes"),
          onPressed: ()=>exit(0),
        ),
      ],
    ));
}
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        final shouldPop = await _onBackPressed(context);
        return shouldPop ?? false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 155, horizontal: 35),
          child: Column(
            children: [
              Text(
                'CHADBANK',
                style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
              SizedBox(height: 25),
              TextField(
                controller: userInputController,
                style:GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 16, color: Colors.white)),
                decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                        fillColor: Colors.white,
                        labelStyle: GoogleFonts.montserrat(
                          textStyle: TextStyle(fontSize: 16, color: Colors.white)),
                    labelText: "Username"),
              ),
              SizedBox(height: 10),
              TextField(
                style:GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 16, color: Colors.white)),
                obscureText: true,
                controller: passInputController,
                decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                        fillColor: Colors.white,
                        labelStyle: GoogleFonts.montserrat(
                          textStyle: TextStyle(fontSize: 16, color: Colors.white)),
                    labelText: "Password"),
    
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    userValue = userInputController.text;
                    passValue = passInputController.text;
                    if (userValue == "admin" && passValue == "admin") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => dashboard_screen()));
                    } else {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(loginAuthenticate);
                    }
                  });
                },
                child: Text(
                  "LOGIN",
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(350, 35),
                  primary: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
