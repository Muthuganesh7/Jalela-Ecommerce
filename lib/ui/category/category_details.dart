import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lalela/constants/middleware.dart';

import '../../constants/route_const.dart';
import '../../constants/string_constant.dart';

class CategoryDetails extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CategoryDetailsState();
  }

}
class CategoryDetailsState extends State<CategoryDetails>{
  MiddleWare middleWare = MiddleWare();
  int _current = 0;
  final CarouselController _offer_controller = CarouselController();
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];


  @override
  Widget build(BuildContext context) {
    final List<Widget> offerSliders = imgList
        .map((item) => Container(
      child: Container(
        margin: EdgeInsets.all(5.0),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: Stack(
              children: <Widget>[
                // Image.network(item, fit: BoxFit.cover, width: MediaQuery.of(context).size.width,height: 100),
                Image.asset("assets/images/grocery_banner_two.png", fit: BoxFit.fitWidth, width: MediaQuery.of(context).size.width),
              ],
            )),
      ),
    ))
        .toList();

  return Scaffold(
    appBar: AppBar(automaticallyImplyLeading: false,title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
      Icon(Icons.arrow_back_ios),
      Text("Daily Product",style: middleWare.customTextStyle(17, Colors.black, FontWeight.bold),),
      Container(child: Image.asset('assets/images/search_icon.png',width: 25,height: 25,)),
    ],),elevation: 0,backgroundColor: Colors.transparent,),
    body: SingleChildScrollView(physics: ScrollPhysics(),
      child:Container(width: MediaQuery.of(context).size.width,
    child: Column(children: [
      Container(padding: EdgeInsets.all(20),child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          child: Stack(
            children: <Widget>[
              // Image.network(item, fit: BoxFit.fitWidth, width: MediaQuery.of(context).size.width),
              Image.asset("assets/images/grocery_banner.png", fit: BoxFit.fitWidth, width: MediaQuery.of(context).size.width),
              Container(padding: EdgeInsets.all(10),child: Text("Order Grocery Starting @ ₹5",style: middleWare.customTextStyle(16, Colors.black, FontWeight.bold),),)
            ],
          )),),

      getGridLayout(),
      getOffers(offerSliders),
      getGridLayoutRemaining()
    ],),),),
  );
  }

  getOffers(List<Widget> imageSliders){
    return Container(margin: EdgeInsets.only(top: 20),child:Column(children: [
      Container(height: 120,width: MediaQuery.of(context).size.width,child:
      CarouselSlider(
        items: imageSliders,
        carouselController: _offer_controller,
        options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: false,
            aspectRatio: 2.0,
            enableInfiniteScroll: false,
            onPageChanged: (index, reason) {
              setState(() {
                print("onPageChanges $index");
                _current = index;
              });
            }),
      ),),
      Row(mainAxisAlignment: MainAxisAlignment.center,children:[
        Container(padding:EdgeInsets.all(5),margin: EdgeInsets.only(right: 10),child: Text("$_current / ${imgList.length.toString()}"),decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5)),color: middleWare.uiThemeColor),),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _offer_controller.animateToPage(entry.key),
              child: Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),])
    ]),);
  }


  getGridLayout(){
    return  GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      itemCount: 2,
        physics: ScrollPhysics(),
      itemBuilder: (ctx, i) {
        return Card(
          child: GestureDetector(onTap: (){
            Navigator.pushNamed(context, RoutePaths.ProductDetails);
          },child: Container(
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
          )),
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

  getGridLayoutRemaining(){
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

}