// ignore_for_file: library_prefixes

import 'package:biticonapp/Common/Network/tost.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart' as DIO;
import 'api_urls.dart';
import 'cache_handler.dart';

class API {
  Future GetData(String apiurl,
      {String? completeURL, String? accesstoken}) async {
    ////°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°/////
    ///todo: API Token
    var token = accesstoken ?? await DatabaseHandler().getToken();
    print("Token ==>> " + token.toString());
    print("URL ==>> " + ApiManager.BASE_URL + apiurl);
    ////°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°/////

    //////todo: API Call
    String url = completeURL ?? ApiManager.BASE_URL + apiurl;
    try {
      var dio = DIO.Dio();
      var response = await dio
          .get(
        url,
        options: DIO.Options(headers: {
          "Accept": 'application/json',
          'Content-Type': 'application/json',
          "Authorization": "Bearer ${token.toString()}",
        }),
      )
          .whenComplete(() {
        debugPrint("Getting Process is Complete:");
      }).catchError((onError) {
        debugPrint("GET Error: ${onError.toString()}");
      });
      return response;
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response!.data);
        Toast().error(massage: e.response!.data["message"]);
      }
      return;
    }
  }

  Future Delete(String apiurl) async {
    ////°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°/////
    ///todo: API Token
    var token = await DatabaseHandler().getToken();
    print("Token ==>> " + token.toString());
    print("URL ==>> " + ApiManager.BASE_URL + apiurl);

    ////°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°/////
    //////todo: API Call
    try {
      var dio = DIO.Dio();
      var response = await dio
          .delete(
        ApiManager.BASE_URL + apiurl,
        options: DIO.Options(headers: {
          "Accept": 'application/json',
          'Content-Type': 'application/json',
          "Authorization": "Bearer ${token.toString()}",
        }),
      )
          .whenComplete(() {
        debugPrint("Getting Process is Complete:");
      }).catchError((onError) {
        debugPrint("GET Error: ${onError.toString()}");
      });

      return response;
    } catch (e) {
      print(['POST API exception get', e.toString()]);
    }
  }

  Future post(String apiurl, var data, {String? accesstoken}) async {
    ////°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°/////
    ///todo: API Token
    var token = accesstoken ?? await DatabaseHandler().getToken();
    print("Token ==>> " + token.toString());
    print("URL ==>> " + ApiManager.BASE_URL + apiurl);
    print("Data ==>> " + data.toString());

    ////°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°/////
    //////todo: API Call
    var dio = DIO.Dio();
    try {
      var response = await dio.post(
        ApiManager.BASE_URL + apiurl,
        data: data,
        // data: {},
        options: DIO.Options(headers: {
          "Accept": 'application/json',
          'Content-Type': 'application/json',
          "Authorization": "Bearer ${token.toString()}",
        }),
        onSendProgress: (int sent, int total) {
          debugPrint("total ${total.toString()} " "   sent ${sent.toString()}");
        },
      );
      return response;
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response!.data);
        Toast().error(massage: e.response!.data["message"]);
      }
      return;
    }
  }

  Future patch(String apiurl, var data) async {
    ////°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°/////
    ///todo: API Token
    var token = await DatabaseHandler().getToken();
    print("Token ==1>> " + token.toString());
    print("URL ==1>> " + ApiManager.BASE_URL + apiurl);
    print("Data ==1>> " + data.toString());

    ////°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°/////
    //////todo: API Call

    try {
      var dio = DIO.Dio();

      var response = await dio.patch(
        ApiManager.BASE_URL + apiurl,
        data: data,
        options: DIO.Options(headers: {
          "Accept": 'application/json',
          'Content-Type': 'application/json',
          "Authorization": "Bearer ${token.toString()}",
        }),
        onSendProgress: (int sent, int total) {
          debugPrint("total ${total.toString()} " "   sent ${sent.toString()}");
        },
      ).whenComplete(() {
        debugPrint("POST Complete:");
      }).catchError((onError) {
        // Toast().error(massage: "$apiurl\nSomething is wrong");
        debugPrint(
            "POST Error: $apiurl\n${onError.toString()}\n**************************>>>>");
      });
      return response;
    } catch (e) {
      print(['POST API exception get', e.toString()]);
    }
  }

  // SizedBox noInternet() {
  //   return SizedBox(
  //     width: SizeConfig.screenWidth * 0.8,
  //     child: Image.asset(
  //       "assets/icons/noInternet.png",
  //       height: SizeConfig.screenWidth * 0.4,
  //     ),
  //   );
  // }
}
