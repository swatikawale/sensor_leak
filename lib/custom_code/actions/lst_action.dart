// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

//import 'dart:js';

import 'package:installed_apps/app_info.dart';

import 'package:installed_apps/installed_apps.dart';

Future<void> lstAction() async {
  List<AppInfo> apps = await InstalledApps.getInstalledApps();

  for (AppInfo a in apps) {
    print(a.name);

    // Show an alert dialog with the app name
    var context;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('App Name'),
          content: Text(a.name),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );

    // For demonstration purposes, we break after the first app name
    break;
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
