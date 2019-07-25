






import 'package:liupeng_weather_flutter/new/pageJump/fristPage.dart';
import 'package:liupeng_weather_flutter/new/pageJump/pageJump.dart';
import 'package:liupeng_weather_flutter/new/pageJump/secondPage.dart';
import 'package:liupeng_weather_flutter/new/pageJumpII/pageA.dart';
import 'package:liupeng_weather_flutter/new/pageJumpII/pageB.dart';
import 'package:liupeng_weather_flutter/new/setting/settingPage.dart';
import 'package:liupeng_weather_flutter/new/valuePass/functionII/numberPage.dart';
import 'package:liupeng_weather_flutter/new/valuePass/functionII/phonePage.dart';

const pageForJump1 = "/pages/pageJump/fristPage.dart";
const pageForJump2 = "/pages/pageJump/secondPage.dart";
const pageForJump3 = "/pages/pageJump/pageJump.dart";
const pageA = "/a";
const pageB = "/b";
const numberPage = "/numberPage";
const phonePage = '/phonePage';
const settingSystemColors = '/setttingColor';

// final router = Router();

var RoutePath = {
  "$pageForJump1" : (context) => FirstScreen(),
  "$pageForJump2" : (context) => SecondScreen(),
  "$pageForJump3" : (context) => ThirdScreen(),
  "${pageA}" : (context) => PageA(),
  "${pageB}" : (context) => PageB(),
  "${PhonePage}" : (context) => PhonePage(),
  "${numberPage}" : (context) => NumberPage(),
  "${settingSystemColors}" : (context) => SettingSystemColors(),
};


