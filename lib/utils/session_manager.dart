// import 'package:shared_preferences/shared_preferences.dart';

// class SessionManager{

//   static String isLogin = "";
//   static String auth_email = "auth_email";
//   String? fcm_Token;
//   String? user_Name;
//   static String default_Address = "default_Address";
//   static String access_token = "access_token";
//   static String user_ID = "user_id";
// ¯¯

//   static String parent_Product_Id = ""; // for similar product parent item id


//   //set data into shared preferences like this
//   Future<void> setAuthEmail(authEmail) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setString(auth_email, authEmail);
//   }

//   //get value from shared preferences
//   Future<String?> getAuthEmail() async {
//     final SharedPreferences pref = await SharedPreferences.getInstance();
//     return pref.getString(auth_email.toString())??null;
//   }

//   // AccessToken
//   Future<void> setAccessToken(accessToken) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setString(access_token, accessToken);
//   }

//   Future<String?> getAccessToken() async {
//     final SharedPreferences pref = await SharedPreferences.getInstance();
//     return pref.getString(access_token.toString())??null;
//   }

//   // Fcm Token
//   // Future<String?> setFCMToken(fcmToken) async{
//   //   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   //   prefs.setString(fcm_Token.toString(), fcmToken);
//   // }
//   //
//   // Future<String?> getFCMToken() async{
//   //   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   //   return prefs.getString(fcm_Token.toString())?? null;
//   // }

//   // Fcm Token
//   Future<void> setDefaultAddress(DefaultAddress) async{
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString(default_Address.toString(), DefaultAddress);
//   }

//   Future<String?> getDefaultAddress() async{
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     return await prefs.getString(default_Address.toString())?? null;
//   }

//   // ignore: body_might_complete_normally_nullable
//   Future<String?> setUserName(userName) async{
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString(user_Name.toString(), userName);
//   }

//   Future<String?> getUserName() async{
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     return await prefs.getString(user_Name.toString())?? null;
//   }

//   // UserId
//   Future<void> setUserID(userId) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setString(user_ID, userId);
//   }

//   Future<String?> getUserId() async {
//     final SharedPreferences pref = await SharedPreferences.getInstance();
//     return pref.getString(user_ID.toString())??null;
//   }

//   // Login as bool
//   Future<void> setIsAuthLogin(value) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setBool(isLogin, value);
//   }

//   Future<bool?> getIsAuthLogin() async {
//     final SharedPreferences pref = await SharedPreferences.getInstance();
//     return pref.getBool(isLogin.toString());
//   }

//   Future<void> logOut() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.clear();
//   }

//   // For Similar product

//   // set
//   Future<void> setSimilarProductParentItemID(parentProductId) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setString(parent_Product_Id, parentProductId);
//   }

//   // get
//   Future<String?> getSimilarProductParentItemID() async {
//     final SharedPreferences pref = await SharedPreferences.getInstance();
//     return pref.getString(parent_Product_Id);
//   }

// }