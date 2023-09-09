import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lalela/constants/middleware.dart';

import '../../../constants/string_constant.dart';

class CouponList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CouponState();
  }

}
class CouponState extends State<CouponList>{
  MiddleWare middleWare = MiddleWare();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false,title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
        Icon(Icons.arrow_back_ios),
        Text(coupon,style: middleWare.customTextStyle(17, Colors.black, FontWeight.bold),),
        Container()
      ],),elevation: 0,backgroundColor: Colors.transparent,),
      body: SingleChildScrollView(
        child: Column(
          children: [


            Container(
              height:50,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: middleWare.uiLightGreyColor,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child:Stack(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left:10),
                      child:TextField(
                        decoration: InputDecoration(
                          hintText: enterCoupon,
                          hintStyle: middleWare.customTextStyle(14, Colors.grey.shade400, FontWeight.w400),
                          border:InputBorder.none,
                        ),
                      ),
                    ),
                    Container(
                      alignment:Alignment.topRight,
                      margin: EdgeInsets.only(right:10),
                      child:ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: middleWare.uiThemeColor,
                        ),
                        onPressed: () {},
                        child:  Container(
                            padding:  EdgeInsets.all(10),
                            child: Text(apply, style: middleWare.customTextStyle(14, Colors.white, FontWeight.w400))),
                      ),
                    ),
                  ]
              ),
            ),
            SizedBox(height: 10),
            getMyListView(context), // Use getMyListView function
          ],
        ),
      ),
    );
  }

  Widget getMyListView(BuildContext context) {
    final List<ListItem> items = [
      ListItem(tit:'Flat 10% OFF on Standard Chartered Digismart Credit Cards',setit:"No Minimum Order Value",button1:'DIGISMART'),
      ListItem(tit:'Flat 10% OFF upto ₹500 on HSBC Cashback Credit Card',setit:"Total Value of items must be ₹50 or More",button1:'HSBC500'),
      ListItem(tit:'Get Upto 50 OFF on Your First Payment',setit:"Total Value of items must be ₹50 or More",button1:'PAYMENT50'),
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (ctx, i) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // Set the circular radius
            ),
            child: Column(
              mainAxisAlignment:MainAxisAlignment.start,
              children:[
                Container(
                  margin:EdgeInsets.only(left:20,right:20,top:20,),
                  alignment: Alignment.topLeft,
                  child:Text('${items[i].tit}',style:middleWare.customTextStyle(16, Colors.black, FontWeight.w500),
                    maxLines: 2,
                  ),
                ),
                Container(
                  margin:EdgeInsets.only(left:20,top:10,),
                  alignment: Alignment.topLeft,
                  child:Text('${items[i].setit}', style: middleWare.customTextStyle(14, Colors.grey, FontWeight.w400) ,
                    maxLines: 1,
                  ),
                ),

                SizedBox(height:15),
                Divider(
                    color: Colors.grey.shade300,
                    indent: 20, // Adjust the indent to reduce the width
                    endIndent: 20,
                    height: 1,
                    thickness: 1
                ),
                SizedBox(
                  height:15,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: EdgeInsets.only(left:20),
                          color: middleWare.themeTransparent,
                          child:DottedBorder(
                            radius: Radius.circular(15),
                            color: middleWare.uiThemeColor,
                            strokeWidth: 1.5,
                            padding: EdgeInsets.all(12),
                            child: Center(
                                child : Text ("${items[i].button1}",
                                    textAlign: TextAlign.center,
                                    style: middleWare.customTextStyle(15, middleWare.uiThemeColor, FontWeight.w500))
                            ),
                          )
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: middleWare.uiThemeColor,
                            foregroundColor: middleWare.themeTransparent,
                          ),
                          onPressed: () {},
                          child: Container(padding: EdgeInsets.all(15),child: Text(apply, style: TextStyle(color: Colors.white))),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height:30,),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ListItem {
  final String tit;
  final String setit;
  final String  button1;


  ListItem({required this.tit, required this.setit, required this.button1});
}


