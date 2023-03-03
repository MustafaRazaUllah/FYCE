import 'package:biticonapp/App/Wallet/Model/wellat_detail_model.dart';
import 'package:biticonapp/App/Wallet/Model/wellat_model.dart';
import 'package:biticonapp/Common/Network/api_client.dart';
import 'package:biticonapp/Common/Network/tost.dart';
import 'package:get/get.dart';

class WalletViewModel extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getWalletList();
  }

  RxList<WellatsModel> wellatsList = <WellatsModel>[].obs;
  Rx<WellatDetailModel> wellatDetail = WellatDetailModel.fromEmpty().obs;

  void getWalletList() async {
    wellatsList.value = WellatsModel.jsonToWellatList(walletsListData);
    wellatsList.refresh();
  }

  void getWallet(String walletURL) async {
    print("onSendEmailOTP");
    wellatDetail.value = await WellatDetailModel.fromEmpty();
    wellatDetail.refresh();
    var response = await API().GetData(walletURL);
    if (response.data["success"] == true &&
        response.data["statusCode"] == 200) {
      print("wellatDetail " + response.data["data"].toString());
      wellatDetail.value = WellatDetailModel.fromJson(response.data["data"]);
      print("wellatDetail " + wellatDetail.value.address.toString());
      print("wellatDetail " + wellatDetail.value.balance.toString());
      // Toast().success(massage: response.data["message"]);
    }
  }

  List walletsListData = [
    {
      "title": "Bitcoin",
      "title2": "0.0643 BTC",
      "risevalue": "+12.322%",
      "icon": "assets/images/Bitcoin.png",
    },
    {
      "title": "Ethereum",
      "title2": "0.09363 ETH",
      "risevalue": "-9.393%",
      "icon": "assets/images/Ethereum.png",
    },
    {
      "title": "Matic",
      "title2": "0.02356 BCH",
      "risevalue": "+12.352%",
      "icon": "assets/images/BitcoinCash.png",
    },
    {
      "title": "Litecoin",
      "title2": "0.09642 LTC",
      "risevalue": "-12.232%",
      "icon": "assets/images/Litecoin.png",
    }
  ].obs;
}
