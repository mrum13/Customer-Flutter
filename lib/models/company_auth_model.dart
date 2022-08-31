class CompanyAuthModel {
  late String id;
  late String name;

  CompanyAuthModel({required this.id, required this.name});

  CompanyAuthModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
