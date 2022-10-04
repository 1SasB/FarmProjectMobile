class LoginResponseModel {
  LoginResponseModel({
    required this.id,
    required this.email,
  });
  late final String id;
  late final String email;

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['email'] = email;
    return _data;
  }
}
