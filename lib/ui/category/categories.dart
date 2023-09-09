import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lalela/constants/middleware.dart';

import '../../constants/route_const.dart';
import '../../constants/string_constant.dart';

class CategoriesPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CategoriesPageState();
  }

}
class CategoriesPageState extends State<CategoriesPage> {
  MiddleWare middleWare = MiddleWare();
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false,title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
        Icon(Icons.arrow_back_ios),
        Text("Atta, Rice & Dal",style: middleWare.customTextStyle(17, Colors.black, FontWeight.bold),),
        Container(child: Image.asset('assets/images/search_icon.png',width: 25,height: 25,)),

      ],),elevation: 0,backgroundColor: Colors.transparent,),
      body: Row(mainAxisAlignment: MainAxisAlignment.start,children: [
            Card(color: Colors.white,child:
                Container(height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width/5.5,alignment: Alignment.center, child:
            ListView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) => getCategoryList(index)),),),

        Container(height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width/1.26,child:getGridLayout())
      ],)
    );
  }
  getGridLayout(){
    return  GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      itemCount: 12,
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

  getCategoryList(int index){
    return GestureDetector(child: Container(
      height: 120,
      padding: EdgeInsets.all(2),
      alignment: Alignment.center,
      child : Row(mainAxisAlignment: MainAxisAlignment.center,children: [
        Column(mainAxisAlignment: MainAxisAlignment.center,children: [
          Container(width: 50,
              height: 60,decoration: BoxDecoration(
                  color: selectedIndex == index ? middleWare.themeTransparent : Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10)
              ),padding: EdgeInsets.only(top: 10),
              child: Column(children: [
                Image.asset('assets/images/atta.png',height: 40,width: 40,fit: BoxFit.fill,),
              ],) ),middleWare.putSizedBoxHeight(5),
          SizedBox(
            width: 50,
            child: Text(
              "Aata",
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,

              style: middleWare.customTextStyle(
                  14.00, Colors.black, FontWeight.bold),
            ),
          )],),
        selectedIndex == index ? Container(child: VerticalDivider(
          color: middleWare.uiThemeColor,
          thickness: 3,
        ),alignment: Alignment.centerRight,) : Container()
      ],),
    ),onTap: ()  {
      setState(() {
        selectedIndex =  index;
      });

    },);
  }
}
