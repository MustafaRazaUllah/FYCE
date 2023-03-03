import 'package:biticonapp/App/Auth/View/Forgot%20Phone/forgot_new_password.dart';
import 'package:biticonapp/App/Auth/View/Forgot%20Phone/phone_varification.dart';
import 'package:biticonapp/App/Auth/View/forget_view.dart';
import 'package:biticonapp/App/Auth/View/phone_otp_screen_view.dart';
import 'package:biticonapp/App/Auth/View/sign_in_view.dart';
import 'package:biticonapp/App/Auth/View/sign_up_view.dart';
import 'package:biticonapp/App/Auth/ViewModel/forget_view_model.dart';
import 'package:biticonapp/App/Auth/ViewModel/login_viewmodel.dart';
import 'package:biticonapp/App/Auth/ViewModel/sign_up_view_model.dart';
import 'package:biticonapp/App/Buy/View/buy_success_view.dart';
import 'package:biticonapp/App/Convert/View/convert_view.dart';
import 'package:biticonapp/App/Home/Viewmodel/home_viewmodel.dart';
import 'package:biticonapp/App/OnBoarding/View%20Model/onboarding_view_model.dart';
import 'package:biticonapp/App/OnBoarding/View/onboarding_view.dart';
import 'package:biticonapp/App/RecoveryPharse/View/phrase_input_screen.dart';
import 'package:biticonapp/App/Splash/View/splash_view.dart';
import 'package:biticonapp/App/Verified/View/varification_pending.dart';
import 'package:biticonapp/App/Wallet/View%20Model/wallet_viewmodel.dart';
import 'package:get/get.dart';
import '../App/Auth/View/add_pin_view.dart';
import '../App/Auth/View/email_otp_screen_view.dart';
import '../App/Auth/View/face_id_view.dart';
import '../App/Auth/View/option_view.dart';
import '../App/Auth/View/repeat_pin_view.dart';
import '../App/Buy/View/buy_crypto_view.dart';
import '../App/Buy/View/buy_preview.dart';
import '../App/Drawer/View/account_type_view.dart';
import '../App/Drawer/View/native_currency_view.dart';
import '../App/Home/View/coin_tile_detail_view.dart';
import '../App/RecoveryPharse/View/recovery_term_condition.dart';
import '../App/RecoveryPharse/View/recovery_wallet_key_view.dart';
import '../App/RootPage/View/root_view.dart';
import '../App/RootPage/ViewModel/root_view_model.dart';
import '../App/SellAndWithdraw/View/pending_withdraw_view.dart';
import '../App/SellAndWithdraw/View/sell_view.dart';
import '../App/SellAndWithdraw/View/withdraw_preview.dart';
import '../App/Send/View/qr_scranner.dart';
import '../App/Send/View/send_preview.dart';
import '../App/Send/View/send_sucess_view.dart';
import '../App/Send/View/send_view.dart';
import '../App/Splash/ViewModel/splash_view_model.dart';
import '../App/Verified/View/get_verified_id_upload_screen.dart';
import '../App/Verified/View/get_verified_screen.dart';
import '../App/Wallet/View/transaction_detail_view.dart';
import '../App/Wallet/View/wallet_detail_view.dart';
import '../Common/processing_screen.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.splashView,
      transition: Transition.rightToLeft,
      page: () => SplashView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<SplashViewModel>(
          () => SplashViewModel(),
        );
      }),
    ),
    GetPage(
      name: AppRoutes.onboard,
      transition: Transition.rightToLeft,
      page: () => OnBoardingView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<OnBoardingViewModel>(
          () => OnBoardingViewModel(),
        );
      }),
    ),
    GetPage(
      name: AppRoutes.optionView,
      transition: Transition.rightToLeft,
      page: () => OptionView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<SignUpViewModel>(
          () => SignUpViewModel(),
        );
        Get.lazyPut<LoginViewModel>(
          () => LoginViewModel(),
        );
      }),
    ),
    GetPage(
      name: AppRoutes.signInView,
      transition: Transition.rightToLeft,
      page: () => SignInView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<LoginViewModel>(
          () => LoginViewModel(),
        );
      }),
    ),
    GetPage(
      name: AppRoutes.signUpView,
      transition: Transition.rightToLeft,
      page: () => SignUpView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<SignUpViewModel>(
          () => SignUpViewModel(),
        );
        Get.lazyPut<LoginViewModel>(
          () => LoginViewModel(),
        );
      }),
    ),
    GetPage(
      name: AppRoutes.phoneOtpScreenView,
      transition: Transition.rightToLeft,
      page: () => PhoneOtpScreenView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<SignUpViewModel>(
          () => SignUpViewModel(),
        );
      }),
    ),
    GetPage(
      name: AppRoutes.emailOtpScreenView,
      transition: Transition.rightToLeft,
      page: () => EmailOtpScreenView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<SignUpViewModel>(
          () => SignUpViewModel(),
        );
      }),
    ),
    GetPage(
      name: AppRoutes.forgetView,
      transition: Transition.rightToLeft,
      page: () => ForgetScreenView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<ForgetViewModel>(
          () => ForgetViewModel(),
        );
      }),
    ),
    GetPage(
      name: AppRoutes.forgotphoneverification,
      transition: Transition.rightToLeft,
      page: () => ForgotPhoneVerification(),
      binding: BindingsBuilder(() {
        Get.lazyPut<ForgetViewModel>(
          () => ForgetViewModel(),
        );
      }),
    ),
    GetPage(
      name: AppRoutes.forgotnewpassword,
      transition: Transition.rightToLeft,
      page: () => ForgotNewPassword(),
      binding: BindingsBuilder(() {
        Get.lazyPut<ForgetViewModel>(
          () => ForgetViewModel(),
        );
      }),
    ),
    GetPage(
      name: AppRoutes.navbarView,
      transition: Transition.rightToLeft,
      page: () => NavbarView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<RootViewModel>(
          () => RootViewModel(),
        );
        Get.lazyPut<HomeViewModel>(
          () => HomeViewModel(),
        );
        Get.lazyPut<WalletViewModel>(
          () => WalletViewModel(),
        );
      }),
    ),
    GetPage(
      name: AppRoutes.buyCrypto,
      transition: Transition.rightToLeft,
      page: () => const BuyCryptoView(),
    ),
    GetPage(
      name: AppRoutes.buyPreview,
      transition: Transition.rightToLeft,
      page: () => const BuyPreview(),
    ),
    GetPage(
      name: AppRoutes.processingScreen,
      transition: Transition.rightToLeft,
      page: () => ProcessingScreen(),
    ),
    GetPage(
      name: AppRoutes.buySuccessView,
      transition: Transition.rightToLeft,
      page: () => BuySuccessView(),
    ),
    GetPage(
      name: AppRoutes.accountTypeView,
      transition: Transition.rightToLeft,
      page: () => AccountTypeView(),
    ),
    GetPage(
      name: AppRoutes.getVerifiedView,
      transition: Transition.rightToLeft,
      page: () => GetVerifiedView(),
    ),
    GetPage(
      name: AppRoutes.getVerifiedIdUploadView,
      transition: Transition.rightToLeft,
      page: () => GetVerifiedIdUploadView(),
    ),
    GetPage(
      name: AppRoutes.getVarificationPending,
      transition: Transition.rightToLeft,
      page: () => VarificationPending(),
    ),
    GetPage(
      name: AppRoutes.recoveryWalletKeyView,
      transition: Transition.rightToLeft,
      page: () => RecoveryWalletKeyView(),
    ),
    GetPage(
      name: AppRoutes.recoveryTermAndCondition,
      transition: Transition.rightToLeft,
      page: () => RecoveryTermAndCondition(),
    ),
    GetPage(
      name: AppRoutes.phraseInputScreen,
      transition: Transition.rightToLeft,
      page: () => PhraseInputScreen(),
    ),
    GetPage(
      name: AppRoutes.nativeCurrencyScreen,
      transition: Transition.rightToLeft,
      page: () => NativeCurrencyScreen(),
    ),
    GetPage(
      name: AppRoutes.coinDetailView,
      transition: Transition.rightToLeft,
      page: () => CoinDetailView(),
    ),
    GetPage(
      name: AppRoutes.walletDetailView,
      transition: Transition.rightToLeft,
      page: () => WalletDetailView(),
    ),
    GetPage(
      name: AppRoutes.transactionDetailView,
      transition: Transition.rightToLeft,
      page: () => TransactionDetailView(),
    ),
    GetPage(
      name: AppRoutes.sendView,
      transition: Transition.rightToLeft,
      page: () => const SendView(),
    ),
    GetPage(
      name: AppRoutes.sendPreview,
      transition: Transition.rightToLeft,
      page: () => const SendPreview(),
    ),
    GetPage(
      name: AppRoutes.sendSucessView,
      transition: Transition.rightToLeft,
      page: () => const SendSucessView(),
    ),
    GetPage(
      name: AppRoutes.sellView,
      transition: Transition.rightToLeft,
      page: () => const SellView(),
    ),
    GetPage(
      name: AppRoutes.withDrawPreview,
      transition: Transition.rightToLeft,
      page: () => const WithDrawPreview(),
    ),
    GetPage(
      name: AppRoutes.pendingWithDrawView,
      transition: Transition.rightToLeft,
      page: () => const PendingWithDrawView(),
    ),
    GetPage(
      name: AppRoutes.convertView,
      transition: Transition.rightToLeft,
      page: () => const ConvertView(),
    ),
    GetPage(
      name: AppRoutes.addPinView,
      transition: Transition.rightToLeft,
      page: () => AddPinView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<SignUpViewModel>(
          () => SignUpViewModel(),
        );
      }),
    ),
    GetPage(
      name: AppRoutes.repeatPinView,
      transition: Transition.rightToLeft,
      page: () => RepeatPinView(),
    ),
    GetPage(
      name: AppRoutes.faceIdView,
      transition: Transition.rightToLeft,
      page: () => FaceIdView(),
    ),
    GetPage(
      name: AppRoutes.qRScanner,
      transition: Transition.rightToLeft,
      page: () => const QRScanner(),
    ),
  ];
}
