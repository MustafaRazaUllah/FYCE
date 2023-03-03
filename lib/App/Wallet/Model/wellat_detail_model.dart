// To parse this JSON data, do
//
//     final wellatDetailModel = wellatDetailModelFromJson(jsonString);

class WellatDetailModel {
  WellatDetailModel({
    required this.address,
    // required this.totalReceived,
    // required this.totalSent,
    required this.balance,
    // required this.unconfirmedBalance,
    // required this.finalBalance,
    // required this.nTx,
    // required this.unconfirmedNTx,
    // required this.finalNTx,
  });

  String address;
  // int totalReceived;
  // int totalSent;
  dynamic balance;
  // int unconfirmedBalance;
  // int finalBalance;
  // int nTx;
  // int unconfirmedNTx;
  // int finalNTx;

  factory WellatDetailModel.fromJson(Map<String, dynamic> json) =>
      WellatDetailModel(
        address: json["address"] ?? '',
        // totalReceived: json["total_received"] ?? 0,
        // totalSent: json["total_sent"] ?? 0,
        balance: json["balance"] ?? "",
        // unconfirmedBalance: json["unconfirmed_balance"] ?? 0,
        // finalBalance: json["final_balance"] ?? 0,
        // nTx: json["n_tx"] ?? 0,
        // unconfirmedNTx: json["unconfirmed_n_tx"] ?? 0,
        // finalNTx: json["final_n_tx"] ?? 0,
      );

  factory WellatDetailModel.fromEmpty() {
    return WellatDetailModel(
      address: '',
      // totalReceived: 0,
      // totalSent: 0,
      balance: "",
      // unconfirmedBalance: 0,
      // finalBalance: 0,
      // nTx: 0,
      // unconfirmedNTx: 0,
      // finalNTx: 0,
    );
  }
}
