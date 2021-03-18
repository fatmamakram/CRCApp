import 'dart:convert';
import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/http_exception.dart';

class Auth with ChangeNotifier {
  Future<void> _authenticate(
      String username, String email, String password, String gender) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {
      'username': username,
      'email': email,
      'password': password,
      'gender': gender
    };
    var jsonResponse = null;

    var url = "http://crc-detector.herokuapp.com/api.php?api_call=signup";

    try {
      final response = await http.post(url, body: data);
      final responseData = json.decode(response.body);
      print(responseData);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      sharedPreferences.setString("token", jsonResponse['token']);

      notifyListeners();
      final prefs = await SharedPreferences.getInstance();
      final userData = json.encode(
        {},
      );
      prefs.setString('userData', userData);
    } catch (error) {
      throw error;
    }
  }

  Future<void> signup(
      String username, String email, String password, String gender) async {
    return _authenticate(username, email, password, gender);
  }

  // Future<void> login(String email, String password) async {
  //   return _authenticate(email, password,);
  // }

//   Future<bool> tryAutoLogin() async {
//     final prefs = await SharedPreferences.getInstance();
//     if (!prefs.containsKey('userData')) {
//       return false;
//     }
//     final extractedUserData =
//         json.decode(prefs.getString('userData')) as Map<String, Object>;
//     final expiryDate = DateTime.parse(extractedUserData['expiryDate']);

//     if (expiryDate.isBefore(DateTime.now())) {
//       return false;
//     }
//     // _token = extractedUserData['token'];
//     // _userId = extractedUserData['userId'];
//     // _expiryDate = expiryDate;
//     notifyListeners();
//     // _autoLogout();
//     return true;
//   }

//   Future<void> logout() async {
//     //_token = null;
//     // _userId = null;
//     // _expiryDate = null;
//     // if (_authTimer != null) {
//     //   _authTimer.cancel();
//     //   _authTimer = null;
//     // }
//     notifyListeners();
//     final prefs = await SharedPreferences.getInstance();
//     // prefs.remove('userData');
//     prefs.clear();
//   }
// }
// //   void _autoLogout() {
// //     if (_authTimer != null) {
// //       _authTimer.cancel();
// //     }
// //     final timeToExpiry = _expiryDate.difference(DateTime.now()).inSeconds;
// //     _authTimer = Timer(Duration(seconds: timeToExpiry), logout);
// //   }
// // }
}