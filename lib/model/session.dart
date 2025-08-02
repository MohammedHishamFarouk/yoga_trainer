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
      audio: json['assets']['audio'],
      sequence: json['sequence'],
    );
  }
}
