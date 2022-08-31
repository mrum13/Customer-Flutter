import 'dart:convert';

import 'package:ats_customer/models/user_model.dart';
import 'package:ats_customer/shared/shared_prefrences.dart';
import 'package:http/http.dart' as http;

class GetUserService {
  String baseUrl = "http://103.142.111.167:10002/api";
  String token = SharedPreference.loginUser.getString("token");

  Future<UserModel> getUser({
    required String? id,
  }) async {
    var url = '$baseUrl/customerprofile/${id}';
    var header = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var response = await http.get(Uri.parse(url), headers: header);

    var data = jsonDecode(response.body);
    print("Status Get Profile=${data['success']}");

    try {
      if (data['success'] == true) {
        UserModel userModel = UserModel.fromJson(data);

        return userModel;
      } else {
        throw data['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
