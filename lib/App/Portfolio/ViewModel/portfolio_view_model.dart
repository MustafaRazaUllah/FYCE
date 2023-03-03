


import 'package:get/get.dart';

class PortfolioViewModel extends GetxController{
  Rx<int> index=0.obs;

  onchangeIndex(value){
    index.value=value;
  }
}