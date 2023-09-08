class ApiUrls {
  static const String domain = "https://v1.checkprojectstatus.com/2ufuel/";
  // static const String domain = "https://platform.charles.app/"; // Live server
  static const String baseUrl = "${domain}api/";

  //Sign In And Login Api
  static const String deliveryZipCodeVerify =
      "${baseUrl}delivery-zipcode/verify";
  static const String noFuel = "${baseUrl}no-fuel";
  static const String signup = "${baseUrl}signup";
  static const String signupVerify = "${baseUrl}signup/verify";
  static const String updatePromocode = "${baseUrl}update/promocode";
  static const String plans = "${baseUrl}plans";

  static const String states = "${baseUrl}states";
  static const String business = "${baseUrl}business";

  // login Api

  static const String signIn = "${baseUrl}signin";
  static const String signInVerify = "${baseUrl}signin/verify";

  // Vehicle Api

  static const String make = "${baseUrl}makes";
  static const String models = "${baseUrl}models?make_id=";
  static const String colors = "${baseUrl}colors";
  static const String vehicles = "${baseUrl}vehicles";

  // Order Api
  static const String orders = "${baseUrl}orders";
  static const String fuelType = "${baseUrl}fuel-types";

// Add Location

  static const String locations = "${baseUrl}locations";

// Profie Api 
  static const String profile = "${baseUrl}profile";

  //
}
