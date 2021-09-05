import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:pass_keep/screens/home_page.dart';

Future<void> authenticate(authenticated, context) async {
  try {
    var localAuth = LocalAuthentication();
    authenticated = await localAuth.authenticate(
        localizedReason: 'Please authenticate to view your Passwords',
        useErrorDialogs: true,
        stickyAuth: true);
    if (authenticated) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
        ModalRoute.withName('/'),
      );
    }
  } catch (e) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("ERROR"),
        content: const Text("Something Went Wrong"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Ok"),
          ),
        ],
      ),
    );
  }
}
