import 'dart:convert';

import 'package:flutter/services.dart';

class Session {
  final Map<String, dynamic> metadata;
  final Map<String, dynamic> assets;
  final Map<String, dynamic> audio;
  final List sequence;

  Session({
    required this.metadata,
    required this.assets,
    required this.audio,
    required this.sequence,
  });
  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(
      metadata: json['metadata'],
      assets: json['assets'],
      audio: json['audio'],
      sequence: json['sequence'],
    );
  }
}

Future<List<Session>> loadSession() async {
  final manifest = await rootBundle.loadString('AssetsManifest.json');
  final files = jsonDecode(
    manifest,
  ).keys.where((path) => path.contains('sessions/'));
  final List<Session> sessions = [];
  for (var file in files) {
    final session = await rootBundle.loadString(file);
    sessions.add(Session.fromJson(jsonDecode(session)));
  }
  return sessions;
}
