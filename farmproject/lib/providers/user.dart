import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:farmproject/constants.dart';
// import 'package:farmproject/services/user_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:http/http.dart' as http;

const url = 'farm-prroject-api.herokuapp.com';

//http://176.58.127.254/api/shops/all
class UserModel {
  String? name;
  String? email;
  String? idNumber;
  String? dob;
  String? firstName;
  String? middleName;
  String? lastName;
  String? residentialAddress;
  String? phone;
  String? gender;
  String? preference;
  String? idType;
  String? idPhoto;

  // String? password;

  UserModel({
    this.email,
    this.name,
    this.idNumber,
    this.residentialAddress,
    this.middleName,
    this.idType,
    this.dob,
    this.firstName,
    this.gender,
    this.lastName,
    this.phone,
    this.preference,
    this.idPhoto,
  });

  factory UserModel.fromJson(dynamic json) {
    return UserModel(
      name: json['name'],
      idNumber: json['id_number'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      dob: json['dob'],
      residentialAddress: json['residential_address'],
      email: json['email'],
      gender: json['gender'],
      phone: json['phone'],
      idPhoto: json['id_photo'],
      idType: json['id_type'],
    );
  }
}

class User with ChangeNotifier {
  UserModel? _user;
  UserModel? get user {
    return _user;
  }

  Future<UserModel?> signInUser({
    required String email,
    required String password,
  }) async {
    var responseJson;
    // // String? value = await storage.read(key: 'user_token');
    log(
      Uri.https(
        url,
        '/users/login',
      ).toString(),
    );
    var response = await http.post(
      Uri.https(
        url,
        '/users/login',
      ),

      // Send authorization headers to the backend.

      body: jsonEncode(
        {
          "email": email,
          "password": password,
        },
      ),
      headers: {
        'Content-Type': 'application/json',
        "Accept": "*/*",
        "Connection": "keep-alive",
        "Accept-Encoding": "gzip, deflate, br"
      },
    );

    try {
      log(response.statusCode.toString());
      // log(response.body.toString());
      if (response.statusCode == 200) {
        responseJson = jsonDecode(response.body);
        //final responseData = UserModel.fromJson(jsonDecode(response.body));
        //final responseData = jsonDecode(response.body);
        //_user = parsedUser;
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
    return UserModel();
  }

  Future<UserModel?> registerUser(
      {required String name,
      required String email,
      required String password}) async {
    var responseJson;
    //String? value = await storage.read(key: 'user_token');

    var response = await http.post(
      Uri.https(
        url,
        '/users',
      ),

      // Send authorization headers to the backend.

      body: jsonEncode(
        {
          "email": email,
          "name": name,
          "password": password,
        },
      ),
      headers: {
        'Content-Type': 'application/json',
        "Accept": "*/*",
        "Connection": "keep-alive",
        "Accept-Encoding": "gzip, deflate, br"
      },
    );

    try {
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        responseJson = jsonDecode(response.body);
        //final parsedUser = UserModel.fromJson(jsonDecode(response.body));
        //_user = parsedUser;

        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
    return UserModel();
  }
}

//   // Future<void> insertIntoDbFromJson(dynamic decodedJson) async {
//   //   UserModel user = new UserModel();

//   //   String? profilePic = '';

//   //   try {
//   //     user = await fetchUserDataFromDb();
//   //   } catch (e) {
//   //     print(e);
//   //   }

//   //   if (user.firstName != null) {
//   //     profilePic = user.idPhoto;
//   //   }

//   //   profilePic == '' ? null : profilePic;

//   //   final parsedUser = UserModel.fromJson(decodedJson);

//   //   // await DBHelper.insert('User', {
//   //   //   'id': parsedUser.id,
//   //   //   'firstName': parsedUser.firstName,
//   //   //   'lastName': parsedUser.lastName,
//   //   //   'address': parsedUser.address,
//   //   //   'phone': parsedUser.phone,
//   //   //   'dob': parsedUser.dob,
//   //   //   'gender': parsedUser.gender,
//   //   //   'email': parsedUser.email,
//   //   //   'profilePhoto': profilePic
//   //   // });

//   //   parsedUser.idPhoto = profilePic;

//   //   _user = parsedUser;

//   //   notifyListeners();
//   // }

//   // static Future<UserModel> fetchUserDataFromDb() async {
//   //   final dataList = await DBHelper.getData('User');

//   //   if (dataList.isEmpty) {
//   //     return new UserModel();
//   //   }
//   //   var item = dataList[0];

//   //   return UserModel(
//   //       id: item['id'],
//   //       address: item['address'],
//   //       dob: item['dob'],
//   //       email: item['email'],
//   //       firstName: item['firstName'],
//   //       lastName: item['lastName'],
//   //       phone: item['phone'],
//   //       gender: item['gender'],
//   //       profilePhoto: item['profilePhoto']);
//   // }

//   Future<void> uploadImage(File image) async {
//     String? token = await storage.read(key: 'user_token');
//     var uri = Uri.parse('$url/${_user.idNumber}');
//     var request = http.MultipartRequest('PUT', uri)
//       ..headers.addAll({
//         'Content-Type': 'application/json',
//         'x-auth-token': token == null ? '' : token
//       })
//       ..files.add(await http.MultipartFile.fromPath(
//         'profilePhoto',
//         image.path,
//       ));
//     var response = await request.send();

//     if (response.statusCode == 200) {
//       print('Uploaded!');
//       response.stream.transform(utf8.decoder).listen((value) {
//         _user.idPhoto = jsonDecode(value)['profilePhoto'];
//       });

//       notifyListeners();
//     }
//   }
// }
