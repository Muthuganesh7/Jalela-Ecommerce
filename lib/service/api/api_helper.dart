import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../../constants/middleware.dart';
import '../../constants/shared_preference_const.dart';
import '../../constants/shared_preference_helper.dart';
import '../../utils/common_utils.dart';
import '../../constants/api_url_const.dart';

class APIHelper{
  MiddleWare middleWare = MiddleWare();
  var soapHeader = {
    'Content-type': 'text/xml',
  };
  requestRestApi(BuildContext context, Map<String, dynamic> params,
      {MethodType methodType = MethodType.POST,
        String nameSpace = apiUrl,
        bool isForeground = true}) async {
    try {
      var restHeader ={'Authorization': 'Bearer ${await PreferenceHelper.getString(PreferenceConst.accessToken)}'};
      showLog('REST Request: Url:$nameSpace, Body:${json.encode(params)}, headers:$restHeader}');
      var response = methodType == MethodType.POST
          ? await http.post(Uri.parse(nameSpace),
          body: params, headers:  restHeader)
          : await http.get(
          Uri.parse(nameSpace),headers: restHeader /*headers: restHeader*/
      );
      showLog('REST Response Body: STATUS => ${response.statusCode} :: BODY => ${response.body}');
      if (response.statusCode != null && response.statusCode == 200) {
        return response.body;
      } else {
        middleWare.showToastMsg(
            "${middleWare.validString(response.statusCode.toString())} ${middleWare.validString(response.body)}",
            13.00,
            Colors.red,
            Colors.yellow,
            Toast.LENGTH_SHORT);
        return response.body;
      }
    } on SocketException {
      showLog('No network connection');
      if (isForeground) {
        if (context != null) {
          middleWare.showToastMsg("You are Offline", 13.00, Colors.red,
              Colors.yellow, Toast.LENGTH_SHORT);
          //showOfflineSnackBar(context);
        }
      }
    }
  }

}
enum MethodType { POST, GET }