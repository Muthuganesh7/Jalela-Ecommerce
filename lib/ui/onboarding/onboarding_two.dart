
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lalela/constants/middleware.dart';
import 'package:lalela/constants/string_constant.dart';

import '../../constants/route_const.dart';

class OnBoardingTwo extends StatelessWidget{
  MiddleWare middleWare = MiddleWare();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.transparent,automaticallyImplyLeading: false,elevation: 0,actions: [
          GestureDetector(
            child: Row(mainAxisAlignment: MainAxisAlignment.end,children: [
              Text(skip,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400),),
              middleWare.putSizedBoxWidth(middleWare.margin10),

              Container(margin: EdgeInsets.only(right: middleWare.margin10),child: Image.asset('assets/images/arrow_right.png',height: middleWare.margin40,width: middleWare.margin40,),),],),
            onTap: (){
              Navigator.pushNamed(context, RoutePaths.Login);
            },
          ),
        ]),
        body: Container(height: height,child: Column(children: [
          middleWare.putSizedBoxHeight(middleWare.margin30),
          Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              // Container(child: Image.asset('assets/images/fish.png',height: height/2.5,width: width,),),
              SvgPicture.asset(
                  'assets/images/fish.svg',
                  height: height/2.5,width: width
              ),
              Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Container(child: Image.asset('assets/images/msg_card_bg.png',height: height/2.5,width: width,),margin: EdgeInsets.only(top: height/2.7),),
                  Container(height:height/1.2,child:getSlider()),
                  Container(margin: EdgeInsets.only(top: 280),child:getTitleText(context)),
                  GestureDetector(
                    child: Container(height:height/1.33,alignment: Alignment.bottomCenter,child: Image.asset('assets/images/arrow_right.png',height: middleWare.margin50,width: middleWare.margin50,)),
                    onTap: (){
                      Navigator.pushNamed(context, RoutePaths.onBoardPage3);
                    },
                  )
                ],
              )
            ],
          )
        ]))
    );
  }
  getTitleText(BuildContext context){
    return Column(mainAxisAlignment: MainAxisAlignment.center,children: [
      Container(width: MediaQuery.of(context).size.width /1.5,margin: EdgeInsets.only(top: middleWare.margin70),child: Text(meatTitle,textAlign: TextAlign.center,style: middleWare.customTextStyle(20, Colors.white, FontWeight.bold))),
      Container(alignment: Alignment.center,width: MediaQuery.of(context).size.width /1.5,margin: EdgeInsets.only(top: middleWare.margin10),child: Text(meatDescription,textAlign: TextAlign.center,style: middleWare.customTextStyle(16, Colors.white, FontWeight.normal)))
    ]);
  }
  getSlider(){
    return Row(mainAxisAlignment: MainAxisAlignment.center,children: [
      Container(child: Image.asset('assets/images/black_circle.png',height: middleWare.margin10,width: middleWare.margin10,)),
      middleWare.putSizedBoxWidth(middleWare.margin5),
      Container(child: Image.asset('assets/images/white_circle.png',height: middleWare.margin10,width: middleWare.margin10,)),
      middleWare.putSizedBoxWidth(middleWare.margin5),
      Container(child: Image.asset('assets/images/black_circle.png',height: middleWare.margin10,width: middleWare.margin10,)),
      middleWare.putSizedBoxWidth(middleWare.margin5),
      Container(child: Image.asset('assets/images/black_circle.png',height: middleWare.margin10,width: middleWare.margin10,)),
    ],);
  }

}