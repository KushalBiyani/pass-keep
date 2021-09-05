import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:pass_keep/helper/constants.dart';
import 'package:pass_keep/model/master_pin.dart';
import 'package:pass_keep/utils/master_pin_util.dart';
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
            kheight(30),
            Text(
              'Setup Master Pin',
              style: ktextStyle(25),
            ),
            kheight(30),
            OtpTextField(
              numberOfFields: 5,
              focusedBorderColor: Colors.tealAccent,
              textStyle: ktextStyle(20),
              showFieldAsBox: true,
              onSubmit: (String masterPin) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Verification Code"),
                      content: Text('Code entered is $masterPin'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            final box = Boxes.getMasterPin();
                            final myPin = MasterPin()
                              ..pin = encryptMasterPin(masterPin);
                            box.put('key', myPin);
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ),
                              ModalRoute.withName('/'),
                            );
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
