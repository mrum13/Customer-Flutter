import 'dart:convert';

import 'package:ats_customer/models/add_company_model.dart';
import 'package:ats_customer/models/company_switch_model.dart';
import 'package:ats_customer/shared/shared_prefrences.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart' as http;

class CompanyService {
  String baseUrl = "http://103.142.111.167:10002/api";
  String token = SharedPreference.loginUser.getString("token");

  Future<List<CompanyData>> getCompanyData() async {
    var url = '$baseUrl/customerswitchcompany/companylist';
    var header = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var response = await http.get(Uri.parse(url), headers: header);

    var data = jsonDecode(response.body);
    print("Status Get Data Company=${data['success']}");

    try {
      if (data['success'] == true) {
        List allCompany = json.decode(response.body)['data'];
        List<CompanyData> allNameCompany = [];

        for (var item in allCompany) {
          allNameCompany.add(CompanyData.fromJson(item));
        }
        return allNameCompany;
      } else {
        throw data['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<AddCompanyModel> postCompany({
    required String idCustomer,
  }) async {
    var url = '$baseUrl/customerswitchcompany';
    var header = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var body = {
      'id_customer': idCustomer,
    };

    var response = await http.post(
      Uri.parse(url),
      headers: header,
      body: body,
    );

    var data = jsonDecode(response.body);
    print("Status Post Company =${data['success']}");

    try {
      if (data['success'] == true) {
        AddCompanyModel addCompanyModel = AddCompanyModel.fromJson(data);

        return addCompanyModel;
      } else {
        throw "${data['message']}";
      }
    } catch (e) {
      rethrow;
    }
  }
}
