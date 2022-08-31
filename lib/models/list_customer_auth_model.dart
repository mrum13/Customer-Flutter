import 'package:ats_customer/models/company_auth_model.dart';
import 'package:flutter/cupertino.dart';

class ListCustomerAuthModel {
  late bool status;
  late List<CompanyAuthModel> companyAuthModel = [];

  ListCustomerAuthModel({required this.status, required this.companyAuthModel});

  ListCustomerAuthModel.fromJson(Map<String, dynamic> json) {
    status = json['success'];
    for (var data in json['data']) {
      companyAuthModel.add(CompanyAuthModel.fromJson(data));
    }
  }

  Map<String, dynamic> toJson() {
    return {'success': status, 'data': companyAuthModel};
  }
}
