import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lalela/constants/middleware.dart';

import '../../../constants/route_const.dart';
import '../../../constants/string_constant.dart';
import '../../../utils/common_utils.dart';

class Register extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return RegisterState();
  }

}
class RegisterState extends State<Register>{
  MiddleWare middleWare = MiddleWare();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
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
    getText(signupDescription),
    middleWare.putSizedBoxHeight(40),
    getMobileController(),
      middleWare.putSizedBoxHeight(10),
      getEmailController(),
      getFirstNameController(),
      middleWare.putSizedBoxHeight(10),
      getAddBtn()
    ])));
  }
  getTitle(){
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: middleWare.margin20),
      child: Text(signupTitle,style:middleWare.customTextStyle(20, Colors.black, FontWeight.bold)),
    );
  }
  getText(String txt){
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: middleWare.margin20),
      child: Text(txt,style:middleWare.customTextStyle(14, Colors.black, FontWeight.normal)),
    );
  }
  Container getAddBtn() {
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
            Text(signupTitle,
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
          Navigator.pushNamed(context, RoutePaths.Home);
        },
      ),
    );
  }

  Container getEmailController() {
    return Container(
      padding: EdgeInsets.all(middleWare.minimumPadding),
      margin: EdgeInsets.only(
        top: middleWare.minimumPadding * 1.5,
        left: middleWare.minimumPadding * 4,
        right: middleWare.minimumPadding * 4,
      ),
      child: Opacity(
        opacity: 0.8,
        child: Padding(
          padding: EdgeInsets.only(
            top: middleWare.minimumPadding,
            bottom: middleWare.minimumPadding,
          ),
          child: TextFormField(
            style: middleWare.customTextStyle(
                14.00, middleWare.uiTextColor, FontWeight.bold),
            controller: emailController,
            decoration: InputDecoration(
              hintText: "Email",
              hintStyle: middleWare.customTextStyle(
                  14.00, middleWare.uiFordGrayColor, FontWeight.normal),
              border: OutlineInputBorder (
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: middleWare.uiLightTextColor),
              ),
            ),
            validator: ( value) {
              value = value ?? "";
              if (value.trim().isEmpty) {
                return "Please enter email";
              } else if (!emailRegEx.hasMatch(value.trim())) {
                return "Please enter valid email";
              }
              return null;
            },
          ),
        ),
      ),
    );

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
  Container getFirstNameController() {
    return Container(
      padding: EdgeInsets.all(middleWare.minimumPadding),
      margin: EdgeInsets.only(
        top: middleWare.minimumPadding * 1.5,
        left: middleWare.minimumPadding * 4,
        right: middleWare.minimumPadding * 4,
      ),
      child: Opacity(
        opacity: 0.8,
        child: Padding(
          padding: EdgeInsets.only(
            top: middleWare.minimumPadding,
            bottom: middleWare.minimumPadding,
          ),
          child: TextFormField(
            style: middleWare.customTextStyle(
                14.00, middleWare.uiTextColor, FontWeight.bold),
            controller: firstNameController,
            decoration: InputDecoration(
              hintText: "First Name",
              hintStyle: middleWare.customTextStyle(
                  14.00, middleWare.uiFordGrayColor, FontWeight.normal),
              border:  OutlineInputBorder (
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: middleWare.uiLightTextColor),
              ),
            ),
            validator: ( value) {
              value = value ?? "";
              if (value.trim().isEmpty) {
                return "Please enter your first name";
              } else if (value.length < 3) {
                return "First name must be of atleast 3 characters";
              }
              return null;
            },
          ),
        ),
      ),
    );
  }

}