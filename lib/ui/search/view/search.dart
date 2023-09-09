import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lalela/constants/middleware.dart';

import '../../../constants/route_const.dart';
import '../../../constants/string_constant.dart';

class SearchPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SearchState();
  }

}
class SearchState extends State<SearchPage>{
  MiddleWare middleWare = MiddleWare();
  List<String> arr = ["Good Knight","Tata Salt","Sunflower Oil","Dettol Liquid","Madhur Sugar","Amul Ghee"];
  TextEditingController searchTextController = TextEditingController();
  bool isShowSearchResult = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false,title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
        Icon(Icons.arrow_back_ios),
      ],),elevation: 0,backgroundColor: Colors.transparent,),
      body: SingleChildScrollView(child: Container(margin: EdgeInsets.only(top: 20),child: Column(children: [
        getSearchBar(),
        middleWare.putSizedBoxHeight(20),

        isShowSearchResult == true ? getTitleText("$searchResultText ${searchTextController.text}") : Container(),
        isShowSearchResult == true ? middleWare.putSizedBoxHeight(20) : Container(),
        isShowSearchResult == true ? getSearchResult() : Container(),
        isShowSearchResult == false ? getTitleText(recentSearch) : Container(),
        isShowSearchResult == false ? middleWare.putSizedBoxHeight(20): Container(),
        isShowSearchResult == false ? getGridLayout(): Container(),
        isShowSearchResult == false ? middleWare.putSizedBoxHeight(20): Container(),
        isShowSearchResult == false ? getTitleText(trendingNow): Container(),
        isShowSearchResult == false ? getCategories(): Container()
      ],),),)
    );
  }
  getTitleText(txt){
    return Container(alignment: Alignment.centerLeft,margin: EdgeInsets.only(left: 20),child:Text(txt,style: middleWare.customTextStyle(15, Colors.black, FontWeight.bold),textAlign: TextAlign.start,));
  }
  getSearchResult(){
    return  GridView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      itemCount: 8,
      itemBuilder: (ctx, i) {
        return Card(
          child: Container(
            height: 290,
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
                      child: Stack(children: [
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
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        crossAxisSpacing: 0.0,
        mainAxisSpacing: 5,
        mainAxisExtent: 264,
      ),
    );

  }
  getCategories(){
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      height: 290,
      child: ListView(
        // This next line does the trick.
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          middleWare.putSizedBoxWidth(10),
          getCardLayout(),
          middleWare.putSizedBoxWidth(10),
          getCardLayout(),
          middleWare.putSizedBoxWidth(10),
          getCardLayout()
        ],
      ),
    );
  }

  getCardLayout(){
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
  getGridLayout(){
    return  GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      itemCount: 6,
      physics: ScrollPhysics(),
      itemBuilder: (ctx, i) {
        return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),color: Colors.grey.shade300),
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(5),
            alignment: Alignment.center,
            child: Text(arr[i],style: middleWare.customTextStyle(14, Colors.black, FontWeight.normal),textAlign: TextAlign.center,)

        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.0,
        crossAxisSpacing: 0.0,
        mainAxisSpacing: 5,
        mainAxisExtent: 50,
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
          Navigator.pushNamed(context, RoutePaths.Home);
        },
      ),
    );
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
          onChanged: (String? strValue){
            setState(() {
              isShowSearchResult = true;
            });
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