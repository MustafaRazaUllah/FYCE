// To parse this JSON data, do
//
//     final coinModel = coinModelFromJson(jsonString);

class CoinModel {
  CoinModel({
    required this.msgTime,
    required this.price,
    required this.lotVolume,
    required this.ticker,
  });

  String msgTime;
  String price;
  String lotVolume;
  String ticker;

  factory CoinModel.fromJson(Map<String, dynamic> json) => CoinModel(
        msgTime: json["msgTime"],
        price: json["message"][1]["price"] ?? "",
        lotVolume: json["message"][1]["lotVolume"] ?? "",
        ticker: json["message"][1]["ticker"] ?? "",
      );
}
