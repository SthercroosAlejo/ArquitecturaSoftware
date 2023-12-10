class User {
  final int id;
  final String name;
  final String email;
  final String createdAt;
  final String updatedAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id : json['id'],
      name : json['name'],
      email : json['email'],
      createdAt : json['created_at'],
      updatedAt : json['updated_at']
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id']=id;
    data['name']=name;
    data['email']=email;
    data['created_at']=createdAt;
    data['updated_at']=updatedAt;
    return data;
  }
}