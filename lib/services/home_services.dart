import 'dart:convert';

import 'package:ats_customer/models/branch_model.dart';
import 'package:ats_customer/models/home_model.dart';
import 'package:ats_customer/shared/shared_prefrences.dart';
import 'package:http/http.dart' as http;

class HomeServices {
  String baseUrl = "http://103.142.111.167:10002/api";
  String token = SharedPreference.loginUser.getString("token");

  Future<HomeModel> getHomeData() async {
    var url = '$baseUrl/customerhome';
    var header = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var response = await http.get(Uri.parse(url), headers: header);

    var data = jsonDecode(response.body);
    print("Status Get Home Data=${data['success']}");

    try {
      if (data['success'] == true) {
        HomeModel homeModel = HomeModel.fromJson(data);

        SharedPreference.loginUser
            ?.setString("id_customer", homeModel.data.idCustomer);

        return homeModel;
      } else {
        throw data['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<BranchData>> getBranchData() async {
    var url = '$baseUrl/customeroffice';
    var header = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var response = await http.get(Uri.parse(url), headers: header);

    var data = jsonDecode(response.body);
    print("Status Get Branch Data=${data['success']}");

    try {
      if (data['success'] == true) {
        List allBranch = json.decode(response.body)['data'];
        List<BranchData> allNameBranch = [];

        for (var item in allBranch) {
          allNameBranch.add(BranchData.fromJson(item));
        }
        return allNameBranch;
      } else {
        throw data['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
