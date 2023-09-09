import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lalela/constants/middleware.dart';
import 'package:lalela/constants/route_const.dart';
import 'package:lalela/constants/string_constant.dart';

class ChooseDeliveryLocationPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ChooseDeliveryLocationState();
  }

}
class ChooseDeliveryLocationState extends State<ChooseDeliveryLocationPage>{
  MiddleWare middleWare = MiddleWare();
  TextEditingController searchTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(appBar: AppBar(automaticallyImplyLeading: false,title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
      Icon(Icons.arrow_back_ios),
      Text("Your Location",style: middleWare.customTextStyle(17, Colors.black, FontWeight.bold),),
      Container()
    ],),elevation: 0,backgroundColor: Colors.transparent,),
    body: Container(margin: EdgeInsets.only(top: 20),child: Column(children: [
      getSearchBar(),
      getGpsAlertText()
    ],),),);
  }
  getGpsAlertText(){
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, RoutePaths.SelectLocationOnMap);
      },
      child: Container(margin: EdgeInsets.only(top: 20),child: Row(children: [
      middleWare.putSizedBoxWidth(20),
      Icon(Icons.gps_fixed,color: Colors.black,),
      middleWare.putSizedBoxWidth(20),
      Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,children: [
        getTitleText(),
        middleWare.putSizedBoxHeight(5),
        getSubTitleText(),

      ],)
    ],),),);
  }
  getTitleText(){
    return Text(currentLocTitle,style: middleWare.customTextStyle(14, middleWare.uiThemeColor, FontWeight.bold),);
  }
  getSubTitleText(){
    return Text(usingGps,style: middleWare.customTextStyle(14, Colors.black, FontWeight.normal),);

  }
  Container getSearchBar() {
    return Container(
      margin: EdgeInsets.only(
        left: middleWare.minimumPadding * 4,
        right: middleWare.minimumPadding * 4,
      ),
      child: Opacity(
        opacity: 0.8,
        child: TextFormField(
          style: middleWare.customTextStyle(
              14.00, middleWare.uiTextColor, FontWeight.bold),
          controller: searchTextController,
          keyboardType: TextInputType.text,
          validator: (value) {
            value = value ?? "";
            if (value
                .trim()
                .isEmpty) {
              return "Search for your Location";
            } else if (value
                .trim()
                .length != 10) {
              return "Search for your Location";
            }
            return null;
          },
          decoration: InputDecoration(
            prefixIcon: Image.asset('assets/images/search_icon.png',width: 20,height: 20,),
            // prefix: Image.asset('assets/images/search_icon.png',width: 20,height: 20,),
              border: UnderlineInputBorder(
                  borderRadius:BorderRadius.circular(10.0),borderSide: BorderSide.none),
            hintText: "Search for your Location",
            hintStyle: middleWare.customTextStyle(
                14.00, middleWare.uiFordGrayColor, FontWeight.normal),
            // border: OutlineInputBorder(
            //   borderRadius: BorderRadius.all(Radius.circular(10.0)),
            //   borderSide: BorderSide(color: middleWare.uiThemeColor),
            // ),
            filled: true,
            fillColor: Colors.grey.shade200
          ),
          /*onChanged: onSearchTextChanged,*/
        ),
        // ),
      ),
    );
  }

}