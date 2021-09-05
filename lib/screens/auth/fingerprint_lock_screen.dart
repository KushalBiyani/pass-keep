import 'package:encrypt/encrypt.dart';
import 'package:flutter/material.dart';
import 'package:pass_keep/screens/home_page.dart';
import 'package:pass_keep/helper/constants.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:pass_keep/utils/master_pin_util.dart';
import 'package:pass_keep/widget/fingerprint_widget.dart';

import '../../boxes.dart';

class FingerPrintAuth extends StatefulWidget {
  @override
  _FingerPrintAuthState createState() => _FingerPrintAuthState();
}

class _FingerPrintAuthState extends State<FingerPrintAuth> {
  bool authenticated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Verify Identity"),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              color: Colors.black54,
            ),
            child: Image.asset(
              'assets/images/splashScreen.png',
              width: 200,
            ),
          ),
          kheight(20.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Enter Your Master Pin",
                style: ktextStyle(22),
                textAlign: TextAlign.center,
              ),
              kheight(30),
              OtpTextField(
                  numberOfFields: 5,
                  focusedBorderColor: Colors.tealAccent,
                  enabledBorderColor: Colors.tealAccent,
                  textStyle: ktextStyle(18),
                  showFieldAsBox: true,
                  onSubmit: (String verificationCode) {
                    var box = Boxes.getMasterPin();
                    String pin = box.get('key')!.pin;
                    if (verificationCode == dencryptMasterPin(pin)) {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                        ModalRoute.withName('/'),
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text(
                            "Invalid Master Pin",
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Try Again"),
                            ),
                          ],
                        ),
                      );
                    }
                  }),
              kheight(25),
              Text(
                'OR',
                style: ktextStyle(20),
              ),
              kheight(25),
              Text(
                'Login Using Fingerprint',
                style: ktextStyle(20),
              ),
              kheight(10),
              TextButton(
                onPressed: () {
                  authenticate(authenticated, context);
                },
                child: const Icon(
                  Icons.fingerprint,
                  size: 50,
                  color: Colors.tealAccent,
                ),
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(
                    Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
