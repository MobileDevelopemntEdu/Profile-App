class UserModel {
  String? uid;
  String? name;
  String? uniName;
  String? email;
  String? phone;
  String? address;


  UserModel({required this.uid, required this.name, required this.email, this.phone, this.uniName, this.address});

  UserModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    name = json['name'];
    email = json['email'] ;
    phone = json['phone'] ?? '';
    address = json['address'] ?? '';
    uniName = json['uniName'] ?? '';
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'email': email ?? '' ,
      'phone': phone?? '',
      'address': address ?? '',
      'uniName': uniName ?? '',
    };
  }
}