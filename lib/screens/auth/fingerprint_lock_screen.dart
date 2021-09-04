import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:pass_keep/screens/home_page.dart';
import 'package:pass_keep/helper/constants.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../../boxes.dart';

class FingerPrintAuth extends StatefulWidget {
  @override
  _FingerPrintAuthState createState() => _FingerPrintAuthState();
}

class _FingerPrintAuthState extends State<FingerPrintAuth> {
  bool authenticated = false;
  Future<void> authenticate() async {
    try {
      var localAuth = LocalAuthentication();
      authenticated = await localAuth.authenticate(
        localizedReason: 'Please authenticate to view your Passwords',
        useErrorDialogs: true,
      );
      if (authenticated) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      } else {
        setState(() {});
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text(
            "ERROR",
          ),
          content: const Text(
            "Something Went Wrong",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Ok",
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Verify Identity"),
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
          //
          const SizedBox(
            height: 20.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Enter Your Master Pin",
                style: kAuthenticationMessageStyle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30.0,
              ),
              OtpTextField(
                  numberOfFields: 5,
                  focusedBorderColor: Colors.tealAccent,
                  enabledBorderColor: Colors.tealAccent,
                  textStyle:
                      TextStyle(color: Colors.white, fontFamily: 'Electrolize'),
                  showFieldAsBox: true,
                  onSubmit: (String verificationCode) {
                    var box = Boxes.getMasterPin();
                    int pin = box.get('key')!.pin;
                    if (int.parse(verificationCode) == pin) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
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
                              child: const Text(
                                "Try Again",
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  }),
              SizedBox(
                height: 25,
              ),
              Text(
                'OR',
                style:
                    kLoginScreenBottomTextStyle.copyWith(color: Colors.white),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                'Login Using Fingerprint',
                style: kLoginScreenBottomTextStyle,
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () {
                  authenticate();
                },
                child: Icon(
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
