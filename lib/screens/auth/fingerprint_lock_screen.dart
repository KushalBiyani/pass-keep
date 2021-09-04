import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:pass_keep/screens/home_page.dart';
import 'package:pass_keep/helper/constants.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

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
            "You need to setup either PIN or Fingerprint Authentication to be able to use this App !\nWe are doing this for your safety 🙂",
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
  void initState() {
    authenticate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Verify Identity"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              color: Colors.black54,
            ),
            child: Image.asset(
              'assets/images/splashScreen.png',
              width: 250,
            ),
          ),
          //
          const SizedBox(
            height: 20.0,
          ),
          //
          if (!authenticated)
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Please Enter Your 5 Digit Master Pin To Continue.",
                  style: kAuthenticationMessageStyle,
                  textAlign: TextAlign.center,
                ),
                //
                const SizedBox(
                  height: 40.0,
                ),
                //
                OtpTextField(
                  numberOfFields: 5,
                  focusedBorderColor: Colors.tealAccent,
                  enabledBorderColor: Colors.tealAccent,
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
                              onPressed: () {},
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }, // end onSubmit
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  'OR',
                  style:
                      kLoginScreenBottomTextStyle.copyWith(color: Colors.white),
                ),
                SizedBox(
                  height: 40,
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
