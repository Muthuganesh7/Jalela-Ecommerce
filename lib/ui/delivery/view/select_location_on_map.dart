import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lalela/constants/middleware.dart';
// import 'package:location/location.dart';
import 'dart:ui' as ui;
import '../../../constants/route_const.dart';
import '../../../constants/string_constant.dart';

class SelectLocationOnMap extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SelectLocationOnMapState();
  }

}
class SelectLocationOnMapState extends State<SelectLocationOnMap>{
  MiddleWare middleWare = MiddleWare();
  TextEditingController searchTextController = TextEditingController();
  BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;

  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();
  final Set<Marker> markers = new Set();
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(9.916826,78.132037),
    zoom: 17.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  // Location location = new Location();

  // late bool _serviceEnabled;
  // late PermissionStatus _permissionGranted;
  // late LocationData _locationData;


  // @override
  // Future<void> initState() async {
  //   // TODO: implement initState
  //   super.initState();
  //   // getMarkers();
  // }
  // getMarkers() async {
  //   sourceIcon = await getBitmapDescriptorFromAssetBytes("assets/images/grocery_one.png", 40);
  //
  //   _serviceEnabled = await location.serviceEnabled();
  //   if (!_serviceEnabled) {
  //     _serviceEnabled = await location.requestService();
  //     if (!_serviceEnabled) {
  //       return;
  //     }
  //   }
  //
  //   _permissionGranted = await location.hasPermission();
  //   if (_permissionGranted == PermissionStatus.denied) {
  //     _permissionGranted = await location.requestPermission();
  //     if (_permissionGranted != PermissionStatus.granted) {
  //       return;
  //     }
  //   }
  //
  //   _locationData = await location.getLocation();
  //   markers.add(Marker(
  //       rotation: _locationData == null ? 0 : _locationData!.heading!,
  //       icon: sourceIcon,
  //       markerId: MarkerId("sourceloc"),
  //       position: LatLng(_locationData.latitude!,_locationData.longitude!)
  //   ));
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(children: [
        GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
        Container(margin: EdgeInsets.only(top: kToolbarHeight),width: MediaQuery.of(context).size.width,child: getSearchBar(),)

      ],),
      bottomSheet: Container(
        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(10))),
        height: MediaQuery.of(context).size.height/3.2,child: Column(children: [
          middleWare.putSizedBoxHeight(20),
        getText("Oh, there you are!"),
        Divider(color: Colors.grey.shade300,thickness: 1,endIndent: 20,indent: 20,),
        Row(children: [
          middleWare.putSizedBoxWidth(10),
          Container(width: MediaQuery.of(context).size.width/9.9,child:SvgPicture.asset(
            'assets/images/location.svg',
            color: middleWare.uiThemeColor,
            width: 25.00,
            height: 25.00,
          ),),
          middleWare.putSizedBoxWidth(10),
          Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,children: [
            Container(alignment:Alignment.centerLeft,child: Text("Code Regime Technologies",style: middleWare.customTextStyle(15, Colors.black, FontWeight.normal)),),
            SizedBox(width: MediaQuery.of(context).size.width/1.5,child: Text("231C, 3Rd Floor, Kamarajar Salai, Madurai, Tamil Nadu 625009",overflow: TextOverflow.ellipsis,maxLines: 2,style: middleWare.customTextStyle(14, Colors.grey, FontWeight.normal)),)

      ],)
        ],),
        getSubmitButton()
      ],),),
    );
  }
  Future<BitmapDescriptor> getBitmapDescriptorFromAssetBytes(String path, int width) async {
    final Uint8List imageData = await getBytesFromAsset(path, width);
    return BitmapDescriptor.fromBytes(imageData);
  }
  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }

  getSubmitButton(){
    return Container(
      margin: EdgeInsets.only(
        top: middleWare.minimumPadding * 4,
        // bottom: middleWare.minimumPadding * 5,
        left: middleWare.minimumPadding * 4,
        right: middleWare.minimumPadding * 4,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: middleWare.uiThemeColor,
          foregroundColor: middleWare.uiThemeColor,
          padding: EdgeInsets.only(
            top: middleWare.minimumPadding * 3,
            bottom: middleWare.minimumPadding * 3,
            left: middleWare.minimumPadding *
                7,
            right: middleWare.minimumPadding * 7,
          ),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(useThisLocation,
                style: middleWare.customTextStyle(
                    17.00, Colors.white, FontWeight.bold)),
            SizedBox(
              width: 8,
            ),
            // ViewState.BUSY == ViewState.BUSY
            //     ? Container(
            //   width: 25,
            //   height: 25,
            //   child: CircularProgressIndicator(
            //     valueColor:
            //     new AlwaysStoppedAnimation<Color>(Colors.white),
            //   ),
            // )
            //     : Container()
          ],
        ),
        onPressed: () async {
          Navigator.pushNamed(context, RoutePaths.OtpVerification);
        },
      ),
    );

  }
getText(txt){
    return Container(alignment:Alignment.centerLeft,margin:EdgeInsets.only(left: 20,top: 10),child: Text(txt,style: middleWare.customTextStyle(15, Colors.black, FontWeight.normal)),);
}
  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
  Container getSearchBar() {
    return Container(

      margin: EdgeInsets.only(
        left: middleWare.minimumPadding * 4,
        right: middleWare.minimumPadding * 4,
      ),
      child:  TextFormField(
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
              fillColor: Colors.white
          ),
          /*onChanged: onSearchTextChanged,*/
        // ),
      ),
    );
  }

}