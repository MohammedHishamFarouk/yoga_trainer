import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yoga_trainer/model/session.dart';

class SessionProvider extends ChangeNotifier {
  final List<Session> sessions = [];
  List<String> assets = [];
  int timeLeft = 30;
  Future<void> loadSession() async {
    final manifest = await AssetManifest.loadFromAssetBundle(rootBundle);
    final files = manifest.listAssets().where(
      (element) => element.contains('sessions/'),
    );
    for (var file in files) {
      final session = await rootBundle.loadString(file);
      sessions.add(Session.fromJson(jsonDecode(session)));
    }
    assets = List<String>.from(
      manifest.listAssets().where((element) => element.contains('images/')),
    );
    notifyListeners();
  }

  void timer(BuildContext context) {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (timeLeft > 0) {
        timeLeft--;
      } else {
        timer.cancel();
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Time Over'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Ok'),
                ),
              ],
            );
          },
        );
      }

      notifyListeners();
    });
  }
}
