import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:pass_keep/model/master_pin.dart';
import '../../boxes.dart';
import '../home_page.dart';

class SetPinScreen extends StatefulWidget {
  const SetPinScreen({Key? key}) : super(key: key);

  @override
  _SetPinScreenState createState() => _SetPinScreenState();
}

class _SetPinScreenState extends State<SetPinScreen> {
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
              showFieldAsBox: true,

              onSubmit: (String masterPin) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Verification Code"),
                      content: Text('Code entered is $masterPin'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            final box = Boxes.getMasterPin();
                            final myPin = MasterPin()
                              ..pin = int.parse(masterPin);
                            box.put('key', myPin);
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ),
                            );
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
