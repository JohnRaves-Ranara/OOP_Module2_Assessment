//test
//test
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TransferConfirmation extends StatefulWidget {
  const TransferConfirmation ({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<TransferConfirmation> createState() => _TransferConfirmationState();
}

class _TransferConfirmationState extends State<TransferConfirmation> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('TRANSFER MONEY',
            style: GoogleFonts.montserrat(
                textStyle:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
      backgroundColor: Colors.black,
      centerTitle: true,
      elevation: 0.0,
      ), 
      body: Stepper(
        steps: _mySteps(),
        currentStep: this._currentStep,
        onStepContinue: (){
          final isLastStep = _currentStep == _mySteps().length - 1;

         if (isLastStep) {
           print('Completed');
          
         } else {
           setState(() => _currentStep +=1);
         }
        },
        onStepCancel: 
        _currentStep == 0 ? null : () => setState(() => _currentStep -= 1),
        ),
    );
  }

  List<Step> _mySteps(){
    List<Step> _steps = [
      Step(
        title: Text('Transfer from:'),
        content: Text('SAVINGS ACCOUNT | 2698436842 \n Transfer Amount PHP 1,500.00 \n Service Fee PHP 0.00 \n Total Amount Deducted: 1,500 \n Transfer Service: InstaPay'),
        isActive: _currentStep >= 0,
      ),
      Step(
        title: Text('Transfer to:'),
        content: Text('Bank: \n GCASH \n Account Number: 09178946248 \n Account Name: Jonathan'),
        isActive: _currentStep >= 1,
      ),
      Step(
        title: Text('Terms and Condition Accepted'),
        content: Text(''),
        isActive: _currentStep >= 2,
      ),
      Step(
        title: Text('One-Time PIN accepted'),
        content: Text(''),
        isActive: _currentStep >= 3,
      ),
      Step(
        title: Text('Transfer Money was successful!'),
        content: Text('Confirmation Date & Time 05 - JULY- 2021 \n  Confirmation Number:156842710'),
        isActive: _currentStep >= 4,
      )
    ];
    return _steps;
  }
}
