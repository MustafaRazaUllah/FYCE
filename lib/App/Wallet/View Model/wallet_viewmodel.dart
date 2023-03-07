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
      "currencyimage": "assets/wallet/BTC.png",
      "currencycolor": 0xffFFFFFF,
      "currencytext": 0xff121111,
      "title": "BTC",
      "currencyname": "Bitcoin",
      "title2": "0.0643 BTC",
      "risevalue": "+12.322%",
      "icon": "assets/images/Bitcoin.png",
    },
    {
      "currencyimage": "assets/wallet/ETH.png",
      "currencycolor": 0xff3B60F8,
      "currencytext": 0xFFffffff,
      "title": "ETH",
      "currencyname": "Ethereum",
      "title2": "0.09363 ETH",
      "risevalue": "-9.393%",
      "icon": "assets/images/Ethereum.png",
    },
    {
      "currencyimage": "assets/wallet/ADA.png",
      "currencycolor": 0xff0022a1,
      "currencytext": 0xFFffffff,
      "title": "ADA",
      "currencyname": "Cardano",
      "title2": "0.09642 ADA",
      "risevalue": "-12.232%",
      "icon": "assets/images/Litecoin.png",
    },
    {
      "currencyimage": "assets/wallet/MATIC.png",
      "currencycolor": 0xff652dd6,
      "currencytext": 0xFFffffff,
      "title": "MATIC",
      "currencyname": "MATIC",
      "title2": "0.02356 MATIC",
      "risevalue": "+12.352%",
      "icon": "assets/images/BitcoinCash.png",
    },
    {
      "currencyimage": "assets/wallet/USDC.png",
      "currencycolor": 0xff191919,
      "currencytext": 0xFFffffff,
      "title": "USDC",
      "currencyname": "USDC",
      "title2": "0.09642 USDC",
      "risevalue": "-12.232%",
      "icon": "assets/images/Litecoin.png",
    },
    {
      "currencyimage": "assets/wallet/ICP.png",
      "currencycolor": 0xff209ee1,
      "currencytext": 0xff121111,
      "title": "ICP",
      "currencyname": "Internet Computer",
      "title2": "0.09642 ICP",
      "risevalue": "-12.232%",
      "icon": "assets/images/Litecoin.png",
    }
  ].obs;
}
