import '../../constants/middleware.dart';
import '../../constants/shared_preference_const.dart';
import '../../constants/shared_preference_helper.dart';
import 'api_helper.dart';

class JalelaApis {
  APIHelper apiHandler;
  MiddleWare middleWare = MiddleWare();

  JalelaApis({required this.apiHandler});

  Future<String> get userId async =>
      await PreferenceHelper.getString(PreferenceConst.userId);


  // Future<LoginModel> callLogin(
  //     bool isMobile,
  //     BuildContext context, String email, String otp, String password) async {
  //   var map = {
  //     if(isMobile)
  //       PHONE_KEY: email,
  //     if(isMobile)
  //       PHONEOTP_KEY: otp,
  //     if(!isMobile)
  //       EMAILOTP_KEY:otp,
  //     if(!isMobile)
  //       EMAIL_KEY:email,
  //     PASSWORD_KEY: password,
  //   };
  //   var result = await apiHandler.requestRestApi(context, map,
  //       nameSpace: nameSpace + methodReqLogin );
  //   return compute(loginModelFromJson, result);
  // }


  // Future<LoginModel> forgotPassword(
  //
  //     BuildContext context, Map<String, dynamic> map) async {
  //
  //   var result = await apiHandler.requestRestApi(context, map,methodType: MethodType.POST,
  //       nameSpace: nameSpace + methodRequestForgotPassword );
  //   return compute(loginModelFromJson, result);
  // }
  //

  // Future<LoginModel> buyStakingPlan(BuildContext context, Map<String, dynamic> map) async {
  //   var result = await apiHandler.requestRestApi(context,map,methodType: MethodType.POST,
  //       nameSpace: nameSpace + methodReqAddStack );
  //   return compute(loginModelFromJson, result);
  // }


  // Future<RegisterModel> uploadProof(
  //     BuildContext context) async {
  //   var pannumber = await PreferenceHelper.getString(PreferenceConst.PanCardNumber);
  //   var result = await apiHandler.uploadImage(nameSpace + methodReqUploadProof+"?sizeFile=4&type=kyc&panCard="+pannumber );
  //   return compute(registerModelFromJson, result);
  // }

  // Future<UploadProofModel> uploadAttachment(
  //     BuildContext context,File file) async {
  //   var result = await apiHandler.uploadAttachment(nameSpace + methodReqUploadProof+"?sizeFile=1&type=attachment",file);
  //   return compute(uploadProofModelFromJson, result);
  // }

  // Future<LoginModel> requestOTP(
  //     BuildContext context, bool isPhone,String phoneNumber, String page) async {
  //   var map = {
  //     if(isPhone)
  //       PHONE_KEY: phoneNumber,
  //     if(!isPhone)
  //       EMAIL_KEY: phoneNumber,
  //     PAGE_KEY: page,
  //   };
  //
  //   var result = await apiHandler.requestRestApi(context, map,methodType: MethodType.POST,
  //       nameSpace: nameSpace + methodReqOtp);
  //   return compute(loginModelFromJson, result);
  // }

  // Future<CoinWalletModel> getCoinWalletList(
  //     BuildContext context ) async {
  //
  //   var result = await apiHandler.requestRestApi(context, {},methodType: MethodType.GET,
  //       nameSpace: nameSpace + methodGetCoinWalet);
  //   return compute(coinWalletModelFromJson, result);
  // }

  // Future<LoginModel> requestChangePwd(
  //     BuildContext context, String oldPwd,String newPwd) async {
  //   var map = {
  //     OLDPWD_KEY: oldPwd,
  //     NEWPWD_KEY: newPwd,
  //     CONFIRMPWD_KEY: newPwd
  //   };
  //
  //   var result = await apiHandler.requestRestApi(context, map,methodType: MethodType.POST,
  //       nameSpace: nameSpace + methodReqChangePwd);
  //   return compute(loginModelFromJson, result);
  // }

  // Future<RegisterModel> callRegister(BuildContext context, String userName,
  //     String email, String phone, String password, String confirm_password, String emailotp,String phnotp,String terms,String referralId) async {
  //   var map = {
  //     register_name: userName,
  //     register_email: email,
  //     register_phone: phone,
  //     register_password: password,
  //     register_confirmPassword: confirm_password,
  //     register_emailotp:emailotp,
  //     register_phoneOtp:phnotp,
  //     register_terms: terms,
  //     register_referralId:referralId,
  //
  //   };
  //   var result = await apiHandler.requestRestApi(context, map,
  //       nameSpace: nameSpace + methodSignup);
  //   return compute(registerModelFromJson, result);
  // }
}