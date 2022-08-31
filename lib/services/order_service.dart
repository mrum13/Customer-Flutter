import 'dart:convert';

import 'package:ats_customer/models/add_company_model.dart';
import 'package:ats_customer/models/contract_model.dart';
import 'package:ats_customer/models/order_model.dart';
import 'package:ats_customer/models/volume_model.dart';
import 'package:ats_customer/shared/shared_prefrences.dart';
import 'package:http/http.dart' as http;

class OrderServices {
  String baseUrl = "http://103.142.111.167:10002/api";
  String token = SharedPreference.loginUser.getString("token");

  Future<List<ContractData>> getContract({required String id_customer}) async {
    var url = '$baseUrl/customerpurchaseorder/listamp?id_customer=$id_customer';
    var header = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var response = await http.get(Uri.parse(url), headers: header);

    var data = jsonDecode(response.body);
    print("Status Get Contract Data=${data['success']}");

    try {
      if (data['success'] == true) {
        List allContract = json.decode(response.body)['data'];
        List<ContractData> allNameContract = [];

        for (var item in allContract) {
          allNameContract.add(ContractData.fromJson(item));
        }
        return allNameContract;
      } else {
        throw data['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<VolumeData>> getVolumeData() async {
    var url = '$baseUrl/setting/tonnage';
    var header = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var response = await http.get(Uri.parse(url), headers: header);

    var data = jsonDecode(response.body);
    print("Status Get Volume Data=${data['success']}");

    try {
      if (data['success'] == true) {
        List allVolume = json.decode(response.body)['data'];
        List<VolumeData> allNameVolume = [];

        for (var item in allVolume) {
          allNameVolume.add(VolumeData.fromJson(item));
        }
        return allNameVolume;
      } else {
        throw data['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<String> postOrder({
    required String idContract,
    required String idCustomer,
    required String volume,
    required String date,
    required String time,
  }) async {
    var url = '$baseUrl/customerpurchaseorder';
    var header = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var body = {
      'id_contract': idContract,
      'id_customer': idCustomer,
      'volume': volume,
      'unload_date': date,
      'unload_time': time,
    };

    var response = await http.post(
      Uri.parse(url),
      headers: header,
      body: body,
    );

    var data = jsonDecode(response.body);
    print("Status Post Order =${data['success']}");

    try {
      if (data['success'] == true) {
        return "Berhasil order";
      } else {
        throw data['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
