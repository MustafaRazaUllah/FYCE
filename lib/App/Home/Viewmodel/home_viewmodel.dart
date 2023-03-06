import 'dart:async';
import 'dart:ffi';
import 'dart:math';
import 'package:biticonapp/App/Home/Model/home_model.dart';
import 'package:biticonapp/Common/Network/api_urls.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart';

class HomeViewModel extends GetxController {
  // Rx<StreamSocket> streamSocket = StreamSocket();
  Rx<StreamSocket> streamSocket = StreamSocket().obs;

  RxList<CoinModel> coinDataList = <CoinModel>[].obs;

  RxList<double> counterList = <double>[].obs;

  RxList<double> xBT = <double>[1].obs;
  // RxList<double> xBTMaxMin = <double>[].obs;
  RxDouble xBTGraphValue = 1.0.obs;
  // RxBool isRiseXBT = false.obs;

  RxList<double> uSD = <double>[1].obs;
  RxDouble uSDGraphValue = 1.0.obs;
  // RxBool isRiseUSD = false.obs;

  RxList<double> iCP = <double>[1].obs;
  RxDouble iCPGraphValue = 1.0.obs;
  // RxBool isRiseICP = false.obs;

  RxList<double> aDA = <double>[1].obs;
  RxDouble aDAGraphValue = 1.0.obs;
  // RxBool isRiseADA = false.obs;

  RxList<double> mATIC = <double>[1].obs;
  RxDouble mATICGraphValue = 1.0.obs;
  // RxBool isRiseMATIC = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    ioSocket();
    print("oo0o0o0>> <<<");

