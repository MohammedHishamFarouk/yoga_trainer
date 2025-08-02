import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yoga_trainer/model/session.dart';

class SessionProvider extends ChangeNotifier {
  final List<dynamic> sessions = [];
  String trial = '';
  Future<void> loadSession() async {
    final manifest = await AssetManifest.loadFromAssetBundle(rootBundle);
    final files = manifest.listAssets().where(
      (element) => element.contains('sessions/'),
    );
    for (var file in files) {
      final session = await rootBundle.loadString(file);
      sessions.add(Session.fromJson(jsonDecode(session)));
    }
    trial = manifest
        .listAssets()
        .where(
          (element) => element.contains(
            sessions[0].assets['images'][sessions[0]
                .assets['images']
                .keys
                .first],
          ),
        )
        .first;
    notifyListeners();
  }
}
