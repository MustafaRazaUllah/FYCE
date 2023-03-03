// To parse this JSON data, do
//
//     final coinModel = coinModelFromJson(jsonString);

class WellatsModel {
  WellatsModel({
    required this.title,
    required this.title2,
    required this.risevalue,
    required this.icon,
  });

  String title;
  String title2;
  String risevalue;
  String icon;

  factory WellatsModel.fromJson(Map<String, dynamic> json) => WellatsModel(
        title: json["title"] ?? '',
        title2: json["title2"] ?? '',
        risevalue: json["risevalue"] ?? '',
        icon: json["icon"] ?? '',
      );

  static List<WellatsModel> jsonToWellatList(List<dynamic> emote) =>
      emote.map<WellatsModel>((item) => WellatsModel.fromJson(item)).toList();
}