    var rng = new Random();
    for (var i = 0; i < 30; i++) {
      print("oo0o0o0>>" + rng.nextInt(100).toDouble().toString());
      counterList.add(rng.nextInt(100).toDouble());
    }
    // counterList.value.add(double.parse(i.toString()));
    // counterList.refresh();
  }

  void ioSocket() {
    print("ioSocket");
    IO.Socket socket = IO.io(
      ApiManager.SOCKET_URL_HOME,
      OptionBuilder().setTransports(['websocket']).build(),
    );

    socket.onConnect((_) {
      print('connect');
    });

    socket.on('XBT/USD', (data) {
      var coinData = CoinModel.fromJson(data);
      xBT.add(
        double.parse(coinData.lotVolume),
        //   FlSpot(
        //   xBTGraphValue.value = xBTGraphValue.value + 5,
        //   double.parse(coinData.lotVolume),
        // )
      );
      // xBTMaxMin.add(double.parse(coinData.lotVolume));
      // if ((xBTMaxMin.isNotEmpty) &&
      //     (xBTMaxMin[xBTMaxMin.length - 2] >
      //         double.parse(coinData.lotVolume))) {
      //   isRiseXBT.value = false;
      // } else {
      //   isRiseXBT.value = true;
      // }
      if (coinDataList.isNotEmpty) {
        for (int i = 0; i < coinDataList.length; i++) {
          int index = coinDataList
              .indexWhere((element) => element.ticker == coinData.ticker);
          // print("object $index");
          if (index == -1) {
            coinDataList.add(coinData);
          } else {
            coinDataList[index] = coinData;
          }
        }
      } else {
        coinDataList.add(coinData);
      }
    });
    socket.on('USD/USD', (data) {
      var coinData = CoinModel.fromJson(data);
      uSD.add(
        double.parse(coinData.lotVolume),
        //   FlSpot(
        //   uSDGraphValue.value = uSDGraphValue.value + 5,
        //   double.parse(coinData.lotVolume),
        // )
      );
      // uSDMaxMin.add(double.parse(coinData.lotVolume));
      // if ((uSDMaxMin.isNotEmpty) &&
      //     (uSDMaxMin[uSDMaxMin.length - 2] >
      //         double.parse(coinData.lotVolume))) {
      //   isRiseUSD.value = false;
      //   print(isRiseUSD.value);
      // } else {
      //   isRiseUSD.value = true;
      //   print(isRiseUSD.value);
      // }
      if (coinDataList.isNotEmpty) {
        for (int i = 0; i < coinDataList.length; i++) {
          int index = coinDataList
              .indexWhere((element) => element.ticker == coinData.ticker);
          if (index == -1) {
            coinDataList.add(coinData);
          } else {
            coinDataList[index] = coinData;
          }
          //
        }
      } else {
        coinDataList.add(coinData);
      }
    });

    socket.on('ICP/USD', (data) {
      var coinData = CoinModel.fromJson(data);
      iCP.add(
        double.parse(coinData.lotVolume),
        //   FlSpot(
        //   iCPGraphValue.value = iCPGraphValue.value + 5,

        //  double.parse(coinData.lotVolume),
        // )
      );
      // iCPMaxMin.add(double.parse(coinData.lotVolume));
      // if ((iCPMaxMin.isNotEmpty) &&
      //     (iCPMaxMin[iCPMaxMin.length - 2] >
      //         double.parse(coinData.lotVolume))) {
      //   isRiseICP.value = false;
      //   print(isRiseICP.value);
      // } else {
      //   isRiseICP.value = true;
      //   print(isRiseICP.value);
      // }
      if (coinDataList.isNotEmpty) {
        for (int i = 0; i < coinDataList.length; i++) {
          int index = coinDataList
              .indexWhere((element) => element.ticker == coinData.ticker);
          if (index == -1) {
            coinDataList.add(coinData);
          } else {
            coinDataList[index] = coinData;
          }
          //
        }
      } else {
        coinDataList.add(coinData);
      }
    });
    socket.on('MATIC/USD', (data) {
      var coinData = CoinModel.fromJson(data);
      mATIC.add(
        double.parse(coinData.lotVolume),
        //   FlSpot(
        //   mATICGraphValue.value = mATICGraphValue.value + 5,
        //   double.parse(coinData.lotVolume),
        // )
      );
      // mATICMaxMin.add(double.parse(coinData.lotVolume));
      // if ((mATICMaxMin.isNotEmpty) &&
      //     (mATICMaxMin[mATICMaxMin.length - 2] >
      //         double.parse(coinData.lotVolume))) {
      //   isRiseMATIC.value = false;
      //   print(isRiseMATIC.value);
      // } else {
      //   isRiseMATIC.value = true;
      //   print(isRiseMATIC.value);
      // }
      if (coinDataList.isNotEmpty) {
        for (int i = 0; i < coinDataList.length; i++) {
          int index = coinDataList
              .indexWhere((element) => element.ticker == coinData.ticker);
          if (index == -1) {
            coinDataList.add(coinData);
          } else {
            coinDataList[index] = coinData;
          }
          //
        }
      } else {
        coinDataList.add(coinData);
      }
    });
    socket.on('ADA/USD', (data) {
      var coinData = CoinModel.fromJson(data);
      aDA.add(
        double.parse(coinData.lotVolume),
        //   FlSpot(
        //   aDAGraphValue.value = aDAGraphValue.value + 5,
        //   double.parse(coinData.lotVolume),
        // )
      );
      // aDAMaxMin.add(double.parse(coinData.lotVolume));
      // if ((aDAMaxMin.isNotEmpty) &&
      //     (aDAMaxMin[aDAMaxMin.length - 2] >
      //         double.parse(coinData.lotVolume))) {
      //   isRiseADA.value = false;
      //   print(isRiseADA.value);
      // } else {
      //   isRiseADA.value = true;
      //   print(isRiseADA.value);
      // }
      if (coinDataList.isNotEmpty) {
        for (int i = 0; i < coinDataList.length; i++) {
          int index = coinDataList
              .indexWhere((element) => element.ticker == coinData.ticker);
          if (index == -1) {
            coinDataList.add(coinData);
          } else {
            coinDataList[index] = coinData;
          }
          //
        }
      } else {
        coinDataList.add(coinData);
      }
    });

    socket.onDisconnect((_) => print('disconnect'));
  }

  void ioSocketDispose() {
    streamSocket.value.dispose();
  }
}

class StreamSocket {
  final _socketResponse = StreamController<String>();

  void Function(String) get addResponse => _socketResponse.sink.add;

  Stream<String> get getResponse => _socketResponse.stream;

  void dispose() {
    _socketResponse.close();
  }
}
