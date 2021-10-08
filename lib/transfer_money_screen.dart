import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'total_balance.dart';
import 'transfer_confirmation.dart';

String amount = "";
String accNumber = "";

class transfer_money_screen extends StatefulWidget {
  const transfer_money_screen({Key? key}) : super(key: key);

  @override
  _transfer_money_screenState createState() => _transfer_money_screenState();
}

class _transfer_money_screenState extends State<transfer_money_screen> {
  
  final authenticateAmount = SnackBar(content: Text('Invalid credentials.'));
  TextEditingController amountController = new TextEditingController();
  TextEditingController accNumController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TRANSFER MONEY",
            style: GoogleFonts.montserrat(
                textStyle:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
        backgroundColor: Colors.black,
        centerTitle: true,
        elevation: 0.0,
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(const Radius.circular(40)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 20),
            child: Text(
              "Transfer from",
              style: GoogleFonts.montserrat(
                  textStyle:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 65, horizontal: 15),
            child: SizedBox(
              width: 330,
              height: 200,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius:
                      const BorderRadius.all(const Radius.circular(25)),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 85, left: 290),
            child: Text(
              "VISA",
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 85, left: 30),
            child: Text(
              "5234 6543 **** 6514",
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.normal,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 120, left: 30),
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
            padding: const EdgeInsets.only(top: 140, left: 30),
            child: Text(
              "\$" + " $total_balance",
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
            padding: const EdgeInsets.only(top: 180, left: 30),
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
            padding: const EdgeInsets.only(top: 200, left: 30),
            child: Text(
              "Juan Dela Cruz",
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
            padding: const EdgeInsets.only(top:270, left:30, right:30),
            child: TextField(
              controller: accNumController,
              style: GoogleFonts.montserrat(
                  textStyle: TextStyle(fontSize: 16, color: Colors.black)),
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  fillColor: Colors.black,
                  labelStyle: GoogleFonts.montserrat(
                      textStyle: TextStyle(fontSize: 16, color: Colors.black)),
                  labelText: "Account Number"),
              maxLength: 12,
              keyboardType: TextInputType.number
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:340, left:30, right:30),
            child: TextField(
              controller: amountController,
              style: GoogleFonts.montserrat(
                  textStyle: TextStyle(fontSize: 16, color: Colors.black)),
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  fillColor: Colors.black,
                  labelStyle: GoogleFonts.montserrat(
                      textStyle: TextStyle(fontSize: 16, color: Colors.black)),
                  labelText: "Amount"),
              maxLength: 12,
              keyboardType: TextInputType.number  
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:450, left:30, right:30),
            child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      accNumber = accNumController.text;
                      amount = amountController.text;
                      if(accNumber.length < 12){
                        ScaffoldMessenger.of(context)
                          .showSnackBar(authenticateAmount);
                      }else{
                        if(double.parse(amount)<200 || double.parse(amount)>total_balance){
                        ScaffoldMessenger.of(context)
                          .showSnackBar(authenticateAmount);
                      }else{
                        total_balance -= double.parse(amount);
                        Navigator.push(context,
                      MaterialPageRoute(builder: (context) => transfer_confirmation()));
                      }
                    }
                      
                    });
                  },
                  child: Text(
                    "CONFIRM",
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(350, 40),
                    primary: Colors.black,
                  ),
                ),
          ),
        ],
      ),
    );
  }
}
