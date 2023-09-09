import 'dart:io';
import 'dart:math';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';


const bool isLogEnabled = true;

final youtubeRegExp1 = RegExp(
    r"^https:\/\/(?:www\.|m\.)?youtube\.com\/watch\?v=([_\-a-zA-Z0-9]{11}).*$");
final youtubeRegExp2 = RegExp(
    r"^https:\/\/(?:www\.|m\.)?youtube(?:-nocookie)?\.com\/embed\/([_\-a-zA-Z0-9]{11}).*$");
final youtubeRegExp3 = RegExp(r"^https:\/\/youtu\.be\/([_\-a-zA-Z0-9]{11}).*$");

final emailRegEx = RegExp(
    "^[a-zA-Z0-9.!#\$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*\$");

final mobileRegEx = RegExp(r'(^(?:[+0]9)?[0-9]{10,11}$)');

final networkUrlRegex =
    RegExp("^(https?)://[-a-zA-Z0-9+&@#/%?=~_|!:,.;]*[-a-zA-Z0-9+&@#/%=~_|]");

final networkUrlRegex1 = RegExp(
    "https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)");

//final matches = regex.allMatches(link);

showLog(message) {
  if (isLogEnabled) {
    print("AEL: " + message);
  } else {}
}


bool isValidYoutubeUrl(String youtubeUrl) {
  if (youtubeRegExp1.hasMatch(youtubeUrl))
    return true;
  else if (youtubeRegExp2.hasMatch(youtubeUrl))
    return true;
  else if (youtubeRegExp3.hasMatch(youtubeUrl))
    return true;
  else
    return false;
}

_validateUrl(String url) {
  if (url?.startsWith('http://') == true ||
      url?.startsWith('https://') == true) {
    return url;
  } else {
    return 'http://$url';
  }
}

bool isNullOrEmpty(String str) {
  if (str == null) {
    return true;
  }
  if (str.isEmpty) {
    return true;
  }
  return false;
}

Future<Map<String, String>> getDeviceDetails() async {
  String deviceName="";
  String deviceVersion="";
  String identifier="";
  final DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();
  try {
    if (Platform.isAndroid) {
      var build = await deviceInfoPlugin.androidInfo;
      deviceName = build.model??"";
      deviceVersion = build.version.toString();
      identifier = build.androidId??""; //UUID for Android
    } else if (Platform.isIOS) {
      var data = await deviceInfoPlugin.iosInfo;
      deviceName = data.name??"";
      deviceVersion = data.systemVersion??"";
      identifier = data.identifierForVendor??""; //UUID for iOS
    }
  } on PlatformException {
    showLog('Failed to get platform version');
  }
  return {
    'deviceName': deviceName ??"",
    'deviceVersion': deviceVersion ?? '',
    'deviceId': identifier ?? ''
  };
}

String randomFileNameGenerator(String fileName) {
  String name;
  Random rnd = new Random();
  name = fileName + '/' + (100000 + rnd.nextInt(900000)).toString();
  return (name);
}
