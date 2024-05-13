class User {
  final String id;
  final String name;
  final String email;
  final String device;
  final String token;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.device,
    required this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      device: json['device'],
      token: json['token'],
    );
  }
}
