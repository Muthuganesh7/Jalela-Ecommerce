import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lalela/constants/middleware.dart';
import 'package:lalela/constants/route_const.dart';

import '../../../constants/string_constant.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePageState();
  }
}
class HomePageState extends State<HomePage>{
  MiddleWare middleWare = MiddleWare();
  int _current = 0;
  final CarouselController _controller = CarouselController();
  final CarouselController _banner_controller = CarouselController();
  final CarouselController _category_controller = CarouselController();
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
    final List<Widget> imageSliders = imgList
        .map((item) => Container(

      child: GestureDetector(child: Container(
        margin: EdgeInsets.all(5.0),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: Stack(
              children: <Widget>[
                // Image.network(item, fit: BoxFit.fitWidth, width: MediaQuery.of(context).size.width),
                Image.asset("assets/images/slider.png", fit: BoxFit.fitWidth, width: MediaQuery.of(context).size.width),
              ],
            )),
      ),onTap: (){
        Navigator.pushNamed(context, RoutePaths.CategoryDetails);
      }),
    ))
        .toList();

    final List<Widget> bannerSliders = imgList
        .map((item) => Container(
      child: Container(
        margin: EdgeInsets.all(5.0),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: Stack(
              children: <Widget>[
                // Image.network(item, fit: BoxFit.cover, width: MediaQuery.of(context).size.width,height: 100),
                Image.asset("assets/images/banner.png", fit: BoxFit.fitWidth, width: MediaQuery.of(context).size.width),
              ],
            )),
      ),
    ))
        .toList();

    final List<Widget> offerSliders = imgList
        .map((item) => Container(
      child: Container(
        margin: EdgeInsets.all(5.0),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: Stack(
              children: <Widget>[
                // Image.network(item, fit: BoxFit.cover, width: MediaQuery.of(context).size.width,height: 100),
                Image.asset("assets/images/slider.png", fit: BoxFit.fitWidth, width: MediaQuery.of(context).size.width),
              ],
            )),
      ),
    ))
        .toList();


    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
        actions: [
          GestureDetector(child: Container(
            padding: EdgeInsets.only(left: 20),
            width: MediaQuery.of(context).size.width,
            child: Row(mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(width: MediaQuery.of(context).size.width/9.9,child:SvgPicture.asset(
                  'assets/images/location.svg',
                  color: middleWare.uiThemeColor,
                  width: 25.00,
                  height: 25.00,
                ),),
                Container(width: MediaQuery.of(context).size.width/1.5,margin: EdgeInsets.only(left: 10,top: 5),alignment: Alignment.topLeft,child: Column(mainAxisAlignment:MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,children: [
                  Row(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,children: [
                    Text("Home",style: middleWare.customTextStyle(15, Colors.black, FontWeight.bold),),
                    Icon(Icons.keyboard_arrow_down)
                  ],),
                  SizedBox(
                    width: MediaQuery.of(context).size.width/1.5,
                    child: Text(
                      "24, Maruthu Pandiyar Street, Maduraieeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeesssssssssssssssss",
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,

                      style: middleWare.customTextStyle(
                          10.00, Colors.grey, FontWeight.w500),
                    ),
                  )

                ],)),
                Container(width: MediaQuery.of(context).size.width/9.9,alignment: Alignment.centerRight,child:
                Icon(Icons.account_circle_outlined,size: 25,))
              ],
            ),),onTap: (){
            Navigator.pushNamed(context, RoutePaths.ChooseDeliveryLocations);
          })


        ],
      ),
      body:SingleChildScrollView(child: Column(children: [
        getSlider(imageSliders),
        middleWare.putSizedBoxHeight(10),
        getBanners(bannerSliders),
        middleWare.putSizedBoxHeight(10),
        getTitle(shopby_category_title),
        getGridLayout(),
        getOffers(offerSliders),
        getSlider(imageSliders),
        getCategories()
      ],)),

      bottomSheet: middleWare.bottomSheet(context),

    );
  }
  getCategories(){
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      height: 200,
      child: ListView(

        // This next line does the trick.
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          middleWare.putSizedBoxWidth(10),
          Container(
            width: 160,
            height: 200,
            child : Stack(children: [
              Container(decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),child: Image.asset('assets/images/fish.png',height: 200,width: 160,fit: BoxFit.fill,)),
              Container(margin: EdgeInsets.only(top: 10,left: 10,right: 10),child: Text("UP TO 50% OFF",textAlign: TextAlign.center,style: middleWare.customTextStyle(20, Colors.black, FontWeight.bold)),)
            ],),
          ),
          middleWare.putSizedBoxWidth(10),
          Container(
            width: 160,
            height: 200,
            child : Stack(children: [
              Container(decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),child: Image.asset('assets/images/fish.png',height: 200,width: 160,fit: BoxFit.fill,)),
              Container(margin: EdgeInsets.only(top: 10,left: 10,right: 10),child: Text("UP TO 50% OFF",textAlign: TextAlign.center,style: middleWare.customTextStyle(20, Colors.black, FontWeight.bold)),)
            ],),
          ),
          middleWare.putSizedBoxWidth(10),
          Container(
            width: 160,
            height: 200,
            child : Stack(children: [
              Container(decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),child: Image.asset('assets/images/fish.png',height: 200,width: 160,fit: BoxFit.fill,)),
              Container(margin: EdgeInsets.only(top: 10,left: 10,right: 10),child: Text("UP TO 50% OFF",textAlign: TextAlign.center,style: middleWare.customTextStyle(20, Colors.black, FontWeight.bold)),)
            ],),
          ),
          middleWare.putSizedBoxWidth(10),
          Container(
            width: 160,
            height: 200,
            child : Stack(children: [
              Container(decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),child: Image.asset('assets/images/fish.png',height: 200,width: 160,fit: BoxFit.fill,)),
              Container(margin: EdgeInsets.only(top: 10,left: 10,right: 10),child: Text("UP TO 50% OFF",textAlign: TextAlign.center,style: middleWare.customTextStyle(20, Colors.black, FontWeight.bold)),)
            ],),
          ),
          middleWare.putSizedBoxWidth(10),
        Container(
          width: 160,
          height: 200,
          child : Stack(children: [
            Container(decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),child: Image.asset('assets/images/fish.png',height: 200,width: 160,fit: BoxFit.fill,)),
            Container(margin: EdgeInsets.only(top: 10,left: 10,right: 10),child: Text("UP TO 50% OFF",textAlign: TextAlign.center,style: middleWare.customTextStyle(20, Colors.black, FontWeight.bold)),)
          ],),
        ),
          middleWare.putSizedBoxWidth(10),
        ],
      ),
    );
  }

  getSlider(List<Widget> imageSliders){
    return Container(margin: EdgeInsets.only(top: 20),child:Column(children: [
      CarouselSlider(
        items: imageSliders,
        carouselController: _controller,
        options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 2.0,
            enableInfiniteScroll: false,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            }),
      ),
      middleWare.putSizedBoxHeight(10),
      Row(mainAxisAlignment: MainAxisAlignment.center,children:[
        Container(padding:EdgeInsets.all(5),margin: EdgeInsets.only(right: 10),child: Text("$_current / ${imgList.length.toString()}"),decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5)),color: middleWare.uiThemeColor),),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
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

  getBanners(List<Widget> imageSliders){
    return Container(margin: EdgeInsets.only(top: 20),child:Column(children: [
      Container(height: 120,width: MediaQuery.of(context).size.width,child:
      CarouselSlider(
        items: imageSliders,
        carouselController: _banner_controller,
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
              onTap: () => _banner_controller.animateToPage(entry.key),
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
              onTap: () => _banner_controller.animateToPage(entry.key),
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


  getTitle(String txt){
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: middleWare.margin20),
      child: Text(txt,style:middleWare.customTextStyle(20, Colors.black, FontWeight.bold)),
    );
  }
  getGridLayout(){
    return  GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        shrinkWrap: true,

        children: List.generate(4, (index) {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              'assets/images/category_img.png',

              fit: BoxFit.fill,
              height: 135.0,
              width: 135.0,
            ),
          ),

          // Container(
          // height: 150,
          // decoration: BoxDecoration(
          //     borderRadius:
          //     BorderRadius.all(Radius.circular(20.0),),
          //   ),
          //
          // child: Image.asset('assets/images/slider.png',height: 150,width: 150,fit: BoxFit.cover),),

          // decoration: BoxDecoration(
          //   image: Image.asset("assets/images/slider.png", fit: BoxFit.fitWidth, width: MediaQuery.of(context).size.width)
          //   //   DecorationImage(
          //   //   image: Image.asset("assets/images/slider.png", fit: BoxFit.fitWidth, width: MediaQuery.of(context).size.width),
          //   //   // image: NetworkImage('https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80'),
          //   //   fit: BoxFit.cover,
          //   // ),
          //   borderRadius:
          //   BorderRadius.all(Radius.circular(20.0),),
          // ),
        // )
        //   ,
          Container(margin:EdgeInsets.only(top: 5),child:Text("Hyber"))
        ],)
      );
    },)
    );
  }
}