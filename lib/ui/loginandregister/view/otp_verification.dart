import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lalela/constants/middleware.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import '../../../constants/route_const.dart';
import '../../../constants/string_constant.dart';

class OtpVerificationPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return OtpVerificationState();
  }
}
class OtpVerificationState extends State<OtpVerificationPage>{
  MiddleWare middleWare = MiddleWare();
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     resizeToAvoidBottomInset: false,
     appBar: AppBar(elevation: 0,backgroundColor: Colors.transparent,),
     body: Container(height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width,
     child: Column(children: [
       middleWare.putSizedBoxHeight(middleWare.margin10),
       getTitle(),
       middleWare.putSizedBoxHeight(20),
       getText(otpDescription),
       middleWare.putSizedBoxHeight(10),
       getMobileNumber("+91 9524670055"),
       middleWare.putSizedBoxHeight(50),
       getOtp(),
       middleWare.putSizedBoxHeight(40),
       getText(otpWaitingText),
       middleWare.putSizedBoxHeight(20),
       getOutlineButtons(),
       getVerifyBtn()
     ],),),
   );

  }
  Container getVerifyBtn() {
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
            Text(verifyOtpText,
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
          Navigator.pushNamed(context, RoutePaths.Register);
        },
      ),
    );
  }
  getOutlineButtons(){
    return Row(mainAxisAlignment: MainAxisAlignment.start ,children: [Container(margin: EdgeInsets.only(left: 20),child:OutlinedButton(
      child: Row(children: [Icon(Icons.sms_outlined),middleWare.putSizedBoxWidth(10),Text(sms)],),
      style: OutlinedButton.styleFrom(
        primary: middleWare.uiThemeColor,
        padding: EdgeInsets.all(14),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
          )
      ),
      onPressed: () {
        
      }
    )),
    Container(margin: EdgeInsets.only(left: 20),child:
      OutlinedButton(
          child: Row(children: [Icon(Icons.call),middleWare.putSizedBoxWidth(10),Text(call)],),
          style: OutlinedButton.styleFrom(
            primary: middleWare.uiThemeColor,
              padding: EdgeInsets.all(14),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
              )
          ),

          onPressed: () {

          }
      ))]);
  }
  getTitle(){
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: middleWare.margin20),
      child: Text(otpVerificationTitle,style:middleWare.customTextStyle(20, Colors.black, FontWeight.bold)),
    );
  }
  getText(String txt){
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: middleWare.margin20),
      child: Text(txt,style:middleWare.customTextStyle(14, Colors.black, FontWeight.normal)),
    );
  }
  getMobileNumber(txt){
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: middleWare.margin20),
      child: Text(txt,style:middleWare.customTextStyle(21, Colors.black, FontWeight.bold)),
    );
  }
  getOtp(){
    return Container(padding: EdgeInsets.all(5),child: OTPTextField(
      length: 6,
      width: MediaQuery.of(context).size.width,
      fieldWidth: 55,
      style: TextStyle(
          fontSize: 14
      ),
      textFieldAlignment: MainAxisAlignment.spaceEvenly,
      fieldStyle: FieldStyle.box,
      onCompleted: (pin) {
        print("Completed: " + pin);
      },
    ));

  }
}