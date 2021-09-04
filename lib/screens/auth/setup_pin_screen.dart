
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import '../home_page.dart';

class SetPinScreen extends StatefulWidget {
  @override
  _SetPinScreenState createState() => _SetPinScreenState();
}

class _SetPinScreenState extends State<SetPinScreen> {
  late int pin;

  Future next() async {
    await Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (_) => HomePage(),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/splashScreen.png',
              width: 250,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Setup Master Pin',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Electrolize',
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            OtpTextField(
              numberOfFields: 5,
              focusedBorderColor: Colors.tealAccent,
              textStyle:
                  TextStyle(color: Colors.white, fontFamily: 'Electrolize'),
              //set to true to show as box or false to show as dash
              showFieldAsBox: true,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Verification Code"),
                      content: Text('Code entered is $verificationCode'),
                      actions: [
                        TextButton(
                          onPressed: () {},
                          child: Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {

                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              }, // end onSubmit
            ),
          ],
        ),
      ),
    );
  }
}
