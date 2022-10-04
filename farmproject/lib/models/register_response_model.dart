import 'dart:convert';

RegisterResponseModel registerResponseModel(String str) =>
    RegisterResponseModel.fromJson(json.decode(str));

class RegisterResponseModel {
  RegisterResponseModel({
    required this.id,
    required this.email,
  });
  late final String id;
  late final String email;

  RegisterResponseModel.fromJson(Map<String, dynamic> json) {
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
