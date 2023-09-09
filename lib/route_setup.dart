import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lalela/ui/cart/view/cart_page.dart';
import 'package:lalela/ui/cart/view/coupon.dart';
import 'package:lalela/ui/cart/view/payment.dart';
import 'package:lalela/ui/category/categories.dart';
import 'package:lalela/ui/category/category_details.dart';
import 'package:lalela/ui/delivery/view/chosse_delivery_location.dart';
import 'package:lalela/ui/delivery/view/select_location_on_map.dart';
import 'package:lalela/ui/home/view/bottom_navigation.dart';
import 'package:lalela/ui/loginandregister/view/mobilevalidation.dart';
import 'package:lalela/ui/loginandregister/view/otp_verification.dart';
import 'package:lalela/ui/loginandregister/view/register.dart';
import 'package:lalela/ui/onboarding/onboarding_four.dart';
import 'package:lalela/ui/onboarding/onboarding_one.dart';
import 'package:lalela/ui/onboarding/onboarding_three.dart';
import 'package:lalela/ui/onboarding/onboarding_two.dart';
import 'package:lalela/ui/products/view/product_details.dart';
import 'package:page_transition/page_transition.dart';

import 'constants/route_const.dart';
import 'main.dart';

abstract class RouterViews {
  // ignore: missing_return
  static Route<dynamic> generateRoute(RouteSettings settings) {
      switch (settings.name) {
        case RoutePaths.onBoardPage1:
          return PageTransition(child: OnBoardingOne(),type: PageTransitionType.rightToLeft,duration: Duration(milliseconds: 400));
        case RoutePaths.onBoardPage2:
          return PageTransition(child: OnBoardingTwo(),type: PageTransitionType.rightToLeft,duration: Duration(milliseconds: 400));
        case RoutePaths.onBoardPage3:
          return PageTransition(child: OnBoardingThree(),type: PageTransitionType.rightToLeft,duration: Duration(milliseconds: 400));
        case RoutePaths.onBoardPage4:
          return PageTransition(child: OnBoardingFour(),type: PageTransitionType.rightToLeft,duration: Duration(milliseconds: 400));
        case RoutePaths.Login:
          return PageTransition(child: MobileVerificationPage(),type: PageTransitionType.rightToLeft,duration: Duration(milliseconds: 400));
        case RoutePaths.OtpVerification:
          return PageTransition(child: OtpVerificationPage(),type: PageTransitionType.rightToLeft,duration: Duration(milliseconds: 400));
        case RoutePaths.Register:
          return PageTransition(child: Register(),type: PageTransitionType.rightToLeft,duration: Duration(milliseconds: 400));
        case RoutePaths.Home:
          return PageTransition(child: BottomNavigationBarExample(),type: PageTransitionType.rightToLeft,duration: Duration(milliseconds: 400));
        case RoutePaths.Category:
          return PageTransition(child: CategoriesPage(),type: PageTransitionType.rightToLeft,duration: Duration(milliseconds: 400));
        case RoutePaths.CategoryDetails:
          return PageTransition(child: CategoryDetails(),type: PageTransitionType.rightToLeft,duration: Duration(milliseconds: 400));
        case RoutePaths.ProductDetails:
          return PageTransition(child: ProductDetailsPage(),type: PageTransitionType.rightToLeft,duration: Duration(milliseconds: 400));
        case RoutePaths.ChooseDeliveryLocations:
          return PageTransition(child: ChooseDeliveryLocationPage(),type: PageTransitionType.rightToLeft,duration: Duration(milliseconds: 400));
        case RoutePaths.SelectLocationOnMap:
          return PageTransition(child: SelectLocationOnMap(),type: PageTransitionType.rightToLeft,duration: Duration(milliseconds: 400));
        case RoutePaths.Cart:
          return PageTransition(child: CartPage(),type: PageTransitionType.rightToLeft,duration: Duration(milliseconds: 400));
        case RoutePaths.Coupon:
          return PageTransition(child: CouponList(), type: PageTransitionType.rightToLeft,duration: Duration(milliseconds: 400));
        case RoutePaths.PaymentMethod:
          return PageTransition(child: PaymentPage(), type: PageTransitionType.rightToLeft,duration: Duration(milliseconds: 400));

        default:
          return MaterialPageRoute(
              builder: (_) => Scaffold(
                    body: Center(
                      child: Text('No route defined for ${settings.name}'),
                    ),
                  ));
      }
  }
}
