import 'package:farmproject/services/networking.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const usersURL = 'https://farm-project-api.herokuapp.com/users/';
final storage = FlutterSecureStorage();

class UserModel {
  final String? firstName;
  final String? middleName;
  final String? lastName;
  final String? residentialAddress;
  final String? phone;
  final String? dob;
  final String? gender;
  final String? email;
  final String? preference;
  final String? idType;
  String? idPhoto;
  final String? idNumber;

  UserModel({
    this.idNumber,
    this.residentialAddress,
    this.middleName,
    this.idType,
    this.dob,
    this.email,
    this.firstName,
    this.gender,
    this.lastName,
    this.phone,
    this.preference,
    this.idPhoto,
  });

  factory UserModel.fromJson(dynamic json) {
    return UserModel(
        idNumber: json['_id'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        dob: json['dob'] == null ? 'null' : json['dob'],
        residentialAddress: json['address'] == null ? '' : json['address'],
        email: json['email'] == null ? '' : json['email'],
        gender: json['gender'] == null ? '' : json['gender'],
        phone: json['phone'],
        idPhoto: json['id_photo'] ?? '',
        idType: json['id_type']);
  }


//   Future<UserModel> fetchUserDataFromDb() async {
//   final dataList = await DBHelper.getData('user');
//   var item = dataList[0];

//   return UserModel(
//       id: item['id'],
//       address: item['address'],
//       dob: item['dob'],
//       email: item['email'],
//       firstName: item['firstName'],
//       lastName: item['lastName'],
//       phone: item['phone'],
//       gender: item['gender']);
// }

  Future<dynamic> registerUser(
      firstName, lastName, email, password, phone) async {
    var url = usersURL;
    NetworkHelper networkHelper = NetworkHelper(url: url);
    final _data = <String, dynamic>{};
    _data['email'] = email;
    _data['password'] = password;
    _data['phone'] = phone.toString();
    _data['firstName'] = firstName;
    _data['lastName'] = lastName;

    print('Data to be sent $_data');

    var data = await networkHelper.sendData(_data);

    if (data['status_code'] == 200) {
      await storage.write(key: 'user_token', value: data['user_token']);
      //await User().getCurrentUser();
      return data['status_code'];
    }
  }
}
