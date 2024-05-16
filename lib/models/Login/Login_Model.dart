// على حسب الريسبونس الجاي من الباك

class LoginModel {
  late String message;
  // late LoginData data;
  late String token;

  LoginModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    // data = (json['data'] != null ? LoginData.fromJson(json['data']) : null)!;
    token = json['token'];
  }
}

// class LoginData {
//   int? id;
//   String? name;
//   String? email;
//   String? phone;
//   String? image;
//   int? point;
//   int? credit;
//   String? token;
//
// LoginData({
//   this.name,
//   this.credit,
//   this.email,
//   this.id,
//   this.image,
//   this.phone,
//   this.point,
//   this.token,
// });

// named constructor
//
// LoginData.fromJson
// (
// Map<String, dynamic> json) {
// id = json['id'];
// name = json['name'];
// credit = json['credit'];
// email = json['email'];
// image = json['image'];
// phone = json['phone'];
// point = json['point'];
// token = json['token'];
// }
// }
