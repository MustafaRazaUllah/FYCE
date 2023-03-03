// ignore_for_file: constant_identifier_names

class ApiManager {
// App Base URL
  static const BASE_URL = "http://34.245.124.151/api/";

  static const SOCKET_URL_HOME = "ws://34.245.124.151";

//Commen Module URL
  static const SIGNIN = "users/login";

  static const SIGNUP = "users/signup";

  static const FORGOT = "users/forgot-password";

  static const SEND_SMS_OTP = "users/send-verification-sms";

  static const SEND_EMAIL_OTP = "users/send-verification-email";

  static const PHONE_VARIFICATION = "users/verify-number";

  static const EMAIL_VARIFICATION = "users/verify-email";

  static const PROTECT_KEY = "users/add-login-code";

//WALLETS APIS

  static const BITCOIN_WALLET = "wallets/bitcoin/check-balance";

  static const ETHEREUM_WALLET = "wallets/ethereum/check-ethereum-balance";

  static const MATIC_WALLET = "wallets/matic/check-matic-balance";
}
