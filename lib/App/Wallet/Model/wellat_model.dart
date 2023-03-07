// To parse this JSON data, do
//
//     final coinModel = coinModelFromJson(jsonString);

class WellatsModel {
  WellatsModel({
    required this.title,
    required this.currencyName,
    required this.currencyImage,
    required this.currencyColor,
    required this.currencyTextColor,
    required this.title2,
    required this.risevalue,
    required this.icon,
  });

  String title;
  int currencyColor;
  int currencyTextColor;
  String currencyName;
  String currencyImage;
  String title2;
  String risevalue;
  String icon;

  factory WellatsModel.fromJson(Map<String, dynamic> json) => WellatsModel(
        title: json["title"] ?? '',
        currencyColor: json["currencycolor"] ?? 0,
        currencyTextColor: json["currencytext"] ?? 0,
        currencyName: json["currencyname"] ?? '',
        currencyImage: json["currencyimage"] ?? '',
        title2: json["title2"] ?? '',
        risevalue: json["risevalue"] ?? '',
        icon: json["icon"] ?? '',
      );

  static List<WellatsModel> jsonToWellatList(List<dynamic> emote) =>
      emote.map<WellatsModel>((item) => WellatsModel.fromJson(item)).toList();
}
