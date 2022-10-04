class RegisterRequestModel {
  RegisterRequestModel({
    required this.firstName,
    required this.lastName,
    required this.dob,
    required this.address,
    required this.gender,
    required this.phone,
    required this.email,
    required this.password,
    required this.role,
  });
  late final String firstName;
  late final String lastName;
  late final String dob;
  late final String address;
  late final String gender;
  late final String phone;
  late final String email;
  late final String password;
  late final String role;

  RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    dob = json['dob'];
    address = json['address'];
    gender = json['gender'];
    phone = json['phone'];
    email = json['email'];
    password = json['password'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['firstName'] = firstName;
    _data['lastName'] = lastName;
    _data['dob'] = dob;
    _data['address'] = address;
    _data['gender'] = gender;
    _data['phone'] = phone;
    _data['email'] = email;
    _data['password'] = password;
    _data['role'] = role;
    return _data;
  }
}
