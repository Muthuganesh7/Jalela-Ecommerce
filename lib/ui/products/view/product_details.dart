import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lalela/constants/middleware.dart';

import '../../../constants/string_constant.dart';

class ProductDetailsPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ProductDetailsState();
  }

}
class ProductDetailsState extends State<ProductDetailsPage>{
  MiddleWare middleWare = MiddleWare();
  final CarouselController _controller = CarouselController();
  int productCount = 0;
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];
  final String description =
      "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,";

  int _current = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final List<Widget> imageSliders = imgList
        .map((item) => Container(

      child: Container(
        margin: EdgeInsets.all(5.0),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: Stack(
              children: <Widget>[
                // Image.network(item, fit: BoxFit.fitWidth, width: MediaQuery.of(context).size.width),
                Image.asset("assets/images/atta.png", fit: BoxFit.contain, width: MediaQuery.of(context).size.width),
              ],
            )),
      ),
    ))
        .toList();
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false,title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
        Icon(Icons.arrow_back_ios),
    SizedBox(
    width: MediaQuery.of(context).size.width/2,
    child: Text(
    "Fortune Sun Lite Refined Sunflower Oil",
    textAlign: TextAlign.center,
    overflow: TextOverflow.ellipsis,
    maxLines: 1,
      style: middleWare.customTextStyle(17, Colors.black, FontWeight.bold))),
        Container(child: Image.asset('assets/images/search_icon.png',width: 25,height: 25,)),
      ],),elevation: 0,backgroundColor: Colors.transparent,),
      body: SingleChildScrollView(child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,children: [
        getSlider(imageSliders),
        getTitleText("Fortune Sun Lite Refined Sunflower Oil"),
        middleWare.putSizedBoxHeight(10),
        getRatingBar(),
        getAmountOfferRow(),
        Divider(color: Colors.grey.shade300,thickness: 2,endIndent: 20,indent: 20,),
        middleWare.putSizedBoxHeight(10),
        getPara(),
        middleWare.putSizedBoxHeight(10),
        Divider(color: Colors.grey.shade300,thickness: 2,endIndent: 20,indent: 20,),
        getTitleText(reviews_and_ratings),
        middleWare.putSizedBoxHeight(10),
        getOverAllRatings(),
        getReviewList(),
        Divider(color: Colors.grey.shade300,thickness: 2,endIndent: 20,indent: 20,),
        getTitleText("Similar Products"),
        getSimilarProducts(),
        middleWare.putSizedBoxHeight(80)

      ],),),

      bottomSheet: Container(margin: EdgeInsets.only(bottom: 10),child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
        Container(child: Row(children: [
          GestureDetector(child: Icon(Icons.remove,color: Colors.grey,size: 30),onTap: (){
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
        GestureDetector(child: Icon(Icons.add,color: middleWare.uiThemeColor,size: 30,),onTap: (){
          setState(() {
            productCount = productCount + 1;
          });

        }),

        ],),decoration: BoxDecoration(color: Colors.grey.shade300,borderRadius: BorderRadius.all(Radius.circular(10))),height: 60),

        getAddToCartBtn()
      ],),),
    );
  }
  getReviewList(){
    return ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemCount: 2,
        itemBuilder: (BuildContext context, int index) => getReviewListItem(index));
  }
  getReviewListItem(index){
    return Container(child: Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.start,children: [
        middleWare.putSizedBoxWidth(20),
        ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            child: Stack(
              children: <Widget>[
                // Image.network(item, fit: BoxFit.fitWidth, width: MediaQuery.of(context).size.width),
                Image.asset("assets/images/reviewer.png", fit: BoxFit.contain, width: 50),
              ],
            )),
        Column(children: [
          getSubTitleText("Johnson Smith"),
          getSubText("June 04, 2023"),

        ],),
        Container(margin: EdgeInsets.only(left: 40),alignment: Alignment.centerRight,child: RatingBar.builder(
          initialRating: 3,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: false,
          itemCount: 5,
          itemSize: 20,
          itemPadding: EdgeInsets.symmetric(horizontal: 0,vertical: 0),
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            print(rating);
          },
        ),)

      ],),

      Container(child: Column(children: [
        getPara(),
        getRealImages()
      ],),margin: EdgeInsets.only(left: 70),)

    ],));
  }
  getRealImages(){
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      height: 70,
      child: ListView(
        // This next line does the trick.
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          middleWare.putSizedBoxWidth(10),
          getCardLayout(),
          middleWare.putSizedBoxWidth(10),
          getCardLayout(),
          middleWare.putSizedBoxWidth(10),
          getCardLayout(),
        ],
      ),
    );
  }

  getSimilarProducts(){
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
          getProductLayout()
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
  Container getAddToCartBtn() {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width/1.6,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: middleWare.uiThemeColor,
          foregroundColor: middleWare.uiThemeColor,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(addToCartText,
                style: middleWare.customTextStyle(
                    16.00, Colors.white, FontWeight.normal)),
            SizedBox(
              width:20,
            ),
            VerticalDivider(color: Colors.white,thickness: 1,indent: 20,endIndent: 20,),
            SizedBox(
              width:20,
            ),
            Text("₹10",
                style: middleWare.customTextStyle(
                    16.00, Colors.white, FontWeight.bold)),
          ],
        ),
        onPressed: () async {
        },
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

  getCardLayout(){
    return ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        child: Stack(
          children: <Widget>[
            // Image.network(item, fit: BoxFit.fitWidth, width: MediaQuery.of(context).size.width),
            Image.asset("assets/images/real_img.png", fit: BoxFit.contain, width: 70),
          ],
        ));
  }
  getPara(){
    return Container(
      child: DescriptionTextWidget(text: description),
    );
  }
  getTitleText(txt){
    return Container(margin: EdgeInsets.only(left: 20,top: 10),child: Text(txt,
        overflow: TextOverflow.ellipsis,
        maxLines: 3,style: middleWare.customTextStyle(17, Colors.black, FontWeight.bold),textAlign: TextAlign.start,));
  }
  getSubTitleText(txt){
    return Container(margin: EdgeInsets.only(left: 20),child: Text(txt,
      overflow: TextOverflow.ellipsis,
      maxLines: 3,style: middleWare.customTextStyle(15, Colors.black, FontWeight.bold),textAlign: TextAlign.start,));
  }
  getAmountOfferRow(){
    return Container(child: Row(children: [
      middleWare.putSizedBoxWidth(20),
      Text("₹10",style: middleWare.customTextStyle(14, Colors.black, FontWeight.bold),),
      middleWare.putSizedBoxWidth(5),
      Text("₹14",style: middleWare.customTextStyleLineThrough(14, Colors.grey, FontWeight.bold),),
      middleWare.putSizedBoxWidth(5),
      getOffer()
    ],),);
  }
  Container getOffer() {
    return Container(

      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: middleWare.uiThemeColor,
          foregroundColor: middleWare.uiThemeColor,
          elevation: 0,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("10% OFF",
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
  getOverAllRatings(){
    return Row(children: [
      middleWare.putSizedBoxWidth(30),
      Container(margin: EdgeInsets.only(top: 5),child: Text("4.2",style: middleWare.customTextStyle(23, Colors.black, FontWeight.bold),),),
      middleWare.putSizedBoxWidth(10),
      Column(children: [
        RatingBar.builder(
          initialRating: 3,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: false,
          itemCount: 5,
          itemSize: 20,
          itemPadding: EdgeInsets.symmetric(horizontal: 0,vertical: 0),
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            print(rating);
          },
        ),
        middleWare.putSizedBoxHeight(5),
        getSubText("126 Reviews")
      ],)
    ],);
  }
  getSubText(txt){
    return Text(txt,style: middleWare.customTextStyle(14, Colors.grey, FontWeight.normal),);
  }
  getRatingBar(){
    return Row(children: [
      middleWare.putSizedBoxWidth(20),
      RatingBar.builder(
      initialRating: 3,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: false,
      itemCount: 5,
      itemSize: 20,
      itemPadding: EdgeInsets.symmetric(horizontal: 0,vertical: 0),
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        print(rating);
      },
    ),
      middleWare.putSizedBoxWidth(15),
      Text("4.0 (146 Reviews)",style: middleWare.customTextStyle(15, Colors.black, FontWeight.normal),)
    ],);
  }
  getSlider(List<Widget> imageSliders){
    return Container(margin: EdgeInsets.only(top: 20),child:Column(children: [
      Container(height: MediaQuery.of(context).size.height/2,child:CarouselSlider(
        items: imageSliders,
        carouselController: _controller,
        options: CarouselOptions(
            autoPlay: false,
            viewportFraction: 1,
            enlargeCenterPage: true,
            aspectRatio: 2.0,
            enableInfiniteScroll: false,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            }),
      )),
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

}
class DescriptionTextWidget extends StatefulWidget {
  final String text;

  DescriptionTextWidget({required this.text});

  @override
  _DescriptionTextWidgetState createState() => new _DescriptionTextWidgetState();
}

class _DescriptionTextWidgetState extends State<DescriptionTextWidget> {
  late String firstHalf;
  late String secondHalf;
  MiddleWare middleWare = MiddleWare();
  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > 200) {
      firstHalf = widget.text.substring(0, 200);
      secondHalf = widget.text.substring(200, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: secondHalf.isEmpty
          ? Container(alignment: Alignment.centerLeft,child:Text(firstHalf,style: middleWare.customTextStyle(14, Colors.black, FontWeight.normal),))
          : Column(
        mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(alignment: Alignment.topLeft,child:Text(flag ? (firstHalf + "...") : (firstHalf + secondHalf) ,style: middleWare.customTextStyle(15, Colors.black, FontWeight.normal))),
          InkWell(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  flag ? "Read More" : "Read Less",
                  style: middleWare.customTextStyle(15, middleWare.uiThemeColor, FontWeight.normal),
                ),
              ],
            ),
            onTap: () {
              setState(() {
                flag = !flag;
              });
            },
          ),
        ],
      ),
    );
  }
}