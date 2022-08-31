import 'dart:convert';

import 'package:ats_customer/models/list_customer_auth_model.dart';
import 'package:ats_customer/models/otp_model.dart';
import 'package:ats_customer/models/user_login_model.dart';
import 'package:ats_customer/models/user_register_model.dart';
import 'package:ats_customer/shared/shared_prefrences.dart';
import 'package:http/http.dart' as http;

class AuthService {
  String baseUrl = "http://103.142.111.167:10002/api";

  Future<OtpModel> getOtp({
    required String phone,
    required String name,
    required String idCustomer,
    required String password,
  }) async {
    var url = '$baseUrl/customeruser/getotp';
    var header = {
      'Accept': 'application/json',
    };
    var body = {
      'name': name,
      'id_customer': idCustomer,
      'phone': phone,
      'password': password
    };

    var response = await http.post(
      Uri.parse(url),
      headers: header,
      body: body,
    );

    var data = jsonDecode(response.body);
    print("Status GetOTP=${data['success']}");

    try {
      if (data['success'] == true) {
        OtpModel otpModel = OtpModel.fromJson(data);

        SharedPreference.registUser?.setString("name", name);
        SharedPreference.registUser?.setString("idCustomer", idCustomer);
        SharedPreference.registUser?.setString("password", password);
        return otpModel;
      } else {
        throw data['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UserRegisterModel> registUser({
    required String phone,
    required String name,
    required String idCustomer,
    required String password,
    required String otp,
  }) async {
    var url = '$baseUrl/customeruser/register';
    var header = {
      'Accept': 'application/json',
    };
    var body = {
      'name': name,
      'id_customer': idCustomer,
      'phone': phone,
      'password': password,
      'otp': otp
    };

    var response = await http.post(
      Uri.parse(url),
      headers: header,
      body: body,
    );

    var data = jsonDecode(response.body);
    print("Status Regist User=${data['success']}");

    try {
      if (data['success'] == true) {
        UserRegisterModel userRegisterModel = UserRegisterModel.fromJson(data);

        return userRegisterModel;
      } else {
        throw data['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UserLoginModel> loginUser({
    required String phoneNo,
    required String password,
  }) async {
    var url = '$baseUrl/customeruser/login';
    var header = {
      'Accept': 'application/json',
    };
    var body = {
      'username': phoneNo,
      'password': password,
    };

    var response = await http.post(
      Uri.parse(url),
      headers: header,
      body: body,
    );

    var data = jsonDecode(response.body);
    print("Status Login User=${data['success']}");

    try {
      if (data['success'] == true) {
        UserLoginModel userLoginModel = UserLoginModel.fromJson(data);

        SharedPreference.loginUser?.setString("id", userLoginModel.data.id);
        SharedPreference.loginUser
            ?.setString("token", userLoginModel.data.token);

        return userLoginModel;
      } else {
        throw data['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
