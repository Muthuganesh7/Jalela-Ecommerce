import 'dart:async';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lalela/constants/middleware.dart';
import 'package:lalela/route_setup.dart';
import 'package:lalela/theme.dart';
import 'package:lalela/ui/category/categories.dart';
import 'package:lalela/ui/category/category_details.dart';
import 'package:lalela/ui/delivery/view/chosse_delivery_location.dart';
import 'package:lalela/ui/favorites/view/favorites.dart';
import 'package:lalela/ui/home/view/bottom_navigation.dart';
import 'package:lalela/ui/home/view/homepage.dart';
import 'package:lalela/ui/onboarding/onboarding_one.dart';
import 'package:lalela/ui/products/view/product_details.dart';
import 'package:lalela/ui/profile/view/profilepage.dart';
import 'package:lalela/ui/search/view/search.dart';

import 'constants/string_constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      onGenerateRoute: RouterViews.generateRoute,
      theme: CustomAppTheme.lightAppTheme,
      home: BottomNavigationBarExample(),

    );
  }
}
class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() {
    return SplashScreenState();
  }
}
class SplashScreenState extends State<SplashScreen> with WidgetsBindingObserver{
  @override
  void initState() {
    try {
      super.initState();
      WidgetsBinding.instance.addObserver(this);
      Future.delayed(const Duration(milliseconds: 5000), () {
        // middleWare.hideKeyBoard(context);
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => OnBoardingOne()));

      });
    } catch (e) {
      print(e);
    }
  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);

  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body:
     // Container(decoration: BoxDecoration(
     //   image: DecorationImage(image: AssetImage("assets/images/splash_screen.png"),fit: BoxFit.cover),
     // ),),
       Container(child:SvgPicture.asset("assets/images/splash_screen.svg"),width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,)
   );
  }
}

class Radiotry extends StatefulWidget {
  @override
  MyHomePage createState() => MyHomePage();
}

class MyHomePage extends State<Radiotry> {
  int selectedValue = 1; // Initial value for the radio buttons

  void _handleRadioValueChange(int? value) {
    setState(() {
      selectedValue = value!;
    });
  }

  void _showBottomSheet(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    showModalBottomSheet(

      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.0),
        ),
      ),
      builder: (BuildContext context) {
        return SingleChildScrollView(

          child: Container(
            decoration: BoxDecoration(
//               color: Colors.cyan,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
            ),

            child: Card(
              margin: EdgeInsets.only(top:8,bottom:8,left:10,right:10),
              shape: RoundedRectangleBorder(

                borderRadius: BorderRadius.circular(30),
              ),
//             color: Colors.red,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Select an Address',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.close),
                            onPressed: () {
                              Navigator.pop(context); // Close the bottom sheet
                            },
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.black12,
                      indent: 10,
                      endIndent: 10,
                      height: 1,
                      thickness: 1,
                    ),
                    SizedBox(
                      height:15,
                    ),
                    Card(

                      margin: EdgeInsets.only(top:8,left:10,right:10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),

                      ),
//                   color:Colors.blueGrey,
                      elevation: 10,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          Container(
//                         color: Colors.grey,
//                         margin: EdgeInsets.only(top:8),
//                         decoration: BoxDecoration(
//                           color: Colors.grey.shade300,
//                           borderRadius: BorderRadius.circular(10),
//                         ),
                            child: Row(
                              crossAxisAlignment:CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
//                                 color: Colors.cyan,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
//                                       color: Colors.red,
                                        ),
                                        child: Radio(
                                          value: 1,
                                          groupValue: selectedValue,
                                          onChanged: _handleRadioValueChange,
                                          activeColor: Colors.orange,
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          // color: Colors.cyanAccent,
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 5,right:5),
                                              child: Text(
                                                "Home",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize:16,
                                                ),
                                                maxLines: 1,
                                                textAlign: TextAlign.start,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Container(
                                              width: 200,
                                              margin: EdgeInsets.all(5),
                                              child: Text(
                                                "24, Maruthu Pandiyar Street, Madurai - 625020.",
                                                textAlign: TextAlign.start,
                                                maxLines: 2,
                                              ),
                                            ),
                                            SizedBox(
                                              height:7,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Container(
                                  decoration: BoxDecoration(
//                                 color: Colors.red,
                                  ),
//                               alignment: Alignment.topRight,

                                  child:IconButton(
                                    icon: Icon(Icons.more_vert),
                                    onPressed: () {
                                      // Handle the ellipsis button press
                                    },
                                  ),

                                ),
                              ],
                            ),
                          ),



                        ],
                      ),



                    ),
                    Card(

                      margin: EdgeInsets.only(top:8,left:10,right:10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),

                      ),
//                   color:Colors.blueGrey,
                      elevation: 10,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          Container(
//                         color: Colors.grey,
//                         margin: EdgeInsets.only(top:8),
//                         decoration: BoxDecoration(
//                           color: Colors.grey.shade300,
//                           borderRadius: BorderRadius.circular(10),
//                         ),
                            child: Row(
                              crossAxisAlignment:CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
//                                 color: Colors.cyan,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
//                                       color: Colors.red,
                                        ),
                                        child: Radio(
                                          value: 1,
                                          groupValue: selectedValue,
                                          onChanged: _handleRadioValueChange,
                                          activeColor: Colors.orange,
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          // color: Colors.cyanAccent,
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 5,right:5),
                                              child: Text(
                                                "Home",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize:16,
                                                ),
                                                maxLines: 1,
                                                textAlign: TextAlign.start,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Container(
                                              width: 200,
                                              margin: EdgeInsets.all(5),
                                              child: Text(
                                                "24, Maruthu Pandiyar Street, Madurai - 625020.",
                                                textAlign: TextAlign.start,
                                                maxLines: 2,
                                              ),
                                            ),
                                            SizedBox(
                                              height:7,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Container(
                                  decoration: BoxDecoration(
//                                 color: Colors.red,
                                  ),
//                               alignment: Alignment.topRight,

                                  child:IconButton(
                                    icon: Icon(Icons.more_vert),
                                    onPressed: () {
                                      // Handle the ellipsis button press
                                    },
                                  ),

                                ),
                              ],
                            ),
                          ),



                        ],
                      ),



                    ),
//                 ***********

                    SizedBox(
                      height:10,
                    ),
                    Container(
                      width:screenWidth,
                      height: 50,


                      child: ElevatedButton(

                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orangeAccent,
                          foregroundColor: Colors.blue,

//                                       minimumSize: const Size.fromHeight(50),
                        ),

                        onPressed: () {},
                        child: Text('+ Add New Adderss', style: TextStyle(color: Colors.white)),
                      ),

                    ),
                    SizedBox(
                      height:10,
                    ),


//                ******************
                  ]
//               *******
              ),
            ),
          ),

//          *
        );
//         ********



      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _showBottomSheet(context);
          },
          child: Text('Show Bottom Sheet'),
        ),
      ),
    );
  }
}













