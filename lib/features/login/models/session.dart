class Session {
  Session({
    required this.id,
    required this.accessToken,
    required this.refreshToken,
    required this.userId,
    required this.expiresAt,
    required this.updatedAt,
    required this.createdAt,
    required this.userUuid,
  });

  final int id;
  final String accessToken;
  final String refreshToken;
  final int userId;
  final String expiresAt;
  final String updatedAt;
  final String createdAt;
  final String userUuid;

  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(
      id: json['id'],
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
      userId: json['userId'],
      expiresAt: json['expiresAt'],
      updatedAt: json['updatedAt'],
      createdAt: json['createdAt'],
      userUuid: json['userUuid'],
    );
  }
}