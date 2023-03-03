// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:biticonapp/App/Auth/Model/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseHandler {
  Future<bool> isExists(String inputString) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var check = prefs.getString(inputString);
    return check == null ? false : true;
  }

// ? < = = = = = = = = = = = Current User Data = = = = = = = = = = = = = = = >
  setCurrentUser(Map<String, dynamic> myData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String rawJson = jsonEncode(myData);
    print(rawJson);
    final result = await prefs.setString('currentUser', rawJson);
    print('List is saved ' + result.toString());
  }

  setLoginUser(Userlogin data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isEmailVerified", data.isEmailVerified);
    await prefs.setBool("isPhoneVerified", data.isPhoneVerified);
    await prefs.setBool("isKeyProtected", data.isKeyProtected);
    await prefs.setBool("isActive", data.isActive);
    await prefs.setBool("isDeleted", data.isDeleted);
    await prefs.setString("_id", data.id.toString());
    await prefs.setString("fullName", data.fullName.toString());
    await prefs.setString("contact", data.contact.toString());
    await prefs.setString("role", data.role.toString());
    await prefs.setString("token", data.token.toString());

    await prefs.setString("countryName", data.countryName.toString());
    await prefs.setString("countryCode", data.countryCode.toString());
    await prefs.setString("email", data.email.toString());

    print('saved current User Details');
  }

  Future<Userlogin> getLoginUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isEmailVerified = await prefs.getBool("isEmailVerified") ?? false;
    bool isPhoneVerified = await prefs.getBool("isPhoneVerified") ?? false;
    bool isKeyProtected = await prefs.getBool("isKeyProtected") ?? false;
    bool isActive = await prefs.getBool("isActive") ?? false;
    bool isDeleted = await prefs.getBool("isDeleted") ?? false;
    String id = await prefs.getString("_id") ?? "";
    String fullname = await prefs.getString("fullName") ?? "";
    String contact = await prefs.getString("contact") ?? "";
    String role = await prefs.getString("role") ?? "";
    String token = await prefs.getString("token") ?? "";

    String countryCode = await prefs.getString("countryName") ?? "";
    String countryName = await prefs.getString("countryCode") ?? "";
    String email = await prefs.getString("email") ?? "";

    return Userlogin(
      isEmailVerified: isEmailVerified,
      isPhoneVerified: isPhoneVerified,
      isKeyProtected: isKeyProtected,
      isActive: isActive,
      isDeleted: isDeleted,
      id: id,
      fullName: fullname,
      contact: contact,
      role: role,
      token: token,
      countryName: countryName,
      countryCode: countryCode,
      email: email,
    );
  }

  // getCurrentUser() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final response = await prefs.getString('currentUser') ?? '';
  //   return jsonDecode(response);
  // }

  //? < = = = = = = = = = = = OnBoarding value = = = = = = = = = = = = = = = >

  setOnBoarding(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var val = await prefs.setBool('onBoarding', value);
    print("Stay LoggedIn value is $val");
  }

  getOnBoarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await prefs.getBool('onBoarding') ?? false;
    return response;
  }

  //? < = = = = = = = = = = = Stay LoggedIn Email and Password value = = = = = = = = = = = = = = = >

  setStayEmail(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var val = await prefs.setString('stayemail', value);
    print("Stay Email save $val");
  }

  getStayEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await prefs.getString('stayemail') ?? "";
    return response;
  }

  setStayPassword(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var val = await prefs.setString('staypassword', value);
    print("Stay Email save $val");
  }

  getStayPassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await prefs.getString('staypassword') ?? "";
    return response;
  }

//? < = = = = = = = = = = = User Access Token = = = = = = = = = = = = = = = >
  setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final result = await prefs.setString('accesstoken', token);
    print("accesstoken saved " + result.toString());
  }

  getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = prefs.getString('accesstoken') ?? "";
    return response;
  }

  removeToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }

//? < = = = = = = = = = = = User Type = = = = = = = = = = = = = = = >
  // setCurrentUserType(String token) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final result = await prefs.setString('usertype', token);
  //   print("token saved " + result.toString());
  // }

  // getCurrentUserType() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final response = prefs.getString('usertype') ?? "";
  //   return response;
  // }

//? < = = = = = = = = = = = User ID = = = = = = = = = = = = = = = >
  // setCurrentUserID(String id) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final result = await prefs.setString('userID', id);
  //   print("userID saved " + result.toString());
  // }

  // getCurrentUserID() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final response = prefs.getString('userID') ?? "";
  //   return response;
  // }

  // removeCurrentUserID() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.remove('userID');
  // }

  //? < = = = = = = = = = = = User FCM = = = = = = = = = = = = = = = >
  setFCMToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final result = await prefs.setString('FCM', token);
    print("fcm saved " + result.toString());
  }

  getFCMToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = prefs.getString('FCM') ?? "";
    return response;
  }

//? < = = = = = = = = = = = Logout = = = = = = = = = = = = =>
  logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('accesstoken');
    await prefs.remove("isEmailVerified");
    await prefs.remove("isPhoneVerified");
    await prefs.remove("isActive");
    await prefs.remove("isDeleted");
    await prefs.remove("_id");
    await prefs.remove("fullName");
    await prefs.remove("contact");
    await prefs.remove("role");
    await prefs.remove("token");
    print("LogOut Successfull");
  }
}


//  SharedPreferences prefs = await SharedPreferences.getInstance();
//     bool isEmailVerified = await prefs.getBool("isEmailVerified") ?? false;
//     bool isPhoneVerified = await prefs.getBool("isPhoneVerified") ?? false;
//     bool isActive = await prefs.getBool("isActive") ?? false;
//     bool isDeleted = await prefs.getBool("isDeleted") ?? false;
//     String id = await prefs.getString("_id") ?? "";
//     String fullname = await prefs.getString("fullName") ?? "";
//     String contact = await prefs.getString("contact") ?? "";
//     String role = await prefs.getString("role") ?? "";
//     String token = await prefs.getString("token") ?? "";