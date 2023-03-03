// To parse this JSON data, do
//
//     final userlogin = userloginFromJson(jsonString);

class Userlogin {
  Userlogin({
    required this.isEmailVerified,
    required this.isPhoneVerified,
    required this.isKeyProtected,
    required this.isActive,
    required this.isDeleted,
    required this.id,
    required this.fullName,
    required this.contact,
    required this.role,
    required this.token,
    required this.countryName,
    required this.countryCode,
    required this.email,
  });

  bool isEmailVerified;
  bool isPhoneVerified;
  bool isKeyProtected;
  bool isActive;
  bool isDeleted;
  String id;
  String fullName;
  String contact;
  String role;
  String token;
  String countryName;
  String countryCode;
  String email;

  factory Userlogin.fromJson(Map<String, dynamic> json) => Userlogin(
        isEmailVerified: json["isEmailVerified"],
        isPhoneVerified: json["isPhoneVerified"],
        isKeyProtected: json["isKeyProtected"],
        isActive: json["isActive"],
        isDeleted: json["isDeleted"],
        id: json["_id"],
        fullName: json["fullName"],
        contact: json["contact"],
        role: json["role"],
        token: json["token"],
        countryName: json["countryName"],
        countryCode: json["countryCode"],
        email: json["email"],
      );
}
