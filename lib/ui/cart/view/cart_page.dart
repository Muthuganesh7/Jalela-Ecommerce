import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lalela/constants/middleware.dart';

import '../../../constants/route_const.dart';
import '../../../constants/string_constant.dart';

class CartPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CartPageState();
  }

}
class CartPageState extends State<CartPage>{
  MiddleWare middleWare = MiddleWare();
  int productCount = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
     appBar: AppBar(automaticallyImplyLeading: false,title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
       Icon(Icons.arrow_back_ios),
       Text(checkout,style: middleWare.customTextStyle(17, Colors.black, FontWeight.bold),),
       Container()
     ],),elevation: 0,backgroundColor: Colors.transparent,),
     body: SingleChildScrollView(child: Container(alignment: Alignment.centerLeft,width: MediaQuery.of(context).size.width,child: Column(children: [
       ListView.builder(itemCount: 2,scrollDirection: Axis.vertical,shrinkWrap: true,
         physics: ClampingScrollPhysics(),itemBuilder: (context, index) {
         return getCartItem();
         // return Text("oadsjoj");
       },),

       getTitle(),
       getRelatedProducts(),
       getApplyTokenLayout(),
       middleWare.putSizedBoxHeight(10),
       getDivider(),
       getItemValues(),
       middleWare.putSizedBoxHeight(20),
       getAddressLayout(),
       middleWare.putSizedBoxHeight(20),
       getDivider(),
       middleWare.putSizedBoxHeight(20),
       getPaymentLayout(),
       middleWare.putSizedBoxHeight(20),
     ]),),)
   );
  }
  getPaymentLayout(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Column(
        children: [
          Row(children: [ Container(margin: EdgeInsets.only(left: 20),child: Text(payUsing,style: middleWare.customTextStyle(13, Colors.grey, FontWeight.w500),),), Icon(Icons.keyboard_arrow_up)],),
          middleWare.putSizedBoxHeight(10),
          Container(child: Text("Visa 8980",style: middleWare.customTextStyle(13, Colors.black, FontWeight.bold),),)
        ],
      ),
        GestureDetector(child: Container(margin: EdgeInsets.only(right: 10),height: 60,
          decoration: BoxDecoration(color: middleWare.uiThemeColor,borderRadius: BorderRadius.circular(10)),
          child: Row(children: [
            middleWare.putSizedBoxWidth(10),
            Container(width: 80,alignment: Alignment.center,child: Text("₹180",overflow: TextOverflow.ellipsis,maxLines: 1,style: middleWare.customTextStyle(17, Colors.white, FontWeight.bold),),),
            middleWare.putSizedBoxWidth(5),
            VerticalDivider(width: 2,thickness: 2,color: Colors.white,indent: 10,endIndent: 10),
            middleWare.putSizedBoxWidth(10),
            Container(child: Text("Place Order",style: middleWare.customTextStyle(17, Colors.white, FontWeight.w400),),),
            middleWare.putSizedBoxWidth(10),
            Icon(Icons.arrow_right_alt,color: Colors.white,),
            middleWare.putSizedBoxWidth(10),
          ],),),
          onTap: (){
          Navigator.pushNamed(context, RoutePaths.PaymentMethod);
        },)
      ],
    );
  }
  getAddressLayout(){
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
      Row(children:[
        Container(child: SvgPicture.asset('assets/images/home_address_icon.svg', height: 50, width: 50),margin: EdgeInsets.only(left: 20),),
        Column(children: [
          Container(margin: EdgeInsets.only(right: 20),child: Text(deliveryToHome,style: middleWare.customTextStyle(16, Colors.black, FontWeight.w500),),),
          Container(width:MediaQuery.of(context).size.width/2,margin: EdgeInsets.only(left: 20),child: Text("231C, 3Rd Floor, Kamarajar Salai, Madurai, Tamil Nadu 625009",maxLines: 1,overflow: TextOverflow.ellipsis,textAlign: TextAlign.left,style: middleWare.customTextStyle(14, Colors.grey, FontWeight.normal),),),

        ],),
      ]),
      Container(margin: EdgeInsets.only(right: 20),child: Text(changeTxt,style: middleWare.customTextStyle(15, middleWare.uiThemeColor, FontWeight.w500),),)
    ],);
  }
  getItemValues(){
    return Column(children: [
      middleWare.putSizedBoxHeight(20),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
      Container(child: Text(itemTotal,style: middleWare.customTextStyle(15, Colors.black, FontWeight.w500),),margin: EdgeInsets.only(left: 20),),
      Container(margin: EdgeInsets.only(right: 20),child: Text("₹20",style: middleWare.customTextStyle(15, Colors.black, FontWeight.w500),),)
    ],),
      middleWare.putSizedBoxHeight(15),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
        Container(child: Text(discount,style: middleWare.customTextStyle(15, Colors.black, FontWeight.w500),),margin: EdgeInsets.only(left: 20),),
        Container(margin: EdgeInsets.only(right: 20),child: Text("₹2",style: middleWare.customTextStyle(15, Colors.black, FontWeight.w500),),)
      ],),
      middleWare.putSizedBoxHeight(15),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
        Container(child: Text(deliveryFee,style: middleWare.customTextStyle(15,  middleWare.uiThemeColor, FontWeight.w500),),margin: EdgeInsets.only(left: 20),),
        Container(margin: EdgeInsets.only(right: 20),child: Text("Free",style: middleWare.customTextStyle(15, middleWare.uiThemeColor, FontWeight.w500),),)
      ],),
      middleWare.putSizedBoxHeight(15),
      getDivider(),
      middleWare.putSizedBoxHeight(15),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
        Container(child: Text(grandTotal,style: middleWare.customTextStyle(16,  Colors.black, FontWeight.bold),),margin: EdgeInsets.only(left: 20),),
        Container(margin: EdgeInsets.only(right: 20),child: Text("₹18",style: middleWare.customTextStyle(16, Colors.black, FontWeight.bold),),)
      ],),



    ]);
  }
  getDivider(){
    return Divider(height: 1,indent: 20,endIndent: 20,color: Colors.grey.shade300,);
  }
  getTitle(){
    return Container(alignment: Alignment.centerLeft,margin: EdgeInsets.only(left: 20,top: 10),child: Text(beforeCheckout, style: middleWare.customTextStyle(16, Colors.black, FontWeight.bold),),);
  }

  getApplyTokenLayout(){
    return GestureDetector(onTap: (){
      Navigator.pushNamed(context, RoutePaths.Coupon);
    },
    child:Container(child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
    Row(children: [
      middleWare.putSizedBoxWidth(20),
      SvgPicture.asset(
          'assets/images/vector.svg',
          height: 35,width: 35
      ),
      middleWare.putSizedBoxWidth(20),
      Text(applyCoupon,style: middleWare.customTextStyle(17, Colors.black, FontWeight.w400),)
    ]),
      Container(child: Icon(Icons.chevron_right),margin: EdgeInsets.only(right: 10),)
    ],),));
  }

  getRelatedProducts(){
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      height: 290,
      child: ListView(

        // This next line does the trick.
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          middleWare.putSizedBoxWidth(10),
          getProductLayout(),
          middleWare.putSizedBoxWidth(10),
          getProductLayout(),
          middleWare.putSizedBoxWidth(10),
          getProductLayout(),
          middleWare.putSizedBoxWidth(10),
          getProductLayout(),
          middleWare.putSizedBoxWidth(10),
          getProductLayout(),
          middleWare.putSizedBoxWidth(10),
        ],
      ),
    );
  }

  getProductLayout(){
    return Card(
      child: Container(
        height: 290,
        width: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20)),
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(5),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child:   Stack(children: [
                    Container(child: Column(children: [
                      Container(padding: EdgeInsets.all(10),width: MediaQuery.of(context).size.width,
                          height: 120,decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8.0),
                              topRight: Radius.circular(8.0),
                            ),
                            child: Image.asset('assets/images/atta.png',fit: BoxFit.fill,width: 70,height: 70,),)])
                      )
                    ],)
                    ),
                    Container(alignment: Alignment.topRight,margin: EdgeInsets.only(right: 10,top: 5),child: Icon(Icons.favorite_border),)
                  ],),
                ),
                Text(
                    'Aashirvaad Shudh Aata',
                    style: middleWare.customTextStyle(15, Colors.black, FontWeight.normal)
                ),
                Text(
                    '10 KG',
                    style: middleWare.customTextStyle(12, Colors.grey, FontWeight.normal)
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                  Column(children: [
                    Text(
                        '₹10',
                        style: middleWare.customTextStyle(13, Colors.black, FontWeight.bold)
                    ),
                    Text(
                        '₹14',
                        style: middleWare.customTextStyleLineThrough(13, Colors.grey, FontWeight.normal)
                    ),
                  ],),
                  getAddBtn()
                ],)

              ],
            ),
          ],
        ),
      ),
    );
  }
  Container getAddBtn() {
    return Container(

      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: middleWare.uiThemeColor,
          foregroundColor: middleWare.uiThemeColor,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(addText,
                style: middleWare.customTextStyle(
                    12.00, Colors.white, FontWeight.bold)),
            SizedBox(
              width:2,
            ),

          ],
        ),
        onPressed: () async {
        },
      ),
    );
  }

  getCartItem(){
    return Container(margin: EdgeInsets.only(top: 20),child: Row(children: [
      middleWare.putSizedBoxWidth(20),
        ClipRRect(child: Container(width: 80,height: 80,child: Image.asset("assets/images/atta.png",width: 50,height: 50,),decoration: BoxDecoration(color: Colors.grey.shade300),),borderRadius: BorderRadius.all(Radius.circular(10)),),
      Container(margin: EdgeInsets.only(left: 50),child: Column(children: [
        Container(width: MediaQuery.of(context).size.width/2,child: Text("Fortune Sun Lite Refined Sunflower Oil",overflow: TextOverflow.ellipsis,maxLines: 2,style: middleWare.customTextStyle(16, Colors.black, FontWeight.bold),),),
        Container(width: MediaQuery.of(context).size.width/2,child: Text("5 L",overflow: TextOverflow.ellipsis,maxLines: 2,style: middleWare.customTextStyle(14, Colors.black, FontWeight.normal),),),
        Container(width: MediaQuery.of(context).size.width/2,child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
          Container(child: Text("₹10",style: middleWare.customTextStyle(16, Colors.black, FontWeight.bold),),),
          Container(child: Row(children: [
            GestureDetector(child: Icon(Icons.remove,color: Colors.grey,size: 25),onTap: (){
              if(productCount > 0){
                setState(() {
                  productCount = productCount - 1;
                });
              }else{
                setState(() {
                  productCount = 0;
                });
              }
            }),
            middleWare.putSizedBoxWidth(15),
            Container(child: Text(productCount.toString(),style: middleWare.customTextStyle(18, Colors.black, FontWeight.bold),),),
            middleWare.putSizedBoxWidth(15),
            GestureDetector(child: Icon(Icons.add,color: middleWare.uiThemeColor,size: 25,),onTap: (){
              setState(() {
                productCount = productCount + 1;
              });

            }),

          ],),decoration: BoxDecoration(border: Border.all(width: 1,color: middleWare.uiThemeColor),borderRadius: BorderRadius.all(Radius.circular(10))),height: 45)
        ],))

      ],),)

    ],));
  }

}