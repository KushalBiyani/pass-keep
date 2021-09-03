import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:pass_keep/screens/splash_screen.dart';
import 'package:pass_keep/helper/constants.dart';

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
            builder: (context) => SplashScreenPage(),
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
      body: Center(
        child: Column(
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
                    "Oh Snap ! You Need to authenticate to move forward.",
                    style: kAuthenticationMessageStyle,
                    textAlign: TextAlign.center,
                  ),
                  //
                  const SizedBox(
                    height: 40.0,
                  ),
                  //
                  TextButton(
                    onPressed: () {
                      authenticate();
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          "Try Again",
                          style: kTryAgainButtonTextStyle,
                        ),
                        //
                        SizedBox(
                          width: 5.0,
                        ),
                        //
                        Icon(
                          Icons.replay_rounded,
                          color: Colors.tealAccent,
                        ),
                      ],
                    ),
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(
                        Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
