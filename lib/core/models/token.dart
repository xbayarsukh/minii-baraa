class Token {
  String? accessToken;

  Token({this.accessToken});

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
      accessToken: json['access_token'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'access_token': accessToken,
    };
  }
}
