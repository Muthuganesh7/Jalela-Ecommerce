

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lalela/constants/string_constant.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../base_model.dart';
import '../../../constants/middleware.dart';
import '../../../constants/route_const.dart';

class MobileVerificationPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MobileVerificationPageState();
  }

}
class MobileVerificationPageState extends State<MobileVerificationPage> with SingleTickerProviderStateMixin {
  MiddleWare middleWare = MiddleWare();
  TextEditingController userNameController = TextEditingController();
  TextEditingController mobileOtpController = TextEditingController();
  TextEditingController emailOtpController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool passwordVisible = false;
  bool isMobile = false;

  @override
  void initState() {
    super.initState();
    try {
      Future.delayed(Duration.zero, () {

      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,children: [
      Container(alignment:Alignment.center,margin: EdgeInsets.only(right: middleWare.margin10),
        child: Image.asset('assets/images/app_logo.png',height: middleWare.margin150,width: middleWare.margin200,),),
        getMobileController(),
      getLoginBtn(),
      getTerms(),
      middleWare.putSizedBoxHeight(5),
      getTermsLink()
      ],),);
  }

  getTerms(){
    return Container(width: 220,margin: EdgeInsets.only(top: middleWare.margin100),alignment: Alignment.center ,child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [Container(
      child: Text(termsText,textAlign: TextAlign.center,style: middleWare.customTextStyle(14, Colors.black, FontWeight.normal)),
    )],),);

  }
  getTermsLink(){
    return Row(mainAxisAlignment: MainAxisAlignment.center,children: [
      InkWell(
        onTap: () => {launchUrl(Uri.parse('https://www.google.com'))},
        child: Text(
          termsTitle,
          style: middleWare.customLinkTextStyle(14,Colors.black,FontWeight.normal),
        ),
      ),
      middleWare.putSizedBoxWidth(10),
      InkWell(
        onTap: () => launchUrl(Uri.parse('https://www.google.com')),
        child: Text(
          privacyPolicy,
          style: middleWare.customLinkTextStyle(14,Colors.black,FontWeight.normal),
        ),
      )
    ],);

  }

  Container getMobileController() {
    return Container(
      margin: EdgeInsets.only(
        left: middleWare.minimumPadding * 4,
        right: middleWare.minimumPadding * 4,
      ),
      child: Opacity(
        opacity: 0.8,
        // child:
        // Padding(
        //   padding: EdgeInsets.only(
        //     top: middleWare.minimumPadding,
        //     bottom: middleWare.minimumPadding,
        //   ),
          child: TextFormField(
            style: middleWare.customTextStyle(
                14.00, middleWare.uiTextColor, FontWeight.bold),
            controller: phoneNumberController,
            keyboardType: TextInputType.number,
            validator: (value) {
              value = value ?? "";
              if (value
                  .trim()
                  .isEmpty) {
                return "Please enter mobile number";
              } else if (value
                  .trim()
                  .length != 10) {
                return "Please enter valid mobile number";
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: "Mobile number",
              // prefix: CountryCodePicker(
              //   onChanged: print,
              //   // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
              //   initialSelection: 'IN',
              //   favorite: ['+91','IN'],
              //   showFlag: false,
              //   // optional. Shows only country name and flag
              //   showCountryOnly: false,
              //   // optional. Shows only country name and flag when popup is closed.
              //   showOnlyCountryWhenClosed: false,
              //   // optional. aligns the flag and the Text left
              //   alignLeft: false,
              //
              // ),

              hintStyle: middleWare.customTextStyle(
                  14.00, middleWare.uiFordGrayColor, FontWeight.normal),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: middleWare.uiLightTextColor),
              ),
            ),
            /*onChanged: onSearchTextChanged,*/
          ),
        // ),
      ),
    );
  }
  Container getLoginBtn() {
    return Container(
      margin: EdgeInsets.only(
        top: middleWare.minimumPadding * 4,
        // bottom: middleWare.minimumPadding * 5,
        left: middleWare.minimumPadding * 4,
        right: middleWare.minimumPadding * 4,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: middleWare.uiThemeColor,
          foregroundColor: middleWare.uiThemeColor,
          padding: EdgeInsets.only(
            top: middleWare.minimumPadding * 3,
            bottom: middleWare.minimumPadding * 3,
            left: middleWare.minimumPadding *
                7,
            right: middleWare.minimumPadding * 7,
          ),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(continueText,
                style: middleWare.customTextStyle(
                    17.00, Colors.white, FontWeight.bold)),
            SizedBox(
              width: 8,
            ),
            // ViewState.BUSY == ViewState.BUSY
            //     ? Container(
            //   width: 25,
            //   height: 25,
            //   child: CircularProgressIndicator(
            //     valueColor:
            //     new AlwaysStoppedAnimation<Color>(Colors.white),
            //   ),
            // )
            //     : Container()
          ],
        ),
        onPressed: () async {
          Navigator.pushNamed(context, RoutePaths.OtpVerification);
        },
      ),
    );
  }

}